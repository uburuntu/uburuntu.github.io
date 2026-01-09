# https://rmbk.me

Personal website built with Jekyll 4.

## Local Development

### Option 1: Docker (Recommended)

No Ruby installation required. Just run:

```bash
docker compose up
```

Site will be available at [http://localhost:4000](http://localhost:4000) with live reload.

### Option 2: Native Ruby

If you prefer native Ruby:

```bash
# Install Ruby 3.3+ (via rbenv, asdf, or system package manager)
bundle install
bundle exec jekyll serve --livereload
```

## Deployment

Deployment is automatic via GitHub Actions:

- Push to `main` branch triggers build and deploy
- Site is deployed to GitHub Pages
- Dependabot PRs auto-merge on CI success (patch/minor updates)

## Project Structure

```
├── _config.yml      # Site configuration
├── _includes/       # Reusable HTML components
├── _layouts/        # Page templates
├── _posts/          # Blog posts
├── _sass/           # SCSS stylesheets
├── assets/          # Static assets (CSS, JS, fonts, icons)
├── images/          # Image files
├── pages/           # Standalone HTML pages (LLM-generated, etc.)
└── index.md         # Homepage
```

## Adding Custom HTML Pages

For standalone HTML pages (e.g., birthday pages, LLM-generated content):

1. Create a new `.html` file in `pages/` folder
2. Add this front matter at the top:

```html
---
layout: null
permalink: /your-page-name
sitemap: false
---

<!DOCTYPE html>
<html>
  ...
</html>
```

**Key settings:**

- `layout: null` - Skips Jekyll templating (use your raw HTML)
- `permalink: /name` - Sets the URL (rmbk.me/name)
- `sitemap: false` - Excludes from sitemap (optional)

See `pages/_template.html` for a starter template.

**Example:** `pages/eugene-33.html` → accessible at `rmbk.me/eugene-33`

## Credits

Theme based on [Massively](https://html5up.net/massively) by HTML5 UP.
