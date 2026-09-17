# Collections stage — verification and scope

Parent: `communitygeography-reorg` at `43e9189` (`reorganization-baseline`). Prepared September 17, 2026.

## Adopted changes

All confirmed standalone events, news stories, and directory biographies were migrated, rather than leaving a pilot. The totals are 45 events, 39 news records, and 15 people. Two event announcements and one news article previously existed only inside listing pages; they now have records and new detail URLs while their original landing pages retain the source material. Original 134 page URLs remain available, plus the three new detail pages and existing 404 page: 138 HTML pages total.

Date-labelled and generic news filenames now describe their subjects. Events live in start-year folders; news lives in publication-year folders. Four `test-project-*` sources, event landing files, and the misleading gallery source now have descriptive names. Their public permalinks remain unchanged.

The news lists use story titles consistently; this also removes inconsistent list-only spellings such as “20205” from a 2025 fellow entry. Spring Garden Party's generic detail title is replaced using the title already present in the source event archive. Narrative wording, names, dates, biographies, and links were preserved rather than editorially rewritten.

## Evidence

- Strict Jekyll build and 138-page route/link/image/fragment/landmark/search checks pass.
- All 45 event records and 39 news records produce pages and search entries; all 15 people are searchable through their directories.
- Compared all original pages' content anchors: none lost.
- Compared migrated standalone event/news narratives and both complete directory texts against the parent as word sequences: no differences. The unique 2026 article is also preserved, with the descriptive PDF link as its documented addition.
- All 178 imported assets have matching SHA-256 hashes at organized and historical compatibility URLs. No optimization was applied.
- A temporary future event, news story, and person demonstrated automatic detail-page, archive, upcoming-list, new-year-page, homepage-selection, directory, and search updates. Fixtures were removed before publication.
- Four calendar/validation cases cover same-day expiry, multiday expiry, unresolved dates, omitted times, and invalid date values.
- Desktop review covered event details, affiliate portraits, and all 14 loaded gallery images. Eight representative pages at 390px had no horizontal overflow or empty headings; mobile portrait spacing and the 2026 article title were refined during review.

These checks do not resolve inherited editorial conflicts, certify accessibility of image-only flyers/PDFs, or establish exact equivalence to Cascade's original rendering. See [stage-verification.md](stage-verification.md) for the distinct baseline/reorganization evidence and [editorial-review.md](editorial-review.md) for held questions.

The original blue/plum mockup is excluded. This stage keeps existing branding and uses one additional stylesheet for the adopted content patterns.
