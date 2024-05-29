#!/bin/bash 

#Repo path 
REPO_PATH=/home/aaron/Documents/obsdian

# current date 
CURRENT_DATE=$(date "+%y-%m-%d %H:%M")

# change into obsidian notes repo 
cd $REPO_PATH || { echo "[Error] Failed to locate $REPO_PATH"; exit 1;}

# General message for daemon 
MSG="[push_obsidian_notes.sh]"
echo $MSG
echo ""

# Ensure the directory is marked as safe (github security feature)
git config --global --add safe.directory $REPO_PATH

# check if changes were made to notes 
if ! git diff-index --quiet HEAD --; then
    git add . 
    git commit -m "Auto commmit from archpc @ $CURRENT_DATE" || { echo "[Error] Failed to commit files"; exit 1;}
    
    if git push; then 
        echo "[Sucess] Files Successfully Pushed to Git"
    else
        echo "[Error] Push Failed"
    fi
else 
    echo "No changes to commit"
fi 

    