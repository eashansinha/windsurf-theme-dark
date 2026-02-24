# Agent Instructions

## Deployment

After making any changes to the theme, run this command to deploy it to Windsurf:

```bash
rm -rf ~/.windsurf/extensions/usacognition.windsurf-theme-dark-1.0.0 && rm -rf ~/.windsurf-insiders/extensions/usacognition.windsurf-theme-dark-1.0.0
cp -r ~/Desktop/Projects/windsurf-theme-dark ~/.windsurf/extensions/usacognition.windsurf-theme-dark-1.0.0
cp -r ~/Desktop/Projects/windsurf-theme-dark ~/.windsurf-insiders/extensions/usacognition.windsurf-theme-dark-1.0.0
```

This removes the old copies first (to avoid permission errors with `.git` objects), then copies the theme to both the Windsurf and Windsurf Insiders extensions folders so changes are reflected in the IDE. The directory must be named `usacognition.windsurf-theme-dark-1.0.0` (publisher.name-version format) to match the installed extension that VS Code reads from.
