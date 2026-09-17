# Editing the collections stage

This stage descends directly from `communitygeography-reorg` at `43e9189` / `reorganization-baseline`. Its purpose is consistent records and presentation, using the existing UNM/Xanthan appearance. The separate blue/plum visual mockup is not included.

Edit these files in the [browser VS Code editor](https://github.dev/amaranth-unm/communitygeography-collections). Use **Source Control → Commit & Push** to save changes to GitHub. Changes reaching `main` are checked and published automatically; changes on another branch must be merged into `main` first. No local development or terminal commands are required. See the [scripts and automation guide](../scripts/README.md) for the full publishing process and every script's purpose.

## Where content lives

| Location | Maintained content |
| --- | --- |
| `_events/YYYY/` | 45 events: 43 standalone records and two formerly embedded DeVivo announcements. |
| `_news/YYYY/` | 39 stories: 38 standalone stories and the article formerly maintained inside the 2026 year page. |
| `_people/` | 15 directory entries: five team members and ten affiliates, including a short entry with no biography. |
| `pages/events/` | Archive and upcoming landing pages, generated from event records. |
| `pages/news/` | Year landing pages, news index, and the inherited empty example page. New years generate automatically. |
| `pages/about/` | Directory wrappers, history, mission, and contact pages. Past team names and the affiliation notice remain in these wrappers. |
| `pages/projects/` | Ordinary project pages with descriptive source names; the GIS Day gallery remains at its old public URL. |
| `assets/images/`, `assets/documents/` | Organized media inherited from the reorganization stage. |

Source names are independent of public addresses. Keep existing `permalink` values to preserve external links. The original capture manifest is unchanged; use `reorganization-map.json` followed by `collection-moves.json` to follow file moves.

## Add or edit an event

Create one Markdown file under its start year. Keep dates and times quoted:

```yaml
---
title: Community mapping workshop
permalink: /events/community-mapping-workshop.html
start_date: '2027-03-12'
end_date: '2027-03-12'
start_time: '14:00'
end_time: '16:00'
location: Confirmed venue
presenter: Confirmed presenter
---
The description goes here in Markdown.
```

Times, end date, presenter, and location may be omitted when genuinely unavailable. Do not turn missing times into midnight. Imported `source_url` values preserve provenance; new authored material does not require a source URL.

For a flyer, add `flyer: /assets/images/events/2027/workshop/flyer.png` and a useful `flyer_alt`. The shared layout displays the complete image without cropping and links to the full-size file. Inline photographs or maps remain ordinary content where appropriate; not every image is a flyer or Xanthan figure.

The record appears in the event archive and search. The upcoming list includes events through their final calendar day, based on America/Denver and the build date. It updates when built; the Pages workflow also runs daily. `date_review: true` excludes an unresolved date from scheduling while preserving the event page and archive entry. The archive is an inclusive chronological directory; the upcoming view is the date-filtered subset.

## Add or edit news

Create `_news/YYYY/descriptive-story-name.md` with `title`, `permalink`, and a quoted `published_date: 'YYYY-MM-DD'`, then the story in Markdown. The news index and the matching year page update automatically; a new year page is generated when needed. Add a unique numeric `featured_order` only when the story belongs in the curated homepage list. Older homepage selections have been preserved; newer content is not automatically promoted.

If the source supplies only an archive year, use `published_year: '2026'` instead of inventing a date. The 2026 DeVivo article demonstrates this. Event dates are not publication dates. A story may optionally use `image` and `image_alt` for the shared portrait/lead-image pattern; retain suitable inline media for flyers, maps, and complex stories.

The 2026 year page renders its original unique article from the new record, so its text remains available at the historical year URL. The unavailable 2022 workshop announcement link remains in the 2022 page because its missing target does not justify inventing an article. The faculty-affiliate application announcement remains news even though it includes application opening/closing fields. The empty `example-page.md` is preserved outside the collection.

## Add or edit a person

Create one Markdown record in `_people/` with `name`, `role`, `affiliation`, `groups: [team]` or `[affiliates]`, numeric `display_order`, and a stable unique `anchor`. Add optional `image`, `image_alt`, and `expertise`; keep the biography in the Markdown body. The appropriate directory and its search content update automatically. People have no standalone public pages, avoiding empty or duplicated profile destinations.

Keep existing anchors and ordering. The Benson/Morgan identity conflict is documented in both records and has not been resolved by merging biographies. The short past-members list remains simple text because it contains no maintained biographies.

## Shared patterns and limits

- `_layouts/event-unm.html` and `news-unm.html` supply standard headings and metadata. Repeated details are no longer maintained in separate event listings.
- `_includes/community/people.html` replaces portrait floats with a responsive layout. `_data/gis-day-gallery.yml` holds 14 images; the gallery keeps all images uncropped with full-size links.
- The DeVivo PDF is an ordinary descriptive download link. No screenshot derivative is required.
- `center_banner` in `_config.yml` configures the existing banner. Shared UNM components remain in `_includes/unm/` and `_layouts/`.
- `assets/css/collections.css` contains only these presentation patterns. It is separate from a future visual redesign.
- The Optimize Images workflow is inherited and available. No compression or resampling has been applied; original bytes remain the comparison point. Review photographs separately from detailed flyers/maps before approving an optimization batch.
- Projects remain ordinary pages with their existing card data. Their separate collection conversion was not part of the requested event/news/people scope.

## Check your changes on GitHub

Open the repository's **Actions** tab, select **Deploy Jekyll site to Pages**, and open the run for your commit. GitHub performs the build and checks automatically. To rebuild without changing content, select **Run workflow** on `main`.

If a step fails, open its log to find the named file and error, correct the content in the browser editor, and commit again. The previous published site remains in place when a build or check fails. Once **build** and **deploy** succeed, use the deployment link to inspect the result. The browser editor cannot run the complete Jekyll site, and a separate draft preview is not configured.

Build-time checks catch missing record fields, bad date/time formats, unflagged reversed dates, year-folder mismatches, missing images/alternatives, duplicate output URLs, and conflicting directory anchors. Output checks cover records in search, biographies searchable through directories, full-size gallery links, and original routes. See the [scripts and automation guide](../scripts/README.md) for check details, common errors, and the historical comparison tools that are not part of publishing.
