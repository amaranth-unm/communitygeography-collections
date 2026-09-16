# Migration review notes

Source: https://communitygeography.unm.edu/, captured September 12, 2026.

The migration contains 134 pages and 178 local assets. All 113 HTML routes in the source sitemap are included, along with 21 additional linked pages.

The complete inventory is in `manifest.json`. It records each imported page, its original URL, its editable source file, the assets copied locally, and source URLs that could not be retrieved.

## What belongs in this folder

| Location | Purpose | Saved in Git? |
| --- | --- | --- |
| [start-here.md](start-here.md) | Baseline/working-copy roles and handoff for a fresh conversation. | Yes |
| [cleanup-roadmap.md](cleanup-roadmap.md) | The three-tier process, including strict Tier 1 boundaries and checks. | Yes |
| [site-organization-plan.md](site-organization-plan.md) | Site-specific, optional Tier 2 and Tier 3 improvements. | Yes |
| [image-optimization.md](image-optimization.md) | Using the restored image workflow. | Yes |
| [manifest.json](manifest.json) | Original page/asset inventory and preserved public paths. | Yes |
| [reference/unm-branding/](reference/unm-branding/README.md) | Branding provenance and the original upstream reference copy. | Yes |
| `_work/source/` and `_work/crawl.json` | Downloaded source capture and its working inventory, used by the migration scripts. | No |
| Other files inside `_work/` | Historical scratch scripts and template experiments; not active site components. | No |

All of `migration/` is excluded from the published site. Ordinary editing does not require the local capture or scratch files. The capture remains available locally for comparison; it has not been deleted.

On September 16, 2026, local `.migration/` work was consolidated into `migration/_work/`, and the top-level `unm-branding/` reference copy moved into `migration/reference/unm-branding/`. The crawl inventory's local paths and migration scripts were updated together. The original capture contents and public URL inventory were retained. Older clones can move their local `.migration/` folder to `migration/_work/` and replace the `.migration/` prefix in each page/asset `path` in `crawl.json`; do not rerun the converter to perform this housekeeping.

Active UNM components live in `_includes/unm/`, `_layouts/`, and `assets/`, alongside the rest of Xanthan. The reference copy is retained for provenance, not loaded by the site. Original content folders, including `community-geography/`, remain unchanged.

## Preserved

- Page wording and original dates, including archived news, events, project descriptions, fellowships, team biographies, and application materials.
- Original `.html` paths, image paths, and download paths. Jekyll normally omits filenames ending in a dot; a small build hook preserves the original `news/casa-san-ysidro-by-ramona-m.` photograph.
- The original center banner, university identity, contact address, social links, and university Google Tag Manager.
- External links, maps, PDFs, embedded resources, and photographs from the public source.

The homepage's recent-news list is intentionally the same list as the source homepage. The site contains newer material in the 2026 archive; updating which stories appear on the homepage is an editorial task.

## Repaired during migration

- The CMS sitemap's `http://????.unm.edu` placeholder hostname was resolved against the source site's real hostname to recover otherwise unlinked pages.
- The malformed `/%20news/august-30,-2020.html` link now points to the recovered `/news/august-30,-2020.html` page.
- Links to `/about/staff.html` and `/about/contact.html` use the existing team and contact pages.
- The relative `canvas.unm.edu/courses/39553/pages` link uses its intended external HTTPS address.
- Two funding links referred to nonexistent `gradanchor` and `facultyanchor` fragments. They now link to their existing target pages.
- Empty spacer paragraphs, obsolete inline styling, and duplicate sidebar navigation were removed. Editorial sidebar content is retained, and the repeated social block appears in the site footer.
- Project directory cards, mobile menus, page metadata, breadcrumbs, search, image alternatives, and footer markup use the new layouts.

## Source content requiring editorial review

- The homepage still features 2024–2025 announcements, while the site also contains 2026 material.
- The team page and older news announcements describe different leadership periods. Biographical wording and job titles were carried over as published rather than reconciled without instruction.
- Fellowship headings and closed-application announcements refer to 2024–2025; funding amounts and eligibility copy have not been revalidated.
- `news/example-page.html` and `events/-display-name.html` are publicly listed by the source sitemap. They are preserved for migration completeness, including their original titles and contents.
- Two old event links remain unavailable, and one image referenced a private CMS path returning 404. That broken image element was omitted; its project text and available photograph are preserved. The remaining unavailable source links are recorded in the inventory. The original targets are retained where no reliable replacement was found. No substitute event details or imagery were invented.

The existing UNM site and its DNS are unchanged. Domain cutover steps are in the main README.
