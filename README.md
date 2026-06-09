# Niklas Savonheimo – Personal Site

Static portfolio site. Hosted on Cloudflare Pages at `https://portfolio-site-5bt.pages.dev/`.

## Local development

**No build step required.** Open `index.html` directly in a browser (`file://`). Fonts load from Google Fonts.

`style.css` is pure hand-authored custom CSS — no Tailwind utilities.

## File structure

```
index.html              main page (all sections: hero, work, writing, shelf, about, footer)
style.css               custom CSS with OKLCH design tokens (committed directly, no build)
live/
  └─ index.html         live apps & sites — things you can open and try right now
writing/                writing post pages — one HTML file per post (bilingual = separate files + hreflang)
  ├─ the-tool-moves-faster-than-i-do.html    English, April 2026
  └─ verktyget-ror-sig-snabbare-an-jag.html  Swedish, April 2026
img/                    thumbnails shared by project cards and live cards
  ├─ AntiAI-AIClub-form.png
  ├─ tech-digest-cover.png
  ├─ geofill-img.jpg
  ├─ gdp-data-pipeline-img.jpg
  ├─ smartcharge-output.png
  └─ finance_fun_request_lifecycle.svg
og.png                  1200×630px Open Graph / Twitter card image
favicon.svg             logo mark
robots.txt              allow all crawlers; points to real sitemap URL
sitemap.xml             covers homepage, live page, and all writing posts
portfolio-site-designV1.zip  design export reference (keep for reference)
```

## Pages

| URL | Description |
|---|---|
| `/` | Landing page — hero, work, writing, shelf, about, contact |
| `/live/` | Live apps & sites — cards linking to running projects |
| `/writing/*.html` | Individual writing posts |

### Landing page sections

| Anchor | Section |
|---|---|
| `#top` | Hero — name, tagline |
| `#work` | § 01 Selected work — project cards |
| `#writing` | § 02 Writing — article list with EN/SV toggle |
| `#stack` | § 03 The shelf — tools & stack |
| `#about` | § 04 About — prose + meta |
| `#contact` | Footer — CTA, email, socials |

## Adding content

### Link convention

- **Front page project cards** → GitHub repo URLs
- **Live page cards** → deployed/live URLs (GitHub Pages, Render, etc.)

### New project card (`index.html` → `#work`)

Duplicate an `<a class="card">` block in `.projects-grid`. Update `href`, `card-thumb-marker`, `card-thumb-label`, `card-meta`, `h3`, `card-blurb`. For a screenshot thumbnail replace the stripes div with `<img class="card-thumb-img">` + `<div class="card-thumb-scrim">`. Update the `sec-sub` count and the `sec-lede` if needed.

### New live card (`live/index.html`)

Duplicate an `<a class="live-card">` block. Update `href`, `live-meta`, `h3`, `live-blurb`, `live-tags`. Update `sec-sub` count. For a screenshot thumbnail replace the stripes div with `<img src="../img/your-image.jpg" alt="">`.

### New writing post

1. Duplicate `writing/verktyget-ror-sig-snabbare-an-jag.html`, rename with a slug
2. Update `<title>`, `<meta name="description">`, `og:url`, `og:title`, `og:description`, and `lang` in `<head>`
3. Update the `post-eyebrow` date and tag, and `post-title`
4. Replace body paragraphs in `.post-body.prose`
5. Add a matching `<a class="writing-row" data-lang="EN">` in `index.html` — `data-lang` (uppercase) drives the EN/SV toggle; include `.row-tags` with `.tag` (topic) and `.lang` (language) badges
6. Add the URL to `sitemap.xml`
7. If it's a translation of an existing post: add `hreflang` `<link>` tags in `<head>` of both files

### Now strip (4 cells in `index.html`)

| Cell | Type | How to edit |
|---|---|---|
| Helsinki | Live clock (JS) | Don't touch |
| Status | Static text | Edit `.val` span directly |
| Building | Static text | Edit `.val` span directly |
| Last push | Live — GitHub API | JS in inline `<script>` at bottom of `index.html` |

## Outstanding items

- **Cloudflare Web Analytics** — enable in Cloudflare dashboard (Pages → project → Web Analytics)

## Stack

- HTML + custom CSS (OKLCH, variable fonts: Fraunces, IBM Plex Sans/Mono)
- Minimal inline JS (Helsinki clock, GitHub API last-push, Konami easter egg, EN/SV writing toggle — no dependencies)
- Hosting: Cloudflare Pages (auto-deploys on push to `main`)
- Fonts: Google Fonts (Fraunces variable + IBM Plex family)
