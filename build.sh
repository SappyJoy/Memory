#!/bin/bash

# Define directories
BUILD_DIR="public_build"
PUBLIC_DIR="public"

# Build the site into a temporary directory
npx quartz build -o $BUILD_DIR

# Synchronize the new build into the public directory
rsync -a --delete $BUILD_DIR/ $PUBLIC_DIR/

# Remove the temporary build directory
rm -rf $BUILD_DIR

