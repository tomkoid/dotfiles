#!/bin/bash

# Check if a file name was provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <input-file>"
  exit 1
fi

# Input file
INPUT_FILE="$1"

# Check if the input file exists
if [ ! -f "$INPUT_FILE" ]; then
  echo "Error: File '$INPUT_FILE' not found."
  exit 1
fi

# Get the base name of the file (without extension)
BASE_NAME=$(basename "$INPUT_FILE" .mp4)

# Get the directory of the input file
DIR_NAME=$(dirname "$INPUT_FILE")

# Output file
OUTPUT_FILE="$DIR_NAME/$BASE_NAME.mov"

# Convert the file using ffmpeg
ffmpeg -i "$INPUT_FILE" -c:v dnxhd -profile:v dnxhr_hq -c:a pcm_s16le "$OUTPUT_FILE"

# Check if the conversion was successful
if [ $? -eq 0 ]; then
  echo "Conversion successful: $OUTPUT_FILE"
else
  echo "Error during conversion."
  exit 1
fi
