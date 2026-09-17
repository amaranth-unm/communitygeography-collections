#!/usr/bin/env ruby
# Compare a built baseline with this built stage; source moves must not redesign it.
require 'json'
require 'digest'
require 'yaml'

baseline = File.expand_path(ARGV.fetch(0))
current = File.expand_path(ARGV.fetch(1, '_site'))
mapping = JSON.parse(File.read('migration/reorganization-map.json'))
config = YAML.load_file('_config.yml')
base = config.fetch('baseurl')
base = YAML.load_file('_config.ci.yml').fetch('baseurl', base) if File.file?('_config.ci.yml')
normalize = lambda do |text|
  result = text.gsub('/communitygeography-orig', '/STAGE').gsub(base, '/STAGE')
  mapping['assets'].sort_by { |m| -m['to'].length }.each do |move|
    result = result.gsub('/' + move['to'], '/' + move['from'])
  end
  result
end
errors = []
pages = mapping['pages'].map { |p| p['permalink'].delete_prefix('/') } + ['404.html']
pages.each do |path|
  before, after = File.join(baseline, path), File.join(current, path)
  if !File.file?(after) || normalize.call(File.read(before)) != normalize.call(File.read(after))
    errors << "Rendered page differs: #{path}"
  end
end
mapping['assets'].each do |move|
  expected = Digest::SHA256.file(File.join(baseline, move['from'])).hexdigest
  [move['from'], move['to']].each do |path|
    actual = File.join(current, path)
    errors << "Asset differs/missing: #{path}" unless File.file?(actual) && Digest::SHA256.file(actual).hexdigest == expected
  end
end
before_index = JSON.parse(normalize.call(File.read(File.join(baseline, 'assets/search-index.json')))).sort_by { |p| p['url'] }
after_index = JSON.parse(normalize.call(File.read(File.join(current, 'assets/search-index.json')))).sort_by { |p| p['url'] }
errors << 'Search records differ' unless before_index == after_index
abort errors.join("\n") unless errors.empty?
puts "PASS: #{pages.size} complete HTML pages match after repository-prefix and asset-path normalization."
puts "PASS: #{mapping['assets'].size} assets retain identical bytes at canonical and legacy URLs; search records match."
