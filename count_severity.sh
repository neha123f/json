#!/bin/bash

# Check if a filename is provided as an argument
if [ $# -ne 1 ]; then
  echo "Usage: $0 <json_file>"
  exit 1
fi

# Get the JSON filename from the command line argument
json_file="$1"


# Use jq to count and format severity levels
cat "$json_file" | jq '[.. | select(.severity?)] | group_by(.severity) | map({severity: .[0].severity, count: length})'
trafficlight=$(cat "$json_file" | jq '. | select(.trafficLight != null).trafficLight')
echo  "Trafficlight Value:$trafficlight_value"



