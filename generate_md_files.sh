#!/bin/bash

# Create directory for files
mkdir -p dummy_md_files

# Generate 2550 markdown files
for i in $(seq 1 2550); do
  # Create filename with padding
  filename="dummy_md_files/file_$(printf "%04d" $i).md"
  
  # Generate random content
  echo "# Dummy File $i" > "$filename"
  echo "" >> "$filename"
  echo "Date: $(date +"%Y-%m-%d")" >> "$filename"
  echo "ID: $(uuidgen 2>/dev/null || echo "id-$RANDOM-$RANDOM")" >> "$filename"
  echo "" >> "$filename"
  echo "## Content" >> "$filename"
  echo "" >> "$filename"
  echo "Lorem ipsum dolor sit amet, consectetur adipiscing elit." >> "$filename"
  echo "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua." >> "$filename"
  echo "" >> "$filename"
  echo "* Item 1" >> "$filename"
  echo "* Item 2" >> "$filename"
  echo "* Item 3" >> "$filename"
  
  # Print progress every 250 files
  if (( i % 250 == 0 )); then
    echo "Created $i files..."
  fi
done

echo "Done! Created 2550 markdown files in dummy_md_files/"