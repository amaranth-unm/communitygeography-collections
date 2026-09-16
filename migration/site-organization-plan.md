# Community Geography: specific Tier 2 and Tier 3 recommendations

**Status: proposal, based on the migrated files inspected September 14, 2026, with the preservation preference clarified September 16.** No content pages or public media have been moved. Migration working files and branding references have been consolidated as described in the [migration notes](README.md). Use this alongside the [three-tier cleanup roadmap](cleanup-roadmap.md).

Preserve the original content structure as much as possible. Keep `community-geography/` because it is the original Community section; its shorter navigation label does not require a source-folder rename. Optional improvements include one editable record per event, news story, project, or substantial biography and lists generated from those records. Organization should make a routine update easier, rather than simply reduce the number of files.

The current housekeeping convention uses one `migration/` folder: tracked documentation and references, plus a Git-ignored `_work/` subfolder for local captures and scratch files. Active UNM branding belongs in the existing `_includes/unm/`, `_layouts/`, and `assets/` folders. Its archived reference copy lives under `migration/reference/`.

## What is actually in this site

| Area | Current contents | Specific problem to address |
| --- | --- | --- |
| `events/` | 67 files, all directly in one folder: 34 Markdown pages and 33 media files. | Two landing pages, 32 event detail pages, portraits, and flyers share one flat list. |
| `news/` | 75 files, all directly in one folder: 47 Markdown pages and 28 other files. | Individual stories, year pages, event announcements, and media are mixed together. |
| `projects/` | 21 Markdown pages and 35 other files across several folders. | Project details repeat directory data; the page labeled Past Projects contains a photo gallery. |
| `about/` | Five Markdown pages and 20 other files. | Long biographies and floated portraits are maintained inside large directory pages. |

The event folder does not contain every event. Reviewing pages with a standalone `Start:` block identifies **43 likely event records**: 32 in `events/`, nine at the repository root, and two coffee events in `news/`. Their recorded start years are 2023 (five), 2024 (17), and 2025 (21). This is a candidate inventory, not a complete calendar: some events exist only inside landing/year pages.

An affiliates application announcement also has Start/End fields. It should remain an announcement, rather than become a calendar event solely because those fields exist. Classify by the content's purpose, not its current folder or metadata alone.

## Optional folder schema for later improvements

This is an **optional destination if collections are adopted**, not the default structure for every migration. The existing content folders and source names can remain in place. Choose a different destination only for a demonstrated editing benefit, and move affected records directly there to avoid repeated reorganizations.

```text
about/                              ordinary explanatory and directory pages
community-geography/
funding/
events/
  upcoming.md                       event landing pages
  archive.md
news/
  index.md
  2026.md                           year landing pages
projects/
  index.md                          project landing pages

_events/                            one Markdown file per event
  2023/
    lobo-garden-fall-party.md
  2024/
  2025/
    gis-day.md
    monthly-coffee-social.md
_news/                              one Markdown file per story
  2025/
  2026/
_projects/                          one Markdown file per project
  agricultural-connections.md
_people/                            one Markdown file per substantial biography
  claudia-pratesi.md

assets/
  images/
    events/2025/gis-day/             flyer and event photographs
    news/2026/                      subfolder per story when needed
    projects/agricultural-connections/
    people/                         consistently named portraits
    shared/                         reused images without one content owner
  documents/
    events/2025/gis-day/             downloadable PDFs and other documents
    funding/

_data/                              short lists and shared settings
migration/                          inventory, decisions, URL mappings, guides
```

