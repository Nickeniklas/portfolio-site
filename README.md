# Niklas Savonheimo – Personal Site

Static portfolio landing page. Links out to separate projects. Hosted on Cloudflare Pages.

## Status

- **Phase 1 — complete.** Landing page built and committed.
- **Phase 2 — complete.** Pushed to GitHub with README.
- **Design v0.1 — complete.** Full visual redesign implemented: warm coffee-dark aesthetic, Fraunces slab + IBM Plex type, OKLCH color tokens, live Helsinki clock, interactive easter egg.
- **Phase 3 — next.** Deploy to Cloudflare Pages, get `.pages.dev` URL, update `sitemap.xml` and `robots.txt` placeholders.

## Local development

**No build step required.** Open `index.html` directly in a browser (`file://`). Fonts load from Google Fonts.

`style.css` is pure hand-authored custom CSS — no Tailwind utilities. The `src/input.css` and `build.sh` files remain in the repo for potential future use but are not part of the current build.

## File structure

```
index.html          main page (all sections: hero, work, writing, shelf, about, footer)
style.css           custom CSS with OKLCH design tokens (committed directly, no build)
src/input.css       legacy Tailwind source (unused by current design)
build.sh            legacy CSS rebuild command (unused by current design)
favicon.svg         logo mark
robots.txt          allow all crawlers
sitemap.xml         placeholder URL — update in Phase 3
portfolio-site-designV1.zip  design export reference (keep for reference, gitignored optional)
```

## Page sections

| Anchor | Section |
|---|---|
| `#top` | Hero — name, tagline |
| `#work` | § 01 Selected work — project cards |
| `#writing` | § 02 Writing — article list |
| `#stack` | § 03 The shelf — tools & stack |
| `#about` | § 04 About — prose + meta |
| `#contact` | Footer — CTA, email, socials |

## Content to update

Content is inline in `index.html` — one edit per item to add a project, writing entry, or stack item.

- **`#work`** — add a project card by duplicating an `<a class="card">` block
- **`#writing`** — add a writing row by duplicating an `<a class="writing-row">` block
- **`#stack`** — add/edit items within the relevant `<ul>` in a `.stack-cell`
- **Now strip** — edit the "Building / Reading / Listening" values inline in the `.now` section

## Outstanding items

- **og:image** — tags present but pointing to placeholder URL; needs a real 1200×630px image
- **sitemap.xml + robots.txt** — replace `placeholder.pages.dev` with real URL in Phase 3
- **Cloudflare Web Analytics** — enable after Phase 3 deploy
- **Writing posts** — sample posts are placeholders; replace `href="#"` with real URLs when published
- **Language switch (FI/EN)** — on the backlog, noted in PLAN.md

## Stack

- HTML + custom CSS (OKLCH, variable fonts: Fraunces, IBM Plex Sans/Mono)
- Minimal inline JS (Helsinki clock, interactive easter egg — no dependencies)
- Hosting: Cloudflare Pages
- Fonts: Google Fonts (Fraunces variable + IBM Plex family)
