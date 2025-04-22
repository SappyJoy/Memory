#!/bin/bash

# Define directories
BUILD_DIR="public_build"
PUBLIC_DIR="public"

echo "Building site..."
# Build the site into a temporary directory
# Ensure build directory exists and is writable if needed (though npx should handle it)
mkdir -p $BUILD_DIR
npx quartz build -o $BUILD_DIR

echo "Syncing files to $PUBLIC_DIR..."
# Synchronize the new build into the public directory
# -a preserves permissions, which is part of the problem here, but also other useful things.
rsync -a --delete $BUILD_DIR/ $PUBLIC_DIR/

echo "Fixing permissions in $PUBLIC_DIR..."
# Add these lines:
# Make directories executable (needed to traverse) and readable for all
find $PUBLIC_DIR -type d -exec chmod 755 {} \;
# Make files readable for all
find $PUBLIC_DIR -type f -exec chmod 644 {} \;
# --- Alternatively, a simpler but potentially broader command: ---
# chmod -R a+r $PUBLIC_DIR/
# Ensure directories are executable for traversal if the above is too simple
# find $PUBLIC_DIR -type d -exec chmod a+x {} \;

echo "Cleaning up build directory..."
# Remove the temporary build directory
rm -rf $BUILD_DIR

echo "Build complete."
