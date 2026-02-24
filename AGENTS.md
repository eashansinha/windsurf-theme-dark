# Agent Instructions

## Deployment

After making any changes to the theme, run this command to deploy it to Windsurf:

```bash
rm -rf ~/.windsurf/extensions/windsurf-theme-dark && rm -rf ~/.windsurf-insiders/extensions/windsurf-theme-dark
cp -r ~/Desktop/Projects/windsurf-theme-dark ~/.windsurf/extensions/
cp -r ~/Desktop/Projects/windsurf-theme-dark ~/.windsurf-insiders/extensions/
```

This removes the old copies first (to avoid permission errors with `.git` objects), then copies the theme to both the Windsurf and Windsurf Insiders extensions folders so changes are reflected in the IDE.
