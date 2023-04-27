#!/bin/bash
# Script to convert PNG files to SVG format using ImageMagick

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null
then
    echo "ImageMagick is not installed. Please install it first."
    exit
fi

# Check if input file is specified
if [ -z "$1" ]
then
    echo "Usage: ./png-to-svg.sh input_file.png"
    exit
fi

# Check if input file exists
if [ ! -f "$1" ]
then
    echo "File $1 does not exist."
    exit
fi

# Get input file name and extension
filename=$(basename -- "$1")
extension="${filename##*.}"

# Check if input file is a PNG image
if [ "$extension" != "png" ]
then
    echo "File $1 is not a PNG image."
    exit
fi

# Set output file name and extension
output="${filename%.*}.svg"

# Convert PNG to SVG
convert "$1" "$output"

echo "File $1 converted to $output."
