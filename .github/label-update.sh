#!/bin/bash

# Check if a file was provided as an argument
if [[ -z "$1" ]]; then
  echo "Usage: $0 <path_to_labels.json>"
  exit 1
fi

# Set the provided file as the labels file
LABELS_FILE="$1"

# Check if the provided file exists
if [[ ! -f "$LABELS_FILE" ]]; then
  echo "Error: File '$LABELS_FILE' not found!"
  exit 1
fi

# Parse the JSON file and execute each command
jq -r '.[] | "gh label create \"\(.name)\" --color \(.color) --description \"\(.description)\""' "$LABELS_FILE" | while IFS= read -r line; do
  echo "Executing: $line"
  bash -c "$line"
done