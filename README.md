# Community Geography — organized files, same site

This organization-only demonstration starts at the frozen `migration-baseline` tag, commit `52a5d70`, in `amaranth-unm/communitygeography-orig`.

| Stage | Purpose |
| --- | --- |
| [communitygeography-orig](https://github.com/amaranth-unm/communitygeography-orig) | Converted baseline, with documented conversion repairs. |
| **communitygeography-reorg** | Same rendered pages, organized source files and media. |
| [communitygeography-collections](https://github.com/amaranth-unm/communitygeography-collections) | Next stage: selective presentation patterns and structured records. |
| `communitygeography` | Earlier working copy and separate design experiment; not this stage's parent. |

## Editing

```text
pages/
  index.md                 homepage
  about/                   history, mission, directories, contact
  community-geography/     original Community section
  events/                  includes former root-level events
  news/                    stories and year pages
  funding/
  projects/
assets/
  images/                  grouped by section; shared/ for root/shared media
  documents/               PDFs grouped by section
  css/  js/  unm/           framework and university branding
_includes/  _layouts/       shared Xanthan/UNM presentation
_data/                     navigation, project lists, compatibility map
migration/                 evidence and guidance; excluded from publication
```

Edit pages under `pages/`. Explicit permalinks preserve their public addresses. Generic source names remain intentionally unchanged so directory organization can be demonstrated separately from naming and collection changes. Images retain their original names and bytes.

New references use organized media paths. `_data/legacy-assets.json` maps all 178 old asset URLs to their maintained sources; the build copies those bytes to the old URLs too. Editors maintain one file. Keep the GitHub Actions deployment, which runs the compatibility plugin.

## Preview and checks

```sh
bundle install
bundle exec jekyll serve --port 4002
# http://localhost:4002/communitygeography-reorg/
bundle exec ruby scripts/check-site.rb _site
```

Build `communitygeography-orig` separately, then compare:

```sh
bundle exec ruby scripts/check-reorganization.rb /absolute/path/to/baseline/_site
```

See [verification evidence](migration/stage-verification.md), the exhaustive [move map](migration/reorganization-map.json), and [handoff notes](migration/start-here.md). The original university domain is unchanged. Cleanup, collections, compression, and visual redesign are separate stages.