Folders beginning with `_` here are Jekyll collections: related Markdown records that layouts can use to generate pages and lists. They need to be registered in the site configuration. [Jekyll collections documentation](https://jekyllrb.com/docs/collections/).

For future migrations, preserve original content folders first. Apply these conventions to new material or a deliberately chosen reorganization rather than requiring every folder:

- Group events by **event start year** and stories by **publication year**. At this site's volume, month folders would add unnecessary navigation.
- Give people and projects stable descriptive filenames without year folders; their records can span years.
- Use short, lowercase, hyphenated filenames. Avoid CMS suffixes such as `1`, `2`, `display-name`, and `test-project` in new source names. Distinguish similar events with a date or short subject when needed.
- Keep images separate from downloadable documents. Create an item-specific media folder when several files belong together; store shared media once and reference it from multiple records.
- Keep long-form content in Markdown. Use YAML for short structured lists and shared settings, rather than large paragraphs embedded in YAML strings.
- Keep imported assets in their current locations until their old public URLs have a preservation plan. This tree describes the destination for organized assets, not permission to move all existing images immediately.

## Optional source-file changes

These examples show possible moves if the related improvement is adopted; none is required for baseline cleanup. Each preserves the page's existing `permalink`. The file an editor opens can have a useful name while the published address stays the same. Jekyll explicitly supports separating source organization from output paths through [permalinks](https://jekyllrb.com/docs/permalinks/).

| Existing source | Proposed source | Public path to preserve |
| --- | --- | --- |
| `events/index1.md` | `events/upcoming.md` | `/events/index1.html` |
| `events/index2.md` | `events/archive.md` | `/events/index2.html` |
| `events/-display-name.md` | `_events/2023/lobo-garden-fall-party.md` | `/events/-display-name.html` |
| `events/gis-day-2025.md` | `_events/2025/gis-day.md` | `/events/gis-day-2025.html` |
| `events/ges-colloquium1.md` | `_events/2025/wildlife-monitoring-colloquium.md` | `/events/ges-colloquium1.html` |
| `news/monthly-coffee-social.md` | `_events/2025/monthly-coffee-social.md` | `/news/monthly-coffee-social.html` |
| `faculty-search-colloquium-dr-molly-miranker.md` | `_events/2025/molly-miranker-colloquium.md` | `/faculty-search-colloquium-dr-molly-miranker.html` |
| `projects/project/test-project-1.md` | `_projects/agricultural-connections.md` | `/projects/project/test-project-1.html` |

**Media needs a different treatment.** A page's permalink does not preserve the address of a moved static image or PDF. Initially, leave existing media in place and use the new asset folders for new uploads. If fully clearing legacy folders becomes worthwhile, maintain a reviewed old-URL → canonical-file mapping and generate compatibility copies during the build. Old image URLs must still return images; an HTML redirect is not an image replacement. Avoid manually maintaining duplicate originals.

Retain [manifest.json](manifest.json) as the capture baseline. Record later source moves and media aliases in a separate migration mapping. Preserve existing anchors and use the route/link checks after each batch.

## Tier 2: presentation and organization for this site

| Priority | Specific work | What completion would look like |
| --- | --- | --- |
| **T2-1: Events and media inventory** | Classify the 67 event-folder files, the 11 likely events elsewhere, and the events embedded in landing/year pages. Record each asset's references and intended owner. Document which existing files supply the two landing pages; rename only if an editor finds it useful. | An editor can distinguish landing pages, individual events, and media while retaining the original structure. No file is deleted merely because its name is odd or no internal link was found. |
| **T2-2: Event presentation** | Try one consistent detail-page treatment on GIS Day, a colloquium, and a coffee social: title, date/time, location, description, and optional flyer. Keep flyers uncropped and readable; retain a link to the full image/download. | The three pages work on phones without separate image widths and spacing decisions for each page. Metadata extraction can follow in Tier 3. |
| **T2-3: PDF and gallery handling** | In [2026 news](../news/2026.md), an image element points at `april10_drdevivo_talk_flyer.pdf`; inspection confirms an actual PDF. Provide a labeled download and, if useful, a generated image preview. Give the 14 GIS Day photographs on [Past Projects](../projects/past-projects/index.md) a consistent gallery treatment. | The flyer is accessible as a document, and photographs have usable thumbnails and full-size links. Both retain original public asset paths. |
| **T2-4: Portraits, cards, and headers** | Replace fragile profile floats with a consistent people layout. Define thumbnail behavior for project cards, preserving posters' text. Use a text-led heading for ordinary event/news pages; reserve heroes for pages that benefit from them. Keep the UNM bar/logo/footer shared, and move the center banner's settings out of hardcoded layout markup. | A small set of documented patterns replaces per-page dimensions. No automatic conversion of every first image into a hero. |
| **T2-5: Image optimization** | Use the restored [Optimize Images workflow](image-optimization.md), starting with a preview for `events`. Agree on display dimensions before applying a batch; check flyer text at the resulting size. | A recorded before/after size result and legible images with unchanged URLs. The successful whole-site preview found about 67% potential savings; images have not yet been changed. |
| **T2-6: Adoption guide** | Add short examples for a flyer, ordinary image, portrait, gallery, and PDF; specify upload destinations from the schema above. | A new editor knows which folder and image pattern to use without inspecting older pages. |

Use Xanthan's figure include for suitable captioned figures after checking its behavior. People, cards, galleries, and event flyers benefit from components designed for those uses; the roadmap's [image guidance](cleanup-roadmap.md#should-every-image-use-a-xanthan-include) explains why a blanket include replacement is unnecessary.

## Tier 3: reduce repeated editing

### T3-1. Events: the first demonstration

Create an events collection with one Markdown record per event. Move the confirmed candidates into year folders, retaining their public permalinks and source provenance. Store title, start date, optional end date/times, location, presenter, and optional flyer path in the opening metadata; keep the description in the Markdown body.

For example, the existing [GIS Day record](../events/gis-day-2025.md) supplies these proposed fields:

```yaml
title: GIS Day 2025
permalink: /events/gis-day-2025.html
start_date: "2025-11-19"
end_date: "2025-11-19"
start_time: "10:00"
end_time: "14:00"
location: "UNM SUB: (3rd Floor) Navajo Lounge and Lobo A/B"
flyer: /events/gis-day.png
```

This is a field example, not a replacement for the full record. Retain the existing presenter, description, provenance, links, and anchors. A flyer also needs an intentional text alternative when rendered. Use a documented local timezone for timed events after confirming the convention with the editor; do not invent times or convert missing times to midnight. Keep event dates separate from publication dates.

Generate the archive, upcoming list, and any homepage event summaries from those same records. A series overview can link to its individual sessions; do not treat them as duplicates. A recap can be a news story linked to the event.

**Demonstration:** add one event file and its flyer, then see the event page and relevant lists update without editing each list. Initially pilot three confirmed records, retaining the remaining hand-edited entries until their replacement is verified.

### T3-2. People: Markdown biographies, small structured fields

Use `_people/` for the substantial biographies in [Affiliates](../about/affiliates.md) and [Our Team](../about/our-team.md). Store name, role, department, image, image alternative, group membership, and display order as metadata, with the biography below. Generate the existing directory pages while preserving their order and anchors.

A person can belong to both team and affiliates without two maintained biographies. Separate profile URLs are optional; the collection can feed the directories without publishing individual pages. A short past-members list may remain YAML if it contains only names and roles. Confirm current affiliations separately from moving the existing content.

### T3-3. Projects: eliminate the parallel directory record

Currently [_data/projects.yml](../_data/projects.yml) supplies directory cards while project pages repeat titles and dates. Make `_projects/` the maintained source for both detail pages and cards. Use structured dates and an explicit ongoing state; preserve uncertain dates for review rather than parsing every display string automatically.

The [agricultural connections StoryMap](../projects/project/test-project-1.md) is a real project despite its `test-project-1` filename. Give its source a descriptive name and retain its URL.

The current **Past Projects URL contains the 2025 GIS Day gallery**, not a project archive. Keep that gallery at its existing address and link it to the GIS Day event. Decide separately where an actual past-projects list belongs and update the navigation accordingly. Do not overwrite the gallery to make its folder label seem correct.

### T3-4. News: distinguish stories from year pages

Move individual stories into `_news/YYYY/` and generate year indexes and homepage news selections from those records. Preserve explicit editorial choices about featured items rather than assuming the newest story always belongs first.

First review each year page: some contain unique article text rather than just links. Extract that text into records before replacing the page with a generated list, and preserve its old URL and anchors. Keep application announcements as news; move the two standalone coffee events into the events collection while preserving their `/news/…` public paths.

## Decisions to flag before automatic lists

- [Upcoming Events](../events/index1.md) labels the DeVivo visit April 2026, but the public-talk paragraph says April 2025. [2026 news](../news/2026.md) says 2026. Resolve the dates with the editor before generating calendar placement. The existing page also displays “No upcoming events found” below these entries. Neither April year is upcoming at the September 2026 audit date.
- [Spring Garden Party](../events/spring-garden-party.md) has the front-matter title “The Center for Community Geography.” Confirm the appropriate title before using it automatically in lists.
- [GIS Day](../events/gis-day-2025.md) gives the Geography Showcase time as “11:15 PM - 1:15 PM,” despite the overall event running 10am–2pm. Flag the session time rather than silently correcting it while extracting dates.
- The affiliates application announcement's Start/End fields do not make it an event. Dates, filenames, and current folder placement are useful clues, not a substitute for classification.

## Implementation order and checks

1. Finish the agreed Tier 1 sample cleanup. Then record the file classification and adopt the new-upload convention; publish this plan as the editor's reference.
2. Pilot the event presentation and collection with GIS Day, one colloquium, and one coffee event. Keep all old public paths, content, and remaining archive entries working during the transition.
3. Register the new collection and its layout in [_config.yml](../_config.yml). Moving files into an underscore folder alone is not sufficient. Check that future events produce public pages as well as list entries.
4. Update [the search index](../assets/search-index.json): it currently reads only `site.pages`. Include published event/news/project documents when those collections are introduced. People without standalone pages should remain discoverable through their directory pages, not nonexistent profile links.
5. Extend checks to catch duplicate output URLs, invalid required dates, missing referenced media, lost search entries, and inconsistent event filename/year metadata. Run existing route/link checks and compare wording, anchors, and asset paths with the baseline. Visually review the three page patterns on desktop and phone.
6. Define how upcoming events age out. A generated static list changes only when the site rebuilds. Add a daily Pages rebuild if date-driven lists are adopted, and test events at date boundaries, including multiday and undated records.
7. Migrate the remaining confirmed events and replace manually repeated event lists after comparing their contents. Then tackle people, projects, and news in separate, reviewable batches. Retire duplicated records only after the generated replacement preserves their content and links.

Success is an editor adding or updating one record in a predictable place and seeing every appropriate view update. A smaller, tidier folder is useful evidence of that improvement, but is not the completion criterion by itself.
