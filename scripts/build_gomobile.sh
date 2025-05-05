#!/bin/bash

set -e

ECHO_PREFIX="[build_gomobile]"

echo "$ECHO_PREFIX Starting Go mobile build process..."

# Check if gomobile is installed
if ! command -v gomobile &> /dev/null; then
    echo "$ECHO_PREFIX gomobile not found, installing..."
    go install golang.org/x/mobile/cmd/gomobile@latest
    gomobile init
fi

# Check if gobind is installed
if ! command -v gobind &> /dev/null; then
    echo "$ECHO_PREFIX gobind not found, installing..."
    go install golang.org/x/mobile/cmd/gobind@latest
fi

# Navigate to the core directory
cd "$(dirname "$0")/../core"

# Build for Android
echo "$ECHO_PREFIX Building for Android..."
gomobile bind -target=android -o ../mobile/android/app/libs/core.aar ./p2p ./storage ./crypto

# Build for iOS (if on macOS)
if [[ "$(uname)" == "Darwin" ]]; then
    echo "$ECHO_PREFIX Building for iOS..."
    gomobile bind -target=ios -o ../mobile/ios/core.xcframework ./p2p ./storage ./crypto
else
    echo "$ECHO_PREFIX Skipping iOS build (not on macOS)"
fi

echo "$ECHO_PREFIX Build completed successfully!"
