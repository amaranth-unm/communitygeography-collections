# Scripts, plugins, and GitHub automation

All routine editing and maintenance happens through GitHub. Edit files in the [browser VS Code editor](https://github.dev/amaranth-unm/communitygeography-collections), commit your changes, and let GitHub Actions build, check, and publish the site. You do not need to install software or run commands.

A **workflow** tells GitHub when to do a task. A **script** performs a particular task, such as checking links. A **plugin** runs inside Jekyll while it builds the website. The Ruby and Python files stay in the repository; GitHub runs them for you.

For content examples, use the [editor guide](../migration/collections-guide.md).

## The two workflows

| Workflow in the Actions tab | When it runs | What it does |
| --- | --- | --- |
| [Deploy Jekyll site to Pages](../.github/workflows/deploy-pages.yml) | Changes reach `main`, a scheduled daily run, or **Run workflow**. | Installs the required software on GitHub, sets the published address, builds with both plugins, runs the site and collection checks, and publishes only after those steps succeed. The daily build refreshes upcoming events. |
| [Optimize Images](../.github/workflows/optimize-images.yml) | Only when someone selects **Run workflow**. | Tests the optimizer, then measures potential savings or applies smaller images. Applying changes commits them to the selected branch. If that branch is `main`, it also starts the publishing workflow. |

Repository setup: under **Settings → Pages → Build and deployment**, the source must be **GitHub Actions**. This custom build supports the site's Ruby plugins. Pages hosts the generated website; the plugins run during the build.

## Edit and publish in the browser

1. Open the [browser editor](https://github.dev/amaranth-unm/communitygeography-collections) and edit or add your content files.
2. Open **Source Control**, stage the changed files, enter a short description, and choose **Commit & Push**. Saving an editor tab alone does not send changes to GitHub.
3. Changes committed directly to `main` start publishing. If you work on another branch, create a pull request and merge it into `main` when ready. The current workflows do not automatically check pull requests or publish branch previews.
4. Open [Actions](https://github.com/amaranth-unm/communitygeography-collections/actions), select **Deploy Jekyll site to Pages**, and open the run for your change.
5. After both **build** and **deploy** succeed, open the published site using the deployment link.

To rebuild without editing a file, select that workflow, choose **Run workflow**, and select `main`.

The browser editor cannot run the complete Jekyll website. Review the rendered result after deployment; a separate draft-site preview is not currently configured. A failed build or check stops the deployment and leaves the previous published version in place. The content commit still exists on GitHub, so correct it in the browser and commit again.

## Scripts used by publishing

These checks inspect content or generated files. They do not rewrite your articles, biographies, or images.

| Script | What it checks | Where to find its result |
| --- | --- | --- |
| [check-site.rb](check-site.rb) | Internal links, image and download targets, links to headings, the repository's URL prefix, main content landmarks, image alternative attributes, and a readable, nonempty search index. It also checks that the original imported page addresses still exist and catches PDFs mistakenly embedded as images. It does not check whether external websites are available. | **Check internal links, images, and search index** in the publishing run. |
| [check-collections.rb](check-collections.rb) | Reads the records again, triggering the plugin's field checks. Confirms event and news pages exist and appear in search, each person's name appears in the appropriate directory's search entry, search URLs are unique, and the GIS Day gallery retains its image count and full-size links. | **Check collection records and calendar boundaries**. |
| [test-event-dates.rb](test-event-dates.rb) | Uses four small test cases to check that events remain upcoming through their last calendar day, events with unresolved dates are excluded, missing times are allowed, and invalid dates are rejected. It tests the date logic without changing real events. | **Check collection records and calendar boundaries**, after the collection check. |

`check-collections.rb` also has a historical comparison mode for checking wording, anchors, directory order, and identical asset bytes against a built copy of the previous site. That mode is not enabled in the publishing workflow; it needs both built versions and is not an editor task.

## Plugins used during the build

These are loaded automatically by Jekyll. There is no separate button for running them.

| Plugin | What it does | Does it change editable files? |
| --- | --- | --- |
| [collection-records.rb](../_plugins/collection-records.rb) | Validates required fields, dates and times, year folders, image paths and alternative text, directory anchors, and duplicate output URLs. Builds the upcoming-events list, supplies news years and sorting values, adds event details and biographies to searchable text, and generates a news-year page when one does not already exist. | No. It supplies information and pages for the current build. A validation failure can appear in the **Build** step before the separate checks run. |
| [legacy-assets.rb](../_plugins/legacy-assets.rb) | Uses the [legacy asset map](../_data/legacy-assets.json) to copy images and documents into the generated site at both their organized and historical addresses. Also includes the inherited image whose filename ends in a dot, which Jekyll otherwise skips. Rejects invalid map paths or missing source assets. | No. It copies into the generated site, keeping old public links working without a second editable copy of each asset. |

Upcoming events are evaluated using the build's date in the configured America/Denver timezone. An event stays listed through its end date, or its start date if no end date is supplied. Records marked `date_review: true` stay out of that list until their dates are resolved.

## Scripts used by Optimize Images

| Script | What it does | When it runs |
| --- | --- | --- |
| [optimize-images.sh](optimize-images.sh) | A small entry point that passes the workflow's choices to the Python optimizer. | During every image-optimization run. |
| [optimize-images.py](optimize-images.py) | Finds tracked JPEGs and PNGs, including images without normal extensions. Uses ImageMagick to make smaller candidates and reports the measured savings. Preserves filenames and formats, never enlarges images, and replaces an image only if the result is smaller. Records applied files and settings to avoid repeatedly processing unchanged images. | After the optimizer tests pass. Preview uses temporary copies; apply replaces repository images in GitHub's working copy, which the workflow then commits. |
| [test-optimize-images.py](test-optimize-images.py) | Tests preview behavior, resizing, format and transparency preservation, unusual filenames, repeated runs, and error handling using temporary images in an isolated test repository. | **Check optimizer behavior on temporary images**, before processing site images. These tests do not change the site's images. |

To use it, open **Actions → Optimize Images → Run workflow**. Choose `main`, a folder, maximum image size, and JPEG quality. Leave **Actually change the files** unticked to measure savings first; inspect the run's summary. A preview reports sizes, not a side-by-side visual comparison. Tick the checkbox on a later run to apply your chosen settings. Applied changes replace images in place; earlier versions remain in Git history.

See the [image-optimization guide](../migration/image-optimization.md) for the full settings and behavior. The workflow installs its tools automatically.

## Historical migration scripts

These three files are retained to document the original conversion. **None runs in either current workflow.** Routine editing does not require them, and there are no browser workflow buttons for them.

| Script | Original purpose | Why editors leave it alone |
| --- | --- | --- |
| [crawl.rb](crawl.rb) | Downloads the original public UNM site's linked pages and assets into `migration/_work/source/`, and writes a working inventory to `migration/_work/crawl.json`. | It captures the old website; it does not update the maintained collections. Its working files are excluded from Git. |
| [convert.rb](convert.rb) | Uses that capture and Pandoc to create the original Markdown pages, navigation and project data, copied assets, homepage news include, and migration manifest. | **Do not rerun it on the maintained site.** It writes the old source structure and overwrites generated content and data from the original conversion. |
| [check-reorganization.rb](check-reorganization.rb) | Compares the original and reorganized builds for matching HTML, search records, and asset bytes while allowing documented path moves. | It belongs to the earlier reorganization stage and intentionally does not pass after the collections changes. It is not a publishing requirement for this version. |

## If publishing fails

Open the failed run, select **build**, and expand the red step. Find the file path and message near the end of its log. Fix the named content file in the browser editor and commit the correction.

| Message or symptom | What to inspect |
| --- | --- |
| `missing title`, `missing start_date`, or another required field | The named record's fields above the Markdown body; compare with the editor guide. |
| `expected YYYY-MM-DD`, `invalid start_time`, or `year folder disagrees` | Quoted dates such as `'2027-03-12'`, quoted times such as `'14:00'`, and the year folder containing the file. |
| `end precedes start without date_review` | The recorded start and end dates/times. Resolve the facts; use `date_review: true` only for a genuinely unresolved source conflict. |
| `missing image`, `missing flyer`, or missing alternative text | Whether the image was committed at the specified path, and whether the record supplies `image_alt` or `flyer_alt`. |
| `missing target` or `missing fragment` | The link's destination or heading ID. A fragment is the part after `#` in a link. |
| `Duplicate output URLs` | Two source files claiming the same public address, usually through `permalink`. |
| `Missing migrated page` | An original public address was lost. Preserve its existing `permalink` when moving or renaming content. |
| Checks pass but **deploy** fails | Ask the repository maintainer to inspect Pages settings, permissions, and the deployment error. This is not a content-validation failure. |

For a script traceback or infrastructure failure you cannot resolve from the message, send the maintainer the failed run's link. No local setup is needed to inspect or share it.
