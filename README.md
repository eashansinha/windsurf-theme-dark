# Windsurf Dark Theme

A dark theme for VS Code and Windsurf based on the USACognition design system.

![Theme Preview](preview.png)

## Features

- **Dark background** with `#141414` base color
- **Green accent** (`#00ec7e`) for highlights, strings, and success states
- **Warm cream accent** (`#faf8f6`) for primary UI elements (buttons, badges, cursors)
- **Semantic color coding**:
  - Red (`#f53b3a`) for keywords, errors, and deletions
  - Orange (`#f58e3a`) for classes, types, and warnings
  - Purple (`#956cde`) for functions, constants, and booleans
  - Blue (`#3eb8ed`) for properties, links, and info states

## Color Palette

| Token | Color | Usage |
|-------|-------|-------|
| `bg-page` | `#141414` | Editor background |
| `bg-wash` | `#181a19` | Secondary backgrounds |
| `bg-elevated` | `#1f1f1f` | Widgets, dropdowns |
| `text-primary` | `#ffffffe5` | Primary text |
| `text-secondary` | `#ffffff99` | Secondary text |
| `text-tertiary` | `#ffffff66` | Comments, disabled |
| `accent-primary` | `#faf8f6` | Buttons, badges, cursor |
| `text-green` | `#00ec7e` | Strings, success |
| `text-red` | `#f53b3a` | Keywords, errors |
| `text-orange` | `#f58e3a` | Classes, warnings |
| `text-purple` | `#956cde` | Functions, constants |
| `text-link` | `#3eb8ed` | Links, properties |

## Installation

### Method 1: Install from VSIX (Local)

1. Package the extension:
   ```bash
   npm install -g @vscode/vsce
   vsce package
   ```

2. Install the generated `.vsix` file:
   - In VS Code/Windsurf: `Cmd+Shift+P` → "Extensions: Install from VSIX..."
   - Select the `.vsix` file

### Method 2: Development Mode

1. Copy this folder to your extensions directory:
   - **macOS**: `~/.vscode/extensions/` or `~/.windsurf/extensions/`
   - **Linux**: `~/.vscode/extensions/`
   - **Windows**: `%USERPROFILE%\.vscode\extensions\`

2. Restart VS Code/Windsurf

3. Select the theme: `Cmd+K Cmd+T` → "Windsurf Dark"

### Method 3: Publish to Open VSX

1. Create an account at [open-vsx.org](https://open-vsx.org/)

2. Create a namespace:
   ```bash
   npx ovsx create-namespace <your-namespace> -p <your-token>
   ```

3. Publish:
   ```bash
   npx ovsx publish -p <your-token>
   ```

## Development

To test changes:

1. Open this folder in VS Code/Windsurf
2. Press `F5` to launch Extension Development Host
3. In the new window, select the theme via `Cmd+K Cmd+T`

Changes to the theme JSON are applied live in the Extension Development Host.

## Customization

You can further customize the theme in your `settings.json`:

```json
{
  "workbench.colorCustomizations": {
    "[Windsurf Dark]": {
      "editor.background": "#0d0d0d"
    }
  },
  "editor.tokenColorCustomizations": {
    "[Windsurf Dark]": {
      "comments": "#6a737d"
    }
  }
}
```

## License

MIT
