#!/usr/bin/env ruby
require 'jekyll'
require_relative '../_plugins/collection-records'

class EventDateTest
  def assert(value)
    raise 'Expected true' unless value
  end
  def refute(value)
    raise 'Expected false' if value
  end
  def assert_raises(type)
    begin
      yield
    rescue type
      return
    end
    raise "Expected #{type}"
  end
  def test_single_day_remains_visible_through_its_calendar_day
    event = {'start_date' => '2026-09-17'}
    assert CommunityRecords.upcoming?(event, Date.new(2026,9,17))
    refute CommunityRecords.upcoming?(event, Date.new(2026,9,18))
  end
  def test_multiday_event_remains_visible_through_its_end
    event = {'start_date' => '2026-09-15', 'end_date' => '2026-09-18'}
    assert CommunityRecords.upcoming?(event, Date.new(2026,9,17))
    assert CommunityRecords.upcoming?(event, Date.new(2026,9,18))
    refute CommunityRecords.upcoming?(event, Date.new(2026,9,19))
  end
  def test_unresolved_dates_are_not_scheduled
    refute CommunityRecords.upcoming?({'start_date' => '2030-01-01', 'date_review' => true}, Date.new(2026,9,17))
  end
  def test_missing_times_are_not_required_and_invalid_dates_fail
    assert CommunityRecords.upcoming?({'start_date' => '2030-01-01'}, Date.new(2026,9,17))
    assert_raises(Date::Error) { CommunityRecords.validate_date!('2026-02-30', 'example') }
    assert_raises(ArgumentError) { CommunityRecords.validate_date!('09/17/2026', 'example') }
  end
end
test = EventDateTest.new
methods = EventDateTest.instance_methods(false).grep(/^test_/)
methods.each { |method| test.public_send(method) }
puts "Passed #{methods.size} calendar boundary and validation cases."
