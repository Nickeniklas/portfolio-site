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
writing/                one .html file per post; bilingual posts are separate files cross-linked with hreflang
  ├─ the-tool-moves-faster-than-i-do.html      English, April 2026
  └─ verktyget-ror-sig-snabbare-an-jag.html    Swedish, April 2026
img/                    project card screenshots (used by two-tier thumbnail system)
  ├─ tech-digest-cover.png
  ├─ geofill-img.jpg
  └─ gdp-data-pipeline-img.jpg
og.png                  1200×630px Open Graph / Twitter card image (root, same level as favicon)
favicon.svg
robots.txt
sitemap.xml             update <loc> entries when new pages are added
```

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
| `.sec-lede` | Section intro line below `.sec-head` (IBM Plex Sans, `--ink-mute`, ~15px) |
| `.writing-row` | Single writing list entry — 3-col grid: date · title · `.row-tags` |
| `.row-tags` | Flex container for tag badges inside `.writing-row` |
| `.tag` | Topic tag pill (faint border, mono) |
| `.lang` | Language badge pill (green accent, mono) — `EN`, `SV`, etc. |
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
6. In `index.html`, add an `<a class="writing-row">` in the `.writing-list` using `.row-tags` with both a `.tag` (topic) and a `.lang` (language) badge:
   ```html
   <a class="writing-row" href="writing/my-post-title.html">
     <span class="date">2026 · 05</span>
     <span class="ttl">Post title here</span>
     <span class="row-tags">
       <span class="tag">AI</span>
       <span class="lang">EN</span>
     </span>
   </a>
   ```
7. Update `sitemap.xml` with the new URL
8. **If the post is a translation of an existing post:** add `hreflang` `<link>` tags in `<head>` of both files pointing at each other

### New project card

Duplicate an `<a class="card">` block in the `.projects-grid` in `index.html`. Update `href`, `card-thumb-marker`, `card-thumb-label`, `card-meta`, `h3`, `card-blurb`.

**Card thumbnails — two-tier system:**

- **Default (stripes):** keep `<div class="card-thumb-stripes" aria-hidden="true"></div>` — used for repos with no strong visual output.
- **Screenshot:** for projects with a chart, map, or UI worth showing, save a cropped image to `img/` and replace the stripes div with:
  ```html
  <img class="card-thumb-img" src="img/your-image.jpg" alt="">
  <div class="card-thumb-scrim" aria-hidden="true"></div>
  ```
  The scrim (50% dark overlay) + `var(--ink)` text color on `.card-thumb-label` and `.card-thumb-marker` ensures legibility over any image. Add `style="object-position:center top"` on the `<img>` if the subject is near the top of the image.

### Now strip

The `.now` section in `index.html` has four cells:

| Cell | Type | Notes |
|---|---|---|
| Helsinki | Live clock | Inline JS — don't touch |
| Status | Static text | Edit the `.val` span directly |
| Building | Static text | Edit the `.val` span directly |
| Last push | Live — GitHub API | Fetches `https://api.github.com/users/Nickeniklas/events/public` on page load, finds first `PushEvent`, displays `repo · Xd ago`. Error state shows a `github ↗` link. JS is in the inline `<script>` block at the bottom of `index.html`. |

---

## Voice and copy rules

- Plain everyday language. No marketing speak, no filler.
- Short sentences. One idea per sentence.
- Writing posts can be in any language (Swedish, English, Finnish) — set `lang` on `<html>` per page.

---

## Outstanding items

- **Cloudflare Web Analytics** — enable in Cloudflare dashboard under the Pages project
- **Custom domain** — Phase 5 in PLAN.md, optional

---

## What not to do

- Don't add a build step or bundler
- Don't add a CMS
- Don't add JS dependencies
- Don't use Tailwind utilities in `style.css`
- Don't add comments explaining what the code does — only add one if the WHY is non-obvious
