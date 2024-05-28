#!/bin/bash

# Get the list of packages to be updated along with their sizes
updates=$(pacman -Qu)

# Count the number of packages to be updated
update_count=$(echo "$updates" | wc -l)

# Calculate the total download size of the updates
update_size=$(pacman -Si | grep "Download Size" | awk '{ sum+=$4 }; END { print sum/1024 " MiB" }')

if [[ $update_count -gt 0 ]]; then
    notify-send -a "pacman" -i "" "Available Updates: $update_count" "Total Size: $update_size" 
fi

# Output the result for Wbar
echo "$update_count"

