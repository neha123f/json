#!/bin/bash

# Check if a filename is provided as an argument
if [ $# -ne 1 ]; then
  echo "Usage: $0 <json_file>"
  exit 1
fi

# Get the JSON filename from the cmd
json_file="$1"

# Use jq to count and format severity levels
severity_count=$(cat "$json_file" | jq '[.. | select(.severity?)] | group_by(.severity) | map({severity: .[0].severity, count: length})')

# Use jq to extract the "Trafficlight" value (correct capitalization)
trafficlight_value=$(cat "$json_file" | jq -r '.trafficLight')

# Create a JSON object containing severity count and traffic light
result_json="{\"SeverityCount\": $severity_count, \"Trafficlight\": \"$trafficlight_value\"}"

# Print the JSON result
echo "$result_json"
