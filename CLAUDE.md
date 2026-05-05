# CLAUDE.md — Portfolio site

Static portfolio site for Niklas Savonheimo. No build step, no framework, no dependencies. One HTML file per page, one shared CSS file.

**Live URL:** `https://portfolio-site-5bt.pages.dev/`
**Hosting:** Cloudflare Pages (auto-deploys on push to `main`)
**Repo:** `github.com/Nickeniklas/portfolio-site`

---

## File structure

```
index.html              landing page (all sections)
style.css               all CSS — OKLCH design tokens, no Tailwind utilities
writing/                one .html file per post
  └─ verktyget-ror-sig-snabbare-an-jag.html
favicon.svg
robots.txt
sitemap.xml             update <loc> entries when new pages are added
```

The `src/input.css`, `build.sh`, and Tailwind binary are legacy — unused, leave them alone.

---

## Design system

Colors (OKLCH):
- `--bg` `oklch(18% 0.014 60)` — warm coffee-black background
- `--green` `oklch(75% 0.09 125)` — sage-olive accent
- `--ink` `oklch(92% 0.015 80)` — primary text
- `--ink-mute` / `--ink-faint` — secondary / tertiary text

Type:
- `--serif` Fraunces (variable: SOFT, WONK, opsz axes) — headings, article body
- `--sans` IBM Plex Sans — UI, body copy
- `--mono` IBM Plex Mono — labels, meta, nav, dates

All type and spacing uses `clamp()` for fluid sizing. Breakpoint at 760px.

---

## Key CSS classes

| Class | Purpose |
|---|---|
| `.shell` | Max-width wrapper (1100px, centered) |
| `.section` | Content section with standard padding |
| `.sec-head` | Section header row (number + title + sub) |
| `.card` | Project card (horizontal layout in `.projects-grid`) |
| `.writing-row` | Single writing list entry (date · title · tag) |
| `.prose` | Long-form serif text (18px Fraunces, text-indent on `p + p`) |
| `.post-head` | Writing post page header (eyebrow + h1) |
| `.post-title` | Writing post h1 (56px Fraunces, `max-width: 22ch`) |
| `.post-body` | Writing post body wrapper (use with `.prose`) |

---

## Adding content

### New writing post

1. Duplicate `writing/verktyget-ror-sig-snabbare-an-jag.html`
2. Rename: ASCII slug, e.g. `writing/my-post-title.html`
3. Update in `<head>`: `<title>`, `description`, `og:url`, `og:title`, `og:description`, `lang`
4. Update `post-eyebrow` (date + tag pill) and `post-title`
5. Replace paragraphs in `.post-body.prose` — first word of first `<p>` gets `<span class="first">word</span>`
6. In `index.html`, add an `<a class="writing-row">` in the `.writing-list` with the matching `href`
7. Update `sitemap.xml` with the new URL

### New project card

Duplicate an `<a class="card">` block in the `.projects-grid` in `index.html`. Update `href`, `card-thumb-marker`, `card-thumb-label`, `card-meta`, `h3`, `card-blurb`.

### Now strip

Edit the `.now` section in `index.html` — "Building", "Reading", "Listening" values.

---

## Voice and copy rules

- Plain everyday language. No marketing speak, no filler.
- Short sentences. One idea per sentence.
- Writing posts can be in any language (Swedish, English, Finnish) — set `lang` on `<html>` per page.

---

## Outstanding items

- **og:image** — no image tag exists yet. When ready: add `<meta property="og:image" content="https://portfolio-site-5bt.pages.dev/og.png">` to all pages. Image should be 1200×630px.
- **Cloudflare Web Analytics** — enable in Cloudflare dashboard under the Pages project
- **2 sample writing rows** — `index.html` lines ~191-200 still have `href="#"` placeholder entries
- **Custom domain** — Phase 5 in PLAN.md, optional

---

## What not to do

- Don't add a build step or bundler
- Don't add a CMS
- Don't add JS dependencies
- Don't use Tailwind utilities in `style.css` (the CDN/binary is there but not wired up)
- Don't add comments explaining what the code does — only add one if the WHY is non-obvious
