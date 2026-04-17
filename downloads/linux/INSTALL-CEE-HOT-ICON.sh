#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DESKTOP_DIR="${XDG_DESKTOP_DIR:-$HOME/Desktop}"
mkdir -p "$DESKTOP_DIR"

cp -f "$BASE_DIR/cee-badge.png" "$DESKTOP_DIR/cee-badge.png"
cp -f "$BASE_DIR/CEE-AC-badge.desktop" "$DESKTOP_DIR/CEE-AC-badge.desktop"
chmod +x "$DESKTOP_DIR/CEE-AC-badge.desktop"

echo "Done. Badge was created on Desktop:"
echo "$DESKTOP_DIR/CEE-AC-badge.desktop"
