# Niklas Savonheimo – Personal Site

Static portfolio landing page. Links out to separate projects. Hosted on Cloudflare Pages.

## Status

- **Phase 1 — complete.** Landing page built and committed.
- **Phase 2 — complete.** Pushed to GitHub with README.
- **Phase 3 — next.** Deploy to Cloudflare, get `.pages.dev` URL, update `sitemap.xml` and `robots.txt` placeholders.

## Local development

**Rebuild CSS** after adding new Tailwind classes to `index.html`:

1. Download the Tailwind CLI binary (gitignored, not committed):
   ```
   https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-windows-x64.exe
   ```
2. Place it in the repo root, then run:
   ```sh
   ./build.sh
   ```
   Or directly:
   ```sh
   ./tailwindcss-windows-x64.exe -i src/input.css -o style.css --minify
   ```

**View locally:** Open `index.html` directly in a browser (`file://`). No server needed.

## File structure

```
index.html          main page
style.css           compiled Tailwind output (committed — Cloudflare needs no build step)
src/input.css       Tailwind source with brand color theme
build.sh            CSS rebuild command
favicon.svg         logo mark (two green rects)
robots.txt          allow all crawlers
sitemap.xml         placeholder URL — update in Phase 3
```

## Outstanding items

- **LinkedIn URL** — `href="https://www.linkedin.com/in/niklassav/"` placeholder in footer, update when ready
- **og:image** — tags present but pointing to placeholder URL; needs a real raster image (1200×630px) after design
- **Tech Digest URL** — linked to `https://nickeniklas.github.io/tech-digest/` (root); verify it has an index page
- **sitemap.xml + robots.txt** — replace `placeholder.pages.dev` with real URL in Phase 3
- **Language switch (Finnish/English)** — on the backlog, noted in PLAN.md

## Stack

- HTML + Tailwind CSS v4 (CLI, no Node.js)
- Hosting: Cloudflare Pages
- Analytics: Cloudflare Web Analytics (enable after Phase 3)
