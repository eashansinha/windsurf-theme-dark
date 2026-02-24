#!/usr/bin/env bash
set -euo pipefail

BASE_URL="https://raw.githubusercontent.com/eashansinha/windsurf-theme-dark/main"
EXT_DIR_NAME="usacognition.windsurf-theme-dark-1.0.0"

TARGETS=()
[ -d "$HOME/.windsurf/extensions" ] && TARGETS+=("$HOME/.windsurf/extensions/$EXT_DIR_NAME")
[ -d "$HOME/.windsurf-insiders/extensions" ] && TARGETS+=("$HOME/.windsurf-insiders/extensions/$EXT_DIR_NAME")
[ -d "$HOME/.vscode/extensions" ] && TARGETS+=("$HOME/.vscode/extensions/$EXT_DIR_NAME")

if [ ${#TARGETS[@]} -eq 0 ]; then
  echo "No Windsurf or VS Code extensions directory found."
  echo "Install Windsurf or VS Code first, then re-run this script."
  exit 1
fi

for TARGET in "${TARGETS[@]}"; do
  echo "Installing to $(basename "$(dirname "$TARGET")")..."
  mkdir -p "$TARGET/themes"
  curl -fsSL "$BASE_URL/package.json" -o "$TARGET/package.json"
  curl -fsSL "$BASE_URL/themes/windsurf-dark-color-theme.json" -o "$TARGET/themes/windsurf-dark-color-theme.json"
done

echo ""
echo "Done! Restart Windsurf/VS Code, then select the theme:"
echo "  Cmd+K Cmd+T → Windsurf Dark"
