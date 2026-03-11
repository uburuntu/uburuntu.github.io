# CV — Design & Content Guide

This document captures the design decisions and content strategy for the CV, built with [Typst](https://typst.app/).

## Compile

```bash
make pdf       # → build/Bekbulatov-Ramzan-CV.pdf
make preview   # → build/Bekbulatov-Ramzan-CV-{p}.png (200 PPI)
make watch     # live reload during editing
```

Requires `typst` (`brew install typst`). Build output is gitignored.

## Content Strategy

**Target audience:** Staff/Senior Staff engineering roles at AI companies (Anthropic, OpenAI, DeepMind), FAANG, and high-growth startups/fintech.

**Positioning:** A Senior Software Engineer at Meta performing at Staff level (Greatly Exceeded / Exceeded Expectations consistently), with 10+ years of total experience across distributed systems, platform infrastructure, and technical leadership.

**Key differentiators to surface:**
- 0→1 platform building (Artifacto, Unlockables Platform, trading system, startup products)
- Company-wide impact (AI Codemod, engineering excellence)
- AI-applied engineering (codemod, DerpRobot, compeek) — critical for AI company applications
- Technical leadership without a manager title (backend TL, roadmap ownership, mentorship)

**Section order:** Summary → Work Experience → Skills & Expertise → Projects & Open Source → Education → Teaching. Experience leads because at this seniority, impact is the selling point — not a skills keyword list.

**Bullet structure:** Each bullet starts with a bold lead-in phrase (the "headline"), followed by context and metrics in regular weight. One additional bold highlight per bullet for the most impressive metric, used sparingly. This creates a scannable rhythm — a recruiter skimming bold phrases gets the full story in seconds.

## Typography & Visual Design

**Font:** Avenir Next — used throughout for consistency. Clean geometric sans-serif with excellent weight range.

**Weight hierarchy:**
- Name: bold (32pt, tracked)
- Section headings: bold uppercase (13pt, tracked, short accent underline)
- Role titles: bold (10.5pt)
- Body emphasis (`*text*`): medium weight + darker fill (#333) — stands out without heavy bold blotches
- Body text: regular (10pt, medium-grey fill)
- Dates: regular, light-grey — recedes visually

**Section headings:** Uppercase with letter-spacing and a short 3em accent underline (not full-width rule). This editorial treatment signals intentional design.

**Color palette:** Blue (#0F6688) for headings and accents, dark-blue (#00425C) for the accent line, medium-grey (#4D4D4F) for body text, light-grey (#B0B3B8) for dates and bullet markers.

**ATS compatibility:** Single-column layout, standard section headings, real text (no images), standard fonts. Always validate by copy-pasting the PDF into a plain text editor to check reading order.

## Auto-Updating Fields

Several fields are auto-computed from `datetime.today()` at compile time — no manual updates needed:
- Total years of experience (career start: Feb 2015)
- Meta tenure (start: Aug 2021)

See the `years-since()` function at the top of `main.typ`.

## Content Sources

Bullet points are grounded in Meta performance reviews (H2 2021 through Year-end 2025) and public LinkedIn profile. All metrics are from official review documentation. The CV avoids internal Meta terminology (e.g., "BE Champion" → "engineering practices", "Family of Apps" → "Meta apps").

## CI/CD

The GitHub Actions workflow (`../.github/workflows/deploy.yml`) compiles `main.typ` → `Bekbulatov-Ramzan-CV.pdf` using `typst-community/setup-typst@v4`, and places it at the site root. Available at `rmbk.me/Bekbulatov-Ramzan-CV.pdf` with a redirect from `rmbk.me/cv.pdf`.
