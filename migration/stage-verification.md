# Verification evidence — September 17, 2026

## Cascade → converted baseline

Source capture: September 12. Frozen baseline: `52a5d70f7dca889fc034e622f74bef1d11a1813b`, tagged `migration-baseline`, prepared September 16.

The baseline checkout was reconfirmed clean with HEAD and tag identical. All 178 imported assets were re-compared byte-for-byte with the local source capture: zero mismatches. The manifest contains 134 imported pages, comprising all 113 sitemap routes and 21 additional linked pages. The baseline's validation covers 135 built HTML pages including the added 404 page, internal links, images, fragments, landmarks, and search JSON.

**This does not establish pixel-for-pixel equivalence to Cascade.** The conversion introduced Xanthan/Jekyll templates, shared UNM branding, navigation/search/mobile behavior, and documented markup/link repairs. See the [original review notes](README.md). No complete screenshot comparison of every Cascade page is claimed. Editorial correctness, current affiliations, and document accessibility are separate questions.

## Converted baseline → organized stage

Both versions were built in the same Ruby/Jekyll environment. Verified results:

- All 135 complete generated HTML pages match after normalizing only repository prefixes and mapped media paths.
- All 178 assets have identical SHA-256 hashes at both organized and historical compatibility URLs.
- Search records match after URL normalization and sorting by URL.
- All existing 135-page route/link/image/fragment/landmark/search checks pass.

Reproduce with [check-reorganization.rb](../scripts/check-reorganization.rb). No CSS, layout, content wording, image bytes, or content ordering changed. This proves preservation of the converted baseline, not exact Cascade visual equivalence.

The inherited PDF-as-image on 2026 news is intentionally unchanged here. Its known repair, generic filename improvements, and collection layouts belong to the next stage. Image optimization has not been applied.

The capture manifest stays unchanged. Current source locations are in `reorganization-map.json`; compatibility media paths are in `_data/legacy-assets.json`.
