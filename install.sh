#!/usr/bin/env bash
set -euo pipefail

VSIX_URL="https://raw.githubusercontent.com/eashansinha/windsurf-theme-dark/main/windsurf-theme-dark-1.1.0.vsix"
TMPFILE="$(mktemp /tmp/windsurf-theme-dark-XXXXXX.vsix)"
TMPDIR="$(mktemp -d /tmp/windsurf-theme-dark-extract-XXXXXX)"
trap 'rm -f "$TMPFILE"; rm -rf "$TMPDIR"' EXIT

EXT_ID="usacognition.windsurf-theme-dark"
EXT_VERSION="1.1.0"
EXT_DIR_NAME="${EXT_ID}-${EXT_VERSION}"

echo "Downloading Windsurf Dark theme..."
curl -fsSL "$VSIX_URL" -o "$TMPFILE"

echo "Extracting..."
unzip -qo "$TMPFILE" -d "$TMPDIR"

# ── Direct-copy install (primary method) ──────────────────────────
# Copies the extension into each IDE's extensions directory.
# This is more reliable than CLI --install-extension, which silently
# fails on some Windsurf builds.

INSTALLED=0

for base in "$HOME/.windsurf" "$HOME/.windsurf-insiders" "$HOME/.windsurf-next" \
            "$HOME/.vscode" "$HOME/.vscode-insiders"; do
  [ -d "$base" ] || continue            # skip if this IDE isn't present
  ext_root="$base/extensions"
  mkdir -p "$ext_root"

  # Remove any previous version of this extension
  for old in "$ext_root"/${EXT_ID}-*/; do
    [ -d "$old" ] && rm -rf "$old"
  done

  target="$ext_root/$EXT_DIR_NAME"
  cp -R "$TMPDIR/extension" "$target"
  echo "  Installed to $target"
  INSTALLED=1
done

# ── CLI install (secondary / fallback) ────────────────────────────
# Attempt CLI install as well; it helps register the extension in the
# IDE's internal database on versions where it still works.

IDES=()
command -v windsurf          >/dev/null 2>&1 && IDES+=("windsurf")
command -v windsurf-next     >/dev/null 2>&1 && IDES+=("windsurf-next")
command -v windsurf-insiders >/dev/null 2>&1 && IDES+=("windsurf-insiders")
command -v code              >/dev/null 2>&1 && IDES+=("code")
command -v code-insiders     >/dev/null 2>&1 && IDES+=("code-insiders")

for IDE in "${IDES[@]}"; do
  echo "  Registering via $IDE CLI..."
  "$IDE" --uninstall-extension "$EXT_ID" 2>/dev/null || true
  "$IDE" --install-extension "$TMPFILE" --force 2>/dev/null || true
done

if [ "$INSTALLED" -eq 0 ] && [ ${#IDES[@]} -eq 0 ]; then
  echo ""
  echo "No Windsurf or VS Code installation detected."
  echo "Install Windsurf or VS Code first, then re-run this script."
  exit 1
fi

echo ""
echo "Done! Restart your IDE, then select the theme:"
echo "  Cmd+K Cmd+T (macOS)  /  Ctrl+K Ctrl+T (Linux/Windows) -> Windsurf Dark"
