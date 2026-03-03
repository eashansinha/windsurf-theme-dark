# Agent Instructions

## Deployment

After making any changes to the theme, run this command to deploy it to Windsurf:

```bash
rm -rf ~/.windsurf/extensions/usacognition.windsurf-theme-dark-1.0.0 && rm -rf ~/.windsurf-insiders/extensions/usacognition.windsurf-theme-dark-1.0.0 && rm -rf ~/.windsurf-next/extensions/usacognition.windsurf-theme-dark-1.0.0
cp -r ~/Desktop/Projects/windsurf-theme-dark ~/.windsurf/extensions/usacognition.windsurf-theme-dark-1.0.0
cp -r ~/Desktop/Projects/windsurf-theme-dark ~/.windsurf-insiders/extensions/usacognition.windsurf-theme-dark-1.0.0
cp -r ~/Desktop/Projects/windsurf-theme-dark ~/.windsurf-next/extensions/usacognition.windsurf-theme-dark-1.0.0
```

This removes the old copies first (to avoid permission errors with `.git` objects), then copies the theme to Windsurf, Windsurf Insiders, and Windsurf Next extensions folders so changes are reflected in all IDE variants. The directory must be named `usacognition.windsurf-theme-dark-1.0.0` (publisher.name-version format) to match the installed extension that VS Code reads from.

After making any changes to the theme, rebuild the `.vsix` before pushing:

```bash
npx @vscode/vsce package --allow-missing-repository
```

This regenerates `windsurf-theme-dark-1.0.0.vsix` which the install script downloads for team members. Always commit the updated `.vsix` alongside your theme changes.

## Lessons Learned

- **Extension directory naming matters.** VS Code only reads extensions from directories named `publisher.name-version` (e.g. `usacognition.windsurf-theme-dark-1.0.0`). Copying to a bare name like `windsurf-theme-dark/` creates a directory VS Code ignores entirely — theme file changes will silently have no effect.
- **Debugging theme tokens.** To verify a theme color is applied at runtime, check the CSS variable on `.monaco-workbench` in DevTools: `getComputedStyle(document.querySelector('.monaco-workbench')).getPropertyValue('--vscode-focusBorder')`. If the value doesn't match the theme file, the extension may not be loading from the expected directory.
- **Cascade active tab bar** uses `focusBorder` theme token via `--vscode-focusBorder` → `--codeium-focus-border` → `bg-[var(--codeium-focus-border)]`. This is different from editor tab indicators (`tab.activeBorderTop`).
