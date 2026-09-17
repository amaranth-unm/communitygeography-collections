# Community Geography — collections

This stage builds on [communitygeography-reorg](https://github.com/amaranth-unm/communitygeography-reorg), with the original UNM/Xanthan appearance and public routes. It demonstrates how editors can maintain one record and have pages, lists, and search update consistently.

| Stage | Demonstrates |
| --- | --- |
| [communitygeography-orig](https://github.com/amaranth-unm/communitygeography-orig) | Frozen converted baseline; documented conversion repairs already applied. |
| [communitygeography-reorg](https://github.com/amaranth-unm/communitygeography-reorg) | Organized page sources/images/documents, with matching baseline rendering. |
| **communitygeography-collections** | 45 events, 39 news records, 15 people, descriptive source names, and shared content patterns. |

The earlier `communitygeography` repository contains the separate working-copy/design experiment. Its proposed visual redesign is not included here.

## Edit here

- `_events/YYYY/`: one event, structured dates/details and Markdown description.
- `_news/YYYY/`: one story, publication metadata and Markdown article.
- `_people/`: one directory entry, identity/affiliation and Markdown biography.
- `pages/`: explanatory pages, directory wrappers, archives, and ordinary project pages.
- `assets/images/` and `assets/documents/`: organized media, with original URLs preserved by a build-time compatibility map.

Follow the [editor guide](migration/collections-guide.md). Existing `permalink` values preserve public addresses while source names improve. All 134 imported routes remain; three formerly embedded records add detail pages. The source Cascade domain is unchanged.

## Preview and checks

```sh
bundle install
bundle exec jekyll serve --port 4003
# http://localhost:4003/communitygeography-collections/
bundle exec ruby scripts/check-site.rb _site
bundle exec ruby scripts/check-collections.rb _site
bundle exec ruby scripts/test-event-dates.rb
```

GitHub Actions builds/deploys on updates and daily to refresh the date-based upcoming list. Search includes collection pages and directory biographies. Images remain byte-for-byte unchanged; the inherited Optimize Images workflow is available for a separately reviewed batch.

Read the [verification record](migration/collections-verification.md), [editorial questions](migration/editorial-review.md), and [handoff](migration/start-here.md). `migration-baseline` identifies the original converted baseline; `reorganization-baseline` identifies this stage's parent. `scripts/check-reorganization.rb` belongs to that parent and intentionally does not pass after presentation/collection changes; use the collection checks here.
