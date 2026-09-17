---
title: Upcoming Events
permalink: /events/index1.html
source_url: https://communitygeography.unm.edu/events/index1.html
section: Events
section_url: /events/index2.html
---

# Upcoming Events

<span id="people-list-container"></span>

{% include community/upcoming-events.html %}
<span id="upcoming-events-1"></span>

## Previous announcements

{% assign announcements = site.events | where: "legacy_upcoming", true | sort: "start_date" %}
{% for event in announcements %}
<h2 id="{{ event.heading_id }}"><a href="{{ event.url | relative_url }}">{{ event.title | escape }}</a></h2>
{% include community/event-details.html event=event %}
{{ event.content | markdownify }}
{% endfor %}
