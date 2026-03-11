# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal portfolio website (https://rmbk.me) built with Jekyll 4.3 and deployed to GitHub Pages. Theme based on Massively by HTML5 UP.

## Development Commands

```bash
# Local development (recommended)
docker compose up
# Site at http://localhost:4000 with live reload

# Native Ruby alternative
bundle install
bundle exec jekyll serve --livereload

# Production build
JEKYLL_ENV=production bundle exec jekyll build
```

## Deployment

Push to `master` branch triggers GitHub Actions build and deploy to GitHub Pages. Dependabot PRs auto-merge for patch/minor updates.

## Architecture

- **Jekyll static site** with Kramdown markdown, SCSS (compressed), and jQuery/Skel framework
- **Layouts:** `post.html` (blog posts), `page.html` (generic pages), `blog.html` (post listing)
- **Includes:** `head.html` (SEO via jekyll-seo-tag), `nav.html` (navigation + social icons), `foot.html`, `scripts-main.html`
- **Styling:** SCSS in `_sass/` organized into `base/`, `components/`, `layout/`, `libs/` (variables, mixins, breakpoints)
- **Plugins:** jekyll-sitemap, jekyll-feed, jekyll-seo-tag, jemoji

## Content Conventions

**Blog posts** go in `_posts/YYYY-MM-DD-title.md` with front matter: `layout: post`, `title`, `date`, `excerpt`, `image`.

**Standalone HTML pages** go in `pages/` with `layout: null` and `permalink: /page-name/`. These bypass Jekyll templating entirely. See `pages/_template.html` for the starter template.

**Images** are stored in `/images/` and referenced with absolute paths.

## CV (Typst)

The `cv/` directory contains a CV built with Typst (`cv/main.typ`) using bundled Inter font (`cv/fonts/`). The CI/CD pipeline compiles it and places both `Bekbulatov-Ramzan-CV.pdf` and `cv.pdf` at the site root. The `cv/` directory is excluded from Jekyll processing. See `cv/CLAUDE.md` for design rationale. To compile locally: `cd cv && make pdf`.

## Key Config

- `_config.yml`: Site metadata, social links, SEO settings, permalink structure (`/blog/:title/`)
- Pages in `pages/` directory default to `layout: null` and `sitemap: false`
- Self-hosted fonts (no CDN/Google Fonts)
- Ruby 3.3.0 (`.ruby-version`)
