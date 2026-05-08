---
name: eza
description: Use eza instead of ls for directory listings. Provides better formatting, git integration, tree views, and icons. Use when listing files, exploring directory structures, or showing file metadata.
---

# eza

Modern `ls` replacement. Prefer eza over ls for interactive use.

## Common Commands

```bash
eza -l                                          # long format
eza -la                                         # long format + hidden files
eza -l --git --icons                            # with git status and icons
eza -l --group-directories-first               # directories first
eza --tree --level=2                            # tree view, depth 2
eza --tree --level=2 --git-ignore              # tree, respecting .gitignore
```

## Useful Combinations

```bash
# Best overview of current directory
eza -l --git --icons --group-directories-first

# Project structure
eza --tree --level=2 --icons --git-ignore

# Most recently changed
eza -l --sort=modified --reverse

# Largest files
eza -l --sort=size --reverse
```

## Git Status Indicators

`--` not modified · `M-` staged · `-M` unstaged · `A-` added · `??` untracked

## When to Use ls Instead

- Portable shell scripts (eza may not be installed)
- POSIX compliance required
