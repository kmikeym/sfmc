# SFMC Poster Processor

Automatically converts movie posters to the SFMC color palette (off-white, black, orange) in a block print style.

## Quick Start

Drop images into `posters-input/`, then:
```bash
cd "/Users/kmikeym/Documents/KmikeyM Apps Demo/Sci Fi Movie Club"
./process-posters.sh
```
Processed posters appear in `posters-output/`.

## Folders

- **posters-input/** - Drop original poster images here
- **posters-output/** - Processed images appear here

## Setup (First Time Only)

The scripts will auto-install dependencies (ImageMagick, fswatch) via Homebrew when you first run them.

If you don't have Homebrew, install it first:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Usage

### Option 1: Auto-Processing (Recommended)

Run this in Terminal to start watching the folder:
```bash
cd "/Users/kmikeym/Documents/KmikeyM Apps Demo/Sci Fi Movie Club"
./auto-process.sh
```

Now whenever you drop an image into `posters-input/`, it'll be automatically processed and saved to `posters-output/`.

Press Ctrl+C to stop watching.

### Option 2: Manual Processing

Drop images into `posters-input/`, then run:
```bash
cd "/Users/kmikeym/Documents/KmikeyM Apps Demo/Sci Fi Movie Club"
./process-posters.sh
```

## How It Works

The script:
1. Converts images to grayscale
2. Increases contrast to separate blacks from whites
3. Applies orange color overlay
4. Adjusts levels for the off-white background

This matches the CSS filter effect used on the website.

## Tips

- Use high-resolution poster images for best results
- The script preserves original filenames
- Processed images are saved as JPG/PNG (same format as input)
- You can process the same image multiple times (it'll overwrite)
