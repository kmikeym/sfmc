#!/bin/bash

# SFMC Poster Processor
# Converts images to SFMC color palette: off-white (#E6E6E6), black (#0d0d0d), orange (#FF4D00)

INPUT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/posters-input"
OUTPUT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/posters-output"

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null; then
    echo "Installing ImageMagick via Homebrew..."
    brew install imagemagick
    if [ $? -ne 0 ]; then
        echo "ERROR: Failed to install ImageMagick. Please install Homebrew first:"
        echo "  /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
        exit 1
    fi
fi

# Process all images in input folder
for img in "$INPUT_DIR"/*; do
    # Skip if no files
    if [ ! -f "$img" ]; then
        continue
    fi
    
    filename=$(basename "$img")
    output="$OUTPUT_DIR/$filename"
    
    echo "Processing: $filename"
    
    # Convert to SFMC palette — block print style:
    # 1. Grayscale + high contrast
    # 2. Posterize to reduce to flat color bands (block print look)
    # 3. Map darks → black, mids → orange, lights → off-white
    convert "$img" \
        -colorspace Gray \
        -contrast -contrast -contrast \
        -level 25%,75% \
        -posterize 3 \
        \( -size 1x128 gradient:"#E6E6E6-#FF4D00" gradient:"#FF4D00-#0d0d0d" -append -flip \) \
        -clut \
        "$output"
    
    if [ $? -eq 0 ]; then
        echo "  ✓ Saved to: posters-output/$filename"
    else
        echo "  ✗ Failed to process $filename"
    fi
done

echo ""
echo "Done! Processed images are in posters-output/"
