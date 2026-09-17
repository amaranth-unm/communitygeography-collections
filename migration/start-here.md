# Start here: organization-only stage

This repository is `communitygeography-reorg`. Its parent is the frozen converted baseline in `communitygeography-orig` at `52a5d70` / `migration-baseline`. It does not descend from later cleanup or visual design experiments.

All 134 imported page sources now live under `pages/`; all 178 imported assets live under `assets/images/` or `assets/documents/`. Page permalinks and historical asset URLs are preserved. No wording, image bytes, or visual styling changed. Generic source names remain until the collections stage.

The [README](../README.md) is the editing guide. [stage-verification.md](stage-verification.md) defines what is verified. [reorganization-map.json](reorganization-map.json) records every move. The original manifest remains immutable: its file values describe import paths, not current editing paths.

The earlier [roadmap](cleanup-roadmap.md) and [organization proposal](site-organization-plan.md) remain historical context. The September 17 request for this separate demonstration supersedes their earlier advice to defer bulk moves. Their example source paths refer to the imported tree; consult the move map for current locations.

`communitygeography-collections` is the next stage for descriptive names, structured event/news/people records, selective presentation patterns, and media repairs. Visual redesign remains a separate decision.

Do not rerun the converter over organized files. The ignored capture remains in the earlier working copy's `migration/_work/source/`, not in a normal Git clone. Do not describe `orig` as an untouched Cascade export or pixel-identical reconstruction.
