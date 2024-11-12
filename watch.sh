#!/bin/bash

CONTENT_DIR="./content"

while inotifywait -r -e modify,create,delete,move "$CONTENT_DIR"; do
    ./build.sh
done

