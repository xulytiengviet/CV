#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VERSION="$(tr -d '[:space:]' < "$ROOT_DIR/AL_FOLIO_VERSION")"
BUILD_ROOT="$ROOT_DIR/.build"
THEME_DIR="$BUILD_ROOT/al-folio"

rm -rf "$BUILD_ROOT"
mkdir -p "$BUILD_ROOT"

echo "Preparing al-folio $VERSION"
git clone --depth 1 --branch "$VERSION" https://github.com/alshedivat/al-folio.git "$THEME_DIR"

# Remove upstream demo content while preserving layouts, includes, plugins and assets.
rm -rf   "$THEME_DIR/_pages"   "$THEME_DIR/_posts"   "$THEME_DIR/_projects"   "$THEME_DIR/_news"   "$THEME_DIR/_teachings"   "$THEME_DIR/_bibliography"

mkdir -p   "$THEME_DIR/_pages"   "$THEME_DIR/_posts"   "$THEME_DIR/_projects"   "$THEME_DIR/_news"   "$THEME_DIR/_teachings"   "$THEME_DIR/_bibliography"

rsync -a "$ROOT_DIR/site/" "$THEME_DIR/"
ruby "$ROOT_DIR/scripts/apply_branding.rb" "$THEME_DIR/_config.yml" "$ROOT_DIR/config/branding.yml"

echo "Prepared source tree at $THEME_DIR"
