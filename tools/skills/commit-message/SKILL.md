---
name: commit-message
description: Generate a commit message for staged changes
---

# Commit Message Generator

Analyze the **staged** Git changes and generate an appropriate commit message.

## Steps

1. Run `git status` to get an overview
2. Run `git diff --staged` to see the staged changes in detail
3. Optional: For complex changes, read relevant files with the Read tool for more context

**Note:** The commit message refers only to staged changes (green in `git status`), not unstaged changes (red).

## Commit Message Rules

- Write in English
- First line: Imperative mood, max 72 characters (e.g., "Add feature X" not "Added feature X")
- Empty line after first line if using a body
- Body: ONLY for complex changes (multiple files, non-obvious reasons), use '-' for list items, explain the "why", not the "what"
- For simple changes: First line only, no body

## Output

Output the suggested commit message in a code block:

```
<commit-message>
```
