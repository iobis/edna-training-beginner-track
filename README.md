# Lesson Title Here

<!-- Replace the above and the description below with your lesson's details. -->

Training materials for [OBIS](https://obis.org) and the eDNA community.

## Using this template

### 1. Fork or copy this repository

Fork this repository to your own GitHub account, or use it as a template
(GitHub → "Use this template").

### 2. Edit `_variables.yml`

Open `_variables.yml` and fill in the lesson title, your name, the repo URL, and
any other metadata. These values are injected throughout the site — you only need
to update them in one place.

### 3. Edit the episode files

Episode files live in `episodes/`. Each file follows the same scaffold:

| Block | Callout type | Required? |
|-------|-------------|-----------|
| Learning objectives | `callout-note` | ✅ Always |
| Prerequisites | `callout-important` | If needed |
| Tips / notes | `callout-tip` | As needed |
| Exercise | `callout-caution` | ≥ 1 per episode |
| Inline instructor notes | `.instructor-only` div | Recommended |
| Key points | `callout-tip` | ✅ Always |

Do not remove the objectives or key points blocks — they are part of the
pedagogical contract with learners.

### 4. Add packages and data to `setup.qmd`

Edit `setup.qmd` with the actual R packages and data download instructions for
your lesson. Test that a clean R environment can follow these steps from scratch.

### 5. Add extended instructor notes

Per-episode instructor notes live in `instructor/notes-NN.qmd`. These are only
rendered in the instructor build. Use them for pacing guidance, common errors,
discussion prompts, and notes from past deliveries.

## Local development

### Prerequisites

You will need the following installed:

- [R](https://cran.r-project.org/) ≥ 4.2
- [RStudio](https://posit.co/download/rstudio-desktop/) or another IDE
- [Quarto](https://quarto.org/docs/get-started/) ≥ 1.4
- [Font Awesome extension](https://github.com/quarto-ext/fontawesome) (install once per repo, see below)

### First-time setup

After cloning the repo, install the Font Awesome extension and any required R packages:

```bash
quarto add quarto-ext/fontawesome
```

```r
install.packages(c("tidyverse", "here", "knitr"))
# add any additional packages required by the lesson
```

### Preview the learner site

```bash
quarto preview
```

This starts a local server at `http://localhost:XXXX` and watches for changes. Code chunks
are executed and their output is cached in `_freeze/` — on subsequent previews, only changed
files are re-executed.

### Force a full re-render

If you change YAML front matter, `_variables.yml`, or suspect the cache is stale:

```bash
rm -rf _freeze/
quarto preview
```

### Preview the instructor site

```bash
quarto preview --profile instructor
```

The instructor site reveals all `.instructor-only` blocks and adds a red "INSTRUCTOR VIEW"
banner to the navbar. Do not share the instructor site URL with learners.

### Render to static files (no live server)

```bash
# Learner site
quarto render

# Instructor site  
quarto render --profile instructor
```

Output goes to `_site/` (learner) by default. You can open `_site/index.html` locally to
inspect the final output before pushing.

### Adding or renaming episodes

1. Create the new file in `episodes/` following the naming convention `NN-short-name.qmd`.
2. Copy the episode template scaffold from an existing episode.
3. Add the `title`, `description`, and `time` fields to the YAML front matter.
4. Add the episode to the navbar menu in `_quarto.yml`.
5. The episode table on `index.qmd` updates automatically.

### 7. Publish

GitHub Actions can publish both sites automatically. The learner site goes to
`gh-pages` and the instructor site to `gh-pages/instructor/`.

A starter workflow is available at `.github/workflows/publish.yml`
(not yet included — raise an issue or PR if you need it).

Here's a new section to add to the README, after the **Local development** section:

```markdown
## Publishing a lesson branch

When you are ready to share a delivered version of this lesson publicly, follow these
steps on your branch before publishing.

### 1. Remove the development banner

In `_extensions/obis-workshop/obis-callouts.css`, delete the entire `/* Development banner */`
block:

```css
/* Development banner */
body::before {
  content: "⚠ This lesson is under development and is not ready for use.";
  ...
}
```

### 2. Enable search indexing

In `_quarto.yml`, change the `robots` line:

```yaml
robots: index, follow
```

And in `_metadata.yml`, change the meta tag:

```html
<meta name="robots" content="index, follow">
```

### 3. Update `_variables.yml`

Make sure the following fields are filled in and not left as `NA`:

- `lesson.title`
- `lesson.subtitle`
- `workshop.date`
- `workshop.location`
- `workshop.instructors`
- `maintainer.name`
- `maintainer.email`

### 4. Verify the rendered site

```bash
rm -rf _freeze/
quarto render
```

Open `_site/index.html` and check that the development banner is gone, the episode table
is correct, and the setup instructions reflect the actual packages and data for this lesson.

### 5. Push and publish

Push your branch to GitHub. If GitHub Actions is configured, the learner site will publish
to GitHub Pages automatically. Confirm the live URL is correct before sharing with participants.

### Note on the `main` branch

The `main` branch is the template and should never be published directly. Keep the development
banner and `noindex` robots in place on `main` at all times. All public-facing lessons live
on their own branches.
```

## Repository structure

```
lesson-name/
├── _quarto.yml                    # Learner site config
├── _quarto-instructor.yml         # Instructor profile overrides
├── _variables.yml                 # Lesson metadata — edit this
├── index.qmd                      # Lesson landing page
├── setup.qmd                      # R setup instructions
├── episodes/
│   ├── 01-episode.qmd             # Episode template (copy for each episode)
│   └── ...
├── instructor/
│   ├── index.qmd                  # Instructor guide overview
│   └── notes-01.qmd              # Per-episode instructor notes
├── data/                          # Example datasets (keep small)
├── figures/                       # Static images
└── _extensions/obis-workshop/
    ├── obis-workshop.scss          # OBIS brand theme
    ├── obis-callouts.css           # Pedagogical callout styles
    └── obis-instructor.scss        # Instructor build overrides
```

## Pedagogical framework

This lesson design follows the principles of
[The Carpentries Curriculum Development Handbook](https://cdh.carpentries.org):

- **Backward design** — write learning objectives first, then build content that
  achieves them.
- **Bloom's taxonomy verbs** — objectives use verbs like *construct*, *apply*,
  *interpret* rather than passive verbs like *know* or *understand*.
- **Formative assessment** — exercises follow immediately after new concepts.
- **Key points** — every episode ends with a summary that mirrors the objectives.

These materials are not official Carpentries lessons, but the Carpentries framework
is acknowledged in the site footer and on the lesson landing page.

## Licence

Content is released under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
You are free to adapt and reuse with attribution.

## Contributing

Bug reports and improvements are welcome. Please open an issue or pull request on
the GitHub repository. If you teach an adapted version of this lesson, consider
sharing what worked and what didn't by opening an issue labelled `delivery-notes`.
