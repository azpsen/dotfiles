#!/bin/bash

# Loop through each subdirectory
for dir in */; do
    # Navigate into the subdirectory
    cd "$dir" || continue

    # Find all .sh files and move them to the parent directory
    find . -type f -name "*.sh" -exec mv {} .. \;

    # Delete all other files and directories
    rm -rf *

    # Go back to the parent directory
    cd ..
done
