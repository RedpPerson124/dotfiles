#!/bin/bash

read total used <<<$(free -m | awk '/^Mem:/ {print $2, $3}')
percent=$(( used * 100 / total ))

# Convert to GiB manually for readability
used_gib=$(awk "BEGIN {printf \"%.2f\", $used/1024}")
total_gib=$(awk "BEGIN {printf \"%.2f\", $total/1024}")

echo "${used_gib} GiB / ${total_gib} GiB (${percent}%)"

