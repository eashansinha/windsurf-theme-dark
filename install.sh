#!/usr/bin/env bash
set -euo pipefail

BASE_URL="https://raw.githubusercontent.com/eashansinha/windsurf-theme-dark/main"
EXT_DIR_NAME="usacognition.windsurf-theme-dark-1.0.0"

CANDIDATES=(
  "$HOME/.windsurf/extensions"
  "$HOME/.windsurf-insiders/extensions"
  "$HOME/.windsurf-next/extensions"
  "$HOME/.vscode/extensions"
  "$HOME/.vscode-insiders/extensions"
)

TARGETS=()
for DIR in "${CANDIDATES[@]}"; do
  [ -d "$DIR" ] && TARGETS+=("$DIR/$EXT_DIR_NAME")
done

if [ ${#TARGETS[@]} -eq 0 ]; then
  echo "No extensions directory found. Searched:"
  for DIR in "${CANDIDATES[@]}"; do echo "  $DIR"; done
  echo ""
  echo "Install Windsurf or VS Code first, then re-run this script."
  exit 1
fi

for TARGET in "${TARGETS[@]}"; do
  echo "Installing to $TARGET"
  mkdir -p "$TARGET/themes"
  curl -fsSL "$BASE_URL/package.json" -o "$TARGET/package.json"
  curl -fsSL "$BASE_URL/themes/windsurf-dark-color-theme.json" -o "$TARGET/themes/windsurf-dark-color-theme.json"
done

echo ""
echo "Verifying installation..."
for TARGET in "${TARGETS[@]}"; do
  if [ -f "$TARGET/package.json" ] && [ -f "$TARGET/themes/windsurf-dark-color-theme.json" ]; then
    echo "  ✓ $TARGET"
  else
    echo "  ✗ $TARGET (files missing!)"
  fi
done

echo ""
echo "Done! Restart Windsurf/VS Code, then select the theme:"
echo "  Cmd+K Cmd+T → Windsurf Dark"
