#!/bin/bash
# Package GB Input Display as a distributable zip archive
# Usage: ./scripts/package.sh [version]

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
VERSION="${1:-0.1.0}"
OUTPUT_DIR="$REPO_ROOT/releases"
PACKAGE_NAME="gb-input-display-v${VERSION}"
PACKAGE_DIR="$OUTPUT_DIR/$PACKAGE_NAME"

echo "Packaging GB Input Display v${VERSION}..."

# Clean and create output
rm -rf "$PACKAGE_DIR" "$OUTPUT_DIR/${PACKAGE_NAME}.zip"
mkdir -p "$PACKAGE_DIR"

# Copy files
cp "$REPO_ROOT/apps/overlay-renderer/index.html" "$PACKAGE_DIR/"
cp -r "$REPO_ROOT/presets" "$PACKAGE_DIR/"
cp "$REPO_ROOT/docs/installation.md" "$PACKAGE_DIR/INSTALLATION.md"
cp "$REPO_ROOT/README.md" "$PACKAGE_DIR/"
cp "$REPO_ROOT/LICENSE" "$PACKAGE_DIR/"

# Create zip
cd "$OUTPUT_DIR"
zip -r "${PACKAGE_NAME}.zip" "$PACKAGE_NAME"
rm -rf "$PACKAGE_DIR"

# Generate checksum
sha256sum "${PACKAGE_NAME}.zip" > "${PACKAGE_NAME}.zip.sha256"

echo "Done: $OUTPUT_DIR/${PACKAGE_NAME}.zip"
ls -lh "$OUTPUT_DIR/${PACKAGE_NAME}.zip"
