# SFMC - Sci-Fi Movie Club

**Created:** 2026-02-11
**Owner:** Mike M
**Purpose:** Simple one-page website to track movies watched with friends
**Live URL:** https://scifimovieclub.com (Cloudflare Pages, auto-deploys from GitHub)
**Repo:** https://github.com/kmikeym/sfmc

## What This Is

A brutalist/poster-style website for a sci-fi movie club. Tracks:
- Which movies were watched (with processed poster + original hover reveal)
- Upcoming sci-fi movies for the year (coming soon cards)
- Where and when they were watched (date + location)
- Links to Letterboxd (watched) and IMDB (upcoming)

## Design System

**Color Palette (3 colors only):**
- Off-white/gray: `#E6E6E6` (background)
- Black: `#0d0d0d` (text, borders)
- Orange: `#FF4D00` (accents, planet, overlays)

**Design Inspiration:**
- `design-ref-01.html` - Mars expedition poster aesthetic
- Brutalist typography (all caps, tight spacing)
- Offset drop shadows on everything
- Big planet/orb with orbiting moons
- Bottom ticker marquee with rules

**The Rules:**
- No Horror
- No Marvel
- Sci-Fi Only
- (These display in the scrolling ticker at bottom)

## Hosting & Deployment

- **Domain:** scifimovieclub.com (registered at Hover, nameservers pointed to Cloudflare)
- **Hosting:** Cloudflare Pages (free plan)
- **Repo:** github.com/kmikeym/sfmc (main branch)
- **Auto-deploy:** Every `git push` to main triggers a Cloudflare Pages rebuild (~30 seconds)
- **Build command:** None (static HTML)
- **Build output directory:** `/` (root)

**To deploy changes:**
```bash
cd "/Users/kmikeym/Documents/KmikeyM Apps Demo/Sci Fi Movie Club"
git add [files] && git commit -m "message" && git push
```

## Files

### Core Site
- **index.html** - Main website (one-page, self-contained)
  - Title: "SFMC" (short for Sci-Fi Movie Club)
  - Planet orb with craters and orbiting moons (120s and 50s orbits)
  - Movie poster grid with hover effect (processed → original)
  - Coming soon cards for upcoming movies
  - Bottom ticker with rules
  - All CSS inline, no dependencies

### Poster Processing
- **posters-input/** - Drop original movie posters here
- **posters-output/** - Processed 3-color block print versions appear here
- **process-posters.sh** - Manual batch processor
- **auto-process.sh** - Auto-watch mode (processes on file drop)
- **README-POSTERS.md** - Full instructions for poster automation

### Design Reference
- **design-ref-01.html** - Mars poster design Mike provided as inspiration

### Documentation
- **claude.md** - This file (project context for future sessions)

## How to Add a Watched Movie

1. Download the movie poster image
2. Drop into `posters-input/`
3. Run `./process-posters.sh`
4. Review the output in `posters-output/` — **get Mike's approval before committing**
5. Add to the `watchedMovies` array in `index.html`:

```javascript
{
    title: "Movie Name",
    poster: "posters-output/filename.jpg",
    originalPoster: "posters-input/filename.jpg",
    date: "Jan 23, 2026",
    location: "AMC Americana at Brand 18",
    link: "https://letterboxd.com/kmikeym/film/movie-name/"
}
```

6. Commit and push (auto-deploys)

**Watched movies link to Mike's Letterboxd review.**

## How to Add an Upcoming Movie

Add to the `upcomingMovies` array in `index.html`:

```javascript
{ title: "Movie Name", date: "Mar", imdb: "https://www.imdb.com/title/ttXXXXXX/" }
```

- Use just the month for date unless tickets are purchased
- If tickets are purchased, add full date + location + ticket emoji + direct showtime link:
```javascript
{ title: "🎟️ Movie Name", date: "Feb 12, 2026", location: "AMC The Grove 14", imdb: "https://www.amctheatres.com/showtimes/XXXXXXXX" }
```

**Upcoming movies link to IMDB (or direct AMC showtime link if tickets purchased).**

## Poster Processing Rules

**CRITICAL: Once Mike approves a processed poster, do NOT reprocess it.** If script parameters change for a new poster, only process the new image — never re-batch approved posters.

**Current processing pipeline:**
1. Convert to grayscale
2. High contrast (-contrast x3)
3. Widen levels (15%, 85%)
4. Posterize to 4 bands (block print effect)
5. Gradient map: darks → black, mids → orange, lights → off-white
   - Orange-heavy gradient (96px white-to-orange, 160px orange-to-black)

**Per-poster tweaks are OK** — different source images may need different parameters. Just don't change approved outputs.

## Link Strategy

| Card Type | Links To |
|-----------|----------|
| Watched movie | Mike's Letterboxd review |
| Upcoming movie | IMDB page |
| Upcoming with tickets | Direct AMC showtime (buy tickets) |

## Technical Notes

**Dependencies (auto-install):**
- ImageMagick (via Homebrew) - for `process-posters.sh`
- fswatch (via Homebrew) - for `auto-process.sh` auto-watch mode

**Browser compatibility:**
- Modern browsers only (uses CSS Grid, aspect-ratio, clamp(), animations)
- Mobile responsive — grid shows minimum 2 columns on phone (minmax 140px)

## Context for Future Claude

This was a quick build on Feb 11, 2026 — Mike wanted something simple and barebones, then iterated on design. The poster automation came as a "wouldn't it be cool if..." request. Keep it simple, don't overbuild.

Design ref was a Mars expedition poster with a big orange planet — that became the orb at the top. The 3-color palette constraint came from that design too.

The hover effect (processed → original poster) is a key feature — shows the SFMC treatment vs the real poster.

Mike's vibe: fast iterations, practical over perfect, but strong visual identity.
