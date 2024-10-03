#!/bin/bash

# Get the list of packages to be updated
updates=$(pacman -Qu | awk '{print $1}')

# Count the number of packages to be updated
update_count=$(echo "$updates" | wc -l)

# Calculate the total download size of the updates
update_size=0
for pkg in $updates; do
    size=$(pacman -Si "$pkg" | grep "Download Size" | awk '{print $4}')
    update_size=$(echo "$update_size + $size" | bc)
done

# Convert size from KiB to MiB
update_size=$(echo "$update_size / 1024" | bc)

if [[ $update_count -gt 0 ]]; then
    notify-send -a "pacman" -i "" "Available Updates: $update_count" "Total Size: $update_size MiB"
fi

# Output the result for Waybar
echo "$update_count"