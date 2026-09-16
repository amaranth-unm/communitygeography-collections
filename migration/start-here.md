# Start here: migration comparison

This project demonstrates a staged transition from Cascade CMS to an easier-to-maintain Xanthan/Jekyll site on GitHub Pages. Use this document to resume work without the earlier conversation.

## The two repositories

| Version | Repository | Published demonstration |
| --- | --- | --- |
| Baseline: converted site before systematic cleanup/reorganization | [communitygeography-orig](https://github.com/amaranth-unm/communitygeography-orig) | [Baseline site](https://amaranth.unm.edu/communitygeography-orig/) |
| Working copy: subsequent cleanup and reorganization | [communitygeography](https://github.com/amaranth-unm/communitygeography) | [Working site](https://amaranth.unm.edu/communitygeography/) |

Both share the `migration-baseline` Git tag and the migration history. Keep that tag unchanged. The working copy starts with the same content; its repository identity, preview address, and Pages prefix differ. Keep the baseline stable while making improvements in the working repository. There is no need to archive the baseline repository or change the original university domain.

`orig` means **the converted baseline**, not an untouched export of Cascade's internal templates. The public source was captured on September 12, 2026. The baseline was prepared September 16, 2026.

## What is preserved

- All 134 imported page sources retain the folder structure and filenames corresponding to the original public URLs, with `.html` changed to `.md` for editing. Their explicit public permalinks are retained.
- All 178 imported assets remain at their original relative paths, including extensionless filenames. Their bytes match the local source capture at the baseline checkpoint.
- The original navigation sections, wording, dates, and embedded content remain except for documented conversion repairs. The only post-import edit to a page before this checkpoint was removing a nonbreaking space from the Director heading in `about/our-team.md` (commit `116de5e`).
- `community-geography/` is an original content section. Keep its name; “Community” is simply the shorter menu label.

The new GitHub Pages demonstration prefixes differ between repositories, but the original site-relative page and asset paths beneath those prefixes remain intact. The original `communitygeography.unm.edu` domain and DNS have not been switched.

## What the conversion already added or changed

- Xanthan/Jekyll layouts, includes, navigation, search, GitHub Pages deployment, and the UNM utility bar, hanging logo, and footer.
- Shared branding is integrated into `_includes/unm/`, `_layouts/`, and `assets/`. The center retains its own banner and content layout.
- Necessary conversion repairs, extraction of repeated navigation, and project-card data are documented in [the migration review notes](README.md). This is a working conversion, so some mechanical cleanup was already necessary to produce usable pages.
- The image optimization workflow has been installed and previewed. **Image optimization has not been applied.**
- Migration documentation and reference material live in `migration/`. Local source captures and scratch work live in Git-ignored `migration/_work/`; the whole migration folder is excluded from the published site. A normal Git clone includes the manifest and documentation, but not those local captures.

## What has not been done

- The systematic Tier 1 cleanup pass has not been completed.
- The proposed event/news/project/people collections have not been created.
- Imported content folders and public media have not been reorganized.
- Conflicting dates, leadership information, stale announcements, and other editorial questions have not been reconciled without review.

## Work to do in the working copy

Read the [three-tier cleanup roadmap](cleanup-roadmap.md) first, then the [site-specific organization plan](site-organization-plan.md). Preserve the original content structure by default; use targeted reorganizations only where they make routine editing easier.

1. Establish a passing build and record the baseline. Begin Tier 1 with C1–C4 on the homepage, a text page, a people page, an event, and a project. Preserve words, facts, order, URLs, and intended structure. Flag uncertain cases instead of silently interpreting them.
2. Record each batch's rules, affected pages, checks, and unresolved cases. Use separate commits for strict cleanup, presentation conventions, and content/data restructuring so the demonstration is easy to follow.
3. For Tier 2, apply the agreed media and presentation patterns to representative pages. Folder naming and moving files are optional, not an automatic cleanup step.
4. For Tier 3, start with the proposed three-event pilot: GIS Day, a colloquium, and a coffee social. If collections are adopted, update search and preserve routes and remaining manual archive content during the transition. Later consider people, projects, and news separately.
5. Keep editorial decisions explicit. In particular, review the conflicting DeVivo years, the GIS Day session time, and the GIS Day gallery currently published under Past Projects.

Do not rerun `scripts/convert.rb` over edited content: it overwrites the imported pages. The original capture can be consulted locally at `migration/_work/source/`; a fresh clone without that folder should record when it lacks capture evidence rather than assume the live source is unchanged.

## Verification and comparison

From the repository root:

```sh
bundle exec jekyll build --strict_front_matter
bundle exec ruby scripts/check-site.rb _site
git diff --stat migration-baseline..main
git diff migration-baseline..main -- about events news projects community-geography
```

The baseline check covers 135 generated HTML pages (134 imported pages plus the added 404 page), internal links, image targets, fragments, landmarks, preserved routes, and search JSON. Those checks do not establish editorial correctness or image legibility; visually review changed patterns on desktop and phone.

The baseline and working sites can be compared side by side. At the initial split they should display the same content. The first working-copy commit changes its identity and publishing prefix only; later commits should make the cleanup and maintenance improvements visible and explainable.
