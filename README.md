# SFMC - Sci-Fi Movie Club

A brutalist/poster-style one-page website to track sci-fi movies watched with friends.

## Features

- **3-color design system**: Off-white, black, orange
- **Animated planet orb** with slowly orbiting moons
- **Movie poster grid** with hover effects (processed → original)
- **Automated poster processing** (converts any image to SFMC palette)
- **Coming soon slots** for scheduled movies
- **Bottom ticker** with rules (No Horror / No Marvel)

## Live Site

[Coming soon - will be deployed via Cloudflare Pages]

## How to Use

1. Open `scifi-movie-club.html` in a browser
2. To add watched movies:
   - Drop poster image into `posters-input/`
   - Run `./process-posters.sh` (or `./auto-process.sh` for auto-watch mode)
   - Edit `watchedMovies` array in HTML with movie details
3. To schedule upcoming movies:
   - Edit `upcomingMovies` array with title, date, location

## Tech Stack

- Pure HTML/CSS/JavaScript (no dependencies)
- ImageMagick for poster processing
- fswatch for auto-processing

## Design

Inspired by brutalist poster design with offset drop shadows and all-caps typography. The color palette constraint (3 colors only) creates a strong visual identity.

See `claude.md` for full project context and design decisions.

## Rules

- No Horror
- No Marvel
- Sci-Fi Only
