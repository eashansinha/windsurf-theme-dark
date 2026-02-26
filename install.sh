#!/usr/bin/env bash
set -euo pipefail

VSIX_URL="https://raw.githubusercontent.com/eashansinha/windsurf-theme-dark/main/windsurf-theme-dark-1.0.0.vsix"
TMPFILE="$(mktemp /tmp/windsurf-theme-dark-XXXXXX.vsix)"
trap 'rm -f "$TMPFILE"' EXIT

echo "Downloading theme..."
curl -fsSL "$VSIX_URL" -o "$TMPFILE"

IDES=()
command -v windsurf >/dev/null 2>&1 && IDES+=("windsurf")
command -v windsurf-insiders >/dev/null 2>&1 && IDES+=("windsurf-insiders")
command -v code >/dev/null 2>&1 && IDES+=("code")
command -v code-insiders >/dev/null 2>&1 && IDES+=("code-insiders")

if [ ${#IDES[@]} -eq 0 ]; then
  echo "No IDE CLI found (windsurf, code, etc.)."
  echo "Install Windsurf or VS Code first, then re-run this script."
  exit 1
fi

for IDE in "${IDES[@]}"; do
  echo "Installing via $IDE..."
  "$IDE" --install-extension "$TMPFILE" --force 2>&1
done

echo ""
echo "Done! Restart your IDE, then select the theme:"
echo "  Cmd+K Cmd+T → Windsurf Dark"
