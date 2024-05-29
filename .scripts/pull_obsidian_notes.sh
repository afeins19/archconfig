#!/bin/bash

# Navigate to the directory of your Git repository
cd $HOME/Documents/obsdian || exit

# Check for uncommitted changes
if ! git diff-index --quiet HEAD --; then
    # Notify about uncommitted changes
    notify-send -a "GitHub" -i "/usr/share/pixmaps/obsidian.png" "Pull Unsucesslfull" -u normal "Uncommitted changes in local directory"
    exit 1
fi

# Pull the latest changes
git_status=$(git pull)

# Notify that the Git pull has completed
summary=$(echo "$git_status" | grep -E "Updating|Already up to date|Fast-forward|changed|insertion|deletion")

# notify the the status with icon 
notify-send -a "GitHub" -i "/usr/share/pixmaps/obsidian.png" -u normal "Obsidian Repository" "$summary"