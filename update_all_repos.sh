#!/bin/bash

# Use the current working directory (PWD)
REPO_DIR=$(pwd)

# Color codes for highlighting
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Loop through all directories in the current working directory
for dir in "$REPO_DIR"/*/; do
    # Enter the directory
    cd "$dir" || continue
    
    # Check if it's a git repository
    if [ -d ".git" ]; then
        echo -e "${YELLOW}Updating $(basename "$dir")...${NC}"
        git pull
        echo -e "${YELLOW}Done!${NC}"
    else
        echo "$(basename "$dir") is not a git repository. Skipping..."
    fi
    
    # Move back to the previous directory
    cd ..
done

echo "All repositories updated."
