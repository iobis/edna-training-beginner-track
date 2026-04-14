# Track Title Here

<!-- Replace the above and the description below with your track's details. -->

Training materials for [OBIS](https://obis.org) and the eDNA community.

## Using this template

### 1. Fork or copy this repository

Fork this repository to your own GitHub account, or use it as a template
(GitHub → "Use this template").

### 2. Edit `_variables.yml`

Open `_variables.yml` and fill in the track title, your name, the repo URL, and
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
your track. Test that a clean R environment can follow these steps from scratch.

### 5. Add extended instructor notes

Per-episode instructor notes live in `instructor/notes-NN.qmd`. These are only
rendered in the instructor build. Use them for pacing guidance, common errors,
discussion prompts, and notes from past deliveries.

### 6. Build and preview

```bash
# Learner site (default)
quarto preview

# Instructor site
quarto preview --profile instructor
```

### 7. Publish

GitHub Actions can publish both sites automatically. The learner site goes to
`gh-pages` and the instructor site to `gh-pages/instructor/`.

A starter workflow is available at `.github/workflows/publish.yml`
(not yet included — raise an issue or PR if you need it).

## Repository structure

```
track-name/
├── _quarto.yml                    # Learner site config
├── _quarto-instructor.yml         # Instructor profile overrides
├── _variables.yml                 # Track metadata — edit this
├── index.qmd                      # Track landing page
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
is acknowledged in the site footer and on the track landing page.

## Licence

Content is released under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
You are free to adapt and reuse with attribution.

## Contributing

Bug reports and improvements are welcome. Please open an issue or pull request on
the GitHub repository. If you teach an adapted version of this track, consider
sharing what worked and what didn't by opening an issue labelled `delivery-notes`.
