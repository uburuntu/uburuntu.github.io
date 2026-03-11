# CV — Design & Content Guide

This document captures the design decisions and content strategy for the CV, built with [Typst](https://typst.app/).

## Compile

```bash
make pdf       # → build/Bekbulatov-Ramzan-CV.pdf
make preview   # → build/Bekbulatov-Ramzan-CV-{p}.png (200 PPI)
make watch     # live reload during editing
```

Requires `typst` (`brew install typst`). Build output is gitignored. Font files are bundled in `cv/fonts/`.

## Content Strategy

**Target audience:** Staff/Senior Staff engineering roles at AI companies (Anthropic, OpenAI, DeepMind), FAANG, trading firms, and high-growth startups.

**Positioning:** Software Engineer and Tech Lead at Meta operating at Staff scope, with 11+ years of total experience across distributed systems, platform infrastructure, and technical leadership.

**Key differentiators to surface:**
- 0→1 platform building (Artifacto, Unlockables Platform, trading system, startup products)
- Company-wide impact (AI Codemod, engineering excellence)
- AI-applied engineering (codemod, DerpRobot, compeek) — critical for AI company applications
- Technical leadership without a manager title (backend TL, roadmap ownership, mentorship)
- Algorithmic trading experience (Centurion Capital) — relevant for trading firms

**Section order:** Summary → Work Experience → Skills & Expertise → Projects & Open Source → Education → Teaching. Experience leads because at this seniority, impact is the selling point — not a skills keyword list.

**Summary strategy:** Makes a specific architectural claim ("unifying fragmented systems into reliable, high-performance platforms"), states "Operating at Staff scope" to address title gap without inflating, and mentions AI to signal relevance for AI companies.

**Bullet structure:** Each bullet starts with a bold lead-in phrase (the "headline"), followed by context and metrics. One additional bold highlight per bullet for the most impressive metric, used sparingly. This creates a scannable rhythm — a recruiter skimming bold phrases gets the full story in seconds.

**Meta bullets include the "how":** Not just outcomes but architectural insights (e.g., "event-driven rendering framework with on-demand artifact generation and real-time sync", "via consolidated endpoints, smart pagination, and image caching"). This signals Staff-level systems thinking.

## Typography & Visual Design

**Font:** Inter — bundled in `cv/fonts/` (3 static weights: Regular, Medium, Bold). Open-source, works on all platforms including CI. Compiled with `--font-path fonts`.

**Weight hierarchy:**
- Name: bold (32pt, tracked)
- Section headings: bold uppercase (13pt, tracked, short accent underline)
- Role titles: bold (10.5pt)
- Body emphasis (`*text*`): medium weight + darker fill (#333) — stands out without heavy bold blotches
- Body text: regular (10pt, medium-grey fill)
- Dates: regular, light-grey — recedes visually

**Section headings:** Uppercase with letter-spacing and a short 3em accent underline (not full-width rule). This editorial treatment signals intentional design.

**Color palette:** Blue (#0F6688) for headings and accents, dark-blue (#00425C) for the accent line, medium-grey (#4D4D4F) for body text, light-grey (#B0B3B8) for dates and bullet markers.

**ATS compatibility:** Single-column layout, standard section headings, real text (no images), bundled fonts. Verify with `pdftotext build/Bekbulatov-Ramzan-CV.pdf -` — check that "Software" is one word (tracking can cause splits) and all sections extract in correct order.

## Auto-Updating Fields

Several fields are auto-computed from `datetime.today()` at compile time — no manual updates needed:
- Total years of experience (career start: Feb 2015)
- Meta tenure (start: Aug 2021)
- Meta date line shows computed years: "Aug 2021 — Present (4+ yrs)"

See the `years-since()` function at the top of `main.typ`.

## Content Sources

Bullet points are grounded in Meta performance reviews (H2 2021 through Year-end 2025) and public LinkedIn profile. All metrics are from official review documentation. The CV avoids internal Meta terminology (e.g., "BE Champion" → "engineering practices", "Family of Apps" → "Meta apps", "Metaverse" → "Platform infrastructure").

## CI/CD

The GitHub Actions workflow (`../.github/workflows/deploy.yml`) compiles `main.typ` with `--font-path cv/fonts` using `typst-community/setup-typst@v4`, and places both `Bekbulatov-Ramzan-CV.pdf` and `cv.pdf` at the site root. Available at:
- `rmbk.me/Bekbulatov-Ramzan-CV.pdf` — proper download filename
- `rmbk.me/cv.pdf` — short URL (same file, copy not redirect)

Note: `_config.yml` excludes `cv/` (with trailing slash) so the source directory is not published, but root-level `cv.pdf` is not excluded.
