#!/bin/bash

CONTENT_DIR="/app/content"

# Initial build
./build.sh

# Watch for changes
while inotifywait -r -e modify,create,delete,move "$CONTENT_DIR"; do
    echo "Detected changes in $CONTENT_DIR, rebuilding..."
    ./build.sh
done
