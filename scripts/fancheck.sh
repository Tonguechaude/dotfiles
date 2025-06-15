#!/bin/bash

sensors_output=$(sensors)

proc_rpm=$(echo "$sensors_output" | grep -E "^cpu_fan:" | sed -E 's/.*cpu_fan:\s*([0-9]+) RPM.*/\1/')
gpu_rpm=$(echo "$sensors_output" | grep -E "^gpu_fan:" | sed -E 's/.*gpu_fan:\s*([0-9]+) RPM.*/\1/')
mid_rpm=$(echo "$sensors_output" | grep -E "^mid_fan:" | sed -E 's/.*mid_fan:\s*([0-9]+) RPM.*/\1/')


proc_rpm=${proc_rpm:-0}
gpu_rpm=${gpu_rpm:-0}
mid_rpm=${mid_rpm:-0}

if [[ $proc_rpm -gt 0 || $gpu_rpm -gt 0 || $mid_rpm -gt 0 ]]; then
    status="on"
else
    status="off"
fi

jq --unbuffered --compact-output -n \
  --arg alt "$status" \
  --arg tooltip "CPU Fan: ${proc_rpm} RPM&#10;GPU Fan: ${gpu_rpm} RPM; MID Fan: ${mid_rpm} RPM" \
  --arg class "$status" \
  '{
    alt: $alt,
    tooltip: $tooltip,
    class: $class
  }'
