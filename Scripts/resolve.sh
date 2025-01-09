#!/bin/bash

# Check if a file name was provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 [--fullhd] <input-file>"
  exit 1
fi

# Flag to determine if Full HD conversion is needed
FULLHD=false

# Parse arguments
if [ "$1" == "--fullhd" ]; then
  echo "converting video to fhd before processing"
  sleep 0.5
  FULLHD=true
  shift
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

# If --fullhd is set, convert the file to Full HD first
if $FULLHD; then
  FULLHD_FILE="$DIR_NAME/${BASE_NAME}d.mp4"
  ffmpeg -hwaccel cuda -i "$INPUT_FILE" -vf scale=1920:1080 -c:v libx264 -crf 23 -preset medium -c:a aac "$FULLHD_FILE"
  # ffmpeg -hwaccel cuda -i "$INPUT_FILE" -vf "scale_cuda=1920:1080" -c:v h264_nvenc -preset p4 -b:v 5M -c:a aac "$FULLHD_FILE"
  
  # Check if the Full HD conversion was successful
  if [ $? -ne 0 ]; then
    echo "Error during Full HD conversion."
    exit 1
  fi
  
  echo "Full HD conversion successful: $FULLHD_FILE"
  INPUT_FILE="$FULLHD_FILE"
fi

# Output file
OUTPUT_FILE="$DIR_NAME/$BASE_NAME.mov"

# Convert the file for DaVinci Resolve
ffmpeg -hwaccel cuda -i "$INPUT_FILE" -c:v dnxhd -profile:v dnxhr_hq -c:a pcm_s16le "$OUTPUT_FILE"

# Check if the conversion was successful
if [ $? -eq 0 ]; then
  echo "Conversion successful: $OUTPUT_FILE"
else
  echo "Error during conversion."
  exit 1
fi
