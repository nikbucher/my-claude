---
name: eza
description: Use eza instead of ls for directory listings. Provides better formatting, git integration, tree views, and icons. Use when listing files, exploring directory structures, or showing file metadata.
---

# eza - Modern ls Replacement

eza is a modern replacement for `ls` with enhanced features including colors, icons, git status integration, and tree views.

## Why Use eza Over ls?

- **Git integration** - Shows git status inline
- **Icons** - Visual file type indicators
- **Better colors** - More informative color coding
- **Tree views** - Built-in recursive tree display
- **Better formatting** - More readable output
- **Extended metadata** - Show more file information

## Basic Usage

### Simple Listing

```bash
# Basic listing (grid view, default)
eza

# One file per line
eza -1

# Long format with metadata
eza -l

# Long format with header row
eza -l --header
```

### Show Hidden Files

```bash
# Show hidden files
eza -a

# Show all including . and ..
eza -aa

# Almost all (like ls -A)
eza -A
```

## Git Integration

```bash
# Show git status for each file
eza -l --git

# Show git repo status
eza -l --git-repos

# Long format with git status and icons
eza -l --git --icons
```

**Git status indicators:**

- `--` Not modified
- `M-` Modified (staged)
- `-M` Modified (unstaged)
- `A-` Added (staged)
- `??` Untracked
- `!!` Ignored

## Tree Views

```bash
# Show directory tree
eza --tree

# Limit tree depth
eza --tree --level=2
eza --tree --level=3

# Tree with long format
eza -l --tree --level=2

# Tree with git status
eza --tree --level=2 --git
```

## Sorting

```bash
# Sort by modification time (newest first)
eza -l --sort=modified --reverse
eza -l --sort=newest

# Sort by size
eza -l --sort=size

# Sort by extension
eza -l --sort=extension

# Sort by name (case-sensitive)
eza -l --sort=Name

# Group directories first
eza -l --group-directories-first

# Group directories last
eza -l --group-directories-last
```

## Filtering

```bash
# Only show directories
eza -D
eza --only-dirs

# Only show files
eza -f
eza --only-files

# Show only directories with tree view
eza --only-dirs --tree

# Ignore patterns
eza --ignore-glob="*.tmp|*.log"

# Respect .gitignore
eza --git-ignore
```

## Detailed Metadata

```bash
# Show all metadata
eza -l --header --git --inode

# Show file inodes
eza -l --inode

# Show number of hard links
eza -l --links

# Show file permissions in octal
eza -l --octal-permissions

# Show group ownership
eza -l --group

# Show total directory sizes (recursive)
eza -l --total-size

# Show allocated blocks
eza -l --blocksize
```

## Timestamps

```bash
# Show modified time (default)
eza -l --modified

# Show accessed time
eza -l --accessed

# Show created time
eza -l --created

# Show changed time
eza -l --changed

# Custom time format
eza -l --time-style=iso
eza -l --time-style=long-iso
eza -l --time-style=full-iso
eza -l --time-style=relative
eza -l --time-style='+%Y-%m-%d %H:%M'
```

## Display Options

```bash
# Show icons (when in a terminal)
eza --icons

# Force icons always
eza --icons=always

# Show file size in bytes
eza -l --bytes

# Show file size with binary prefixes (KiB, MiB)
eza -l --binary

# Color scale by size or age
eza -l --color-scale=size
eza -l --color-scale=age
eza -l --color-scale=all

# Show as hyperlinks (terminal support required)
eza -l --hyperlink

# Custom width
eza --width=100
```

## Recursion

```bash
# Recurse into directories (list view)
eza -R

# Recurse with depth limit
eza -R --level=2

# Recurse as tree
eza --tree --level=3

# Follow symlinks while recursing
eza -R --follow-symlinks
```

## Common Combinations

### Quick File Exploration

```bash
# Best overview of current directory
eza -l --git --icons --group-directories-first

# Compact view with icons
eza --icons --group-directories-first

# See what changed recently
eza -l --sort=modified --reverse | head -20
```

### Project Structure

```bash
# Show project structure (2 levels)
eza --tree --level=2 --icons --git-ignore

# Show only directories in tree
eza --tree --only-dirs --level=3

# Full project tree with git status
eza --tree --git --icons --level=3
```

### File Analysis

```bash
# Find largest files
eza -l --sort=size --reverse

# See oldest files
eza -l --sort=oldest

# Show file permissions and ownership
eza -l --octal-permissions --group

# Full metadata view
eza -l --header --inode --links --git --group --binary
```

### Clean Output for Scripts

```bash
# No colors, simple listing
eza --color=never -1

# Long format, no icons
eza -l --icons=never --color=never
```

## When to Use eza

**Use eza for:**

- Interactive directory exploration
- Viewing git status of files
- Tree views of directory structures
- Visual file browsing with icons
- Detailed file metadata inspection
- Sorting and filtering files

**Use regular ls when:**

- Writing portable scripts (eza might not be installed)
- POSIX compliance is required
- Working on minimal/embedded systems

## Useful Aliases

Consider adding these to your shell configuration:

```bash
alias ls='eza'
alias l='eza -l --git --icons --group-directories-first'
alias la='eza -la --git --icons --group-directories-first'
alias ll='eza -l --git --icons --group-directories-first --header'
alias lt='eza --tree --level=2 --icons'
alias lta='eza --tree --level=3 --icons --git-ignore'
```

## Quick Reference

| Task             | Command                            |
|------------------|------------------------------------|
| Basic listing    | `eza`                              |
| Long format      | `eza -l`                           |
| With git status  | `eza -l --git`                     |
| With icons       | `eza --icons`                      |
| Tree view        | `eza --tree --level=2`             |
| Only directories | `eza -D` or `--only-dirs`          |
| Sort by size     | `eza -l --sort=size --reverse`     |
| Sort by time     | `eza -l --sort=modified --reverse` |
| Show hidden      | `eza -a`                           |
| Group dirs first | `eza -l --group-directories-first` |
| Total dir sizes  | `eza -l --total-size`              |
| Ignore gitignore | `eza --git-ignore`                 |

For more info: `eza --help` or `man eza`
