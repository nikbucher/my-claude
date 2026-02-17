---
name: vision
description: >
  Creates or updates the project vision.
  Use when the user asks to "start a new project", "create a vision",
  "define the project scope", or mentions project vision or project kickoff.
---

# Vision

## Instructions

Create or update the project vision document: `docs/vision.md`
$ARGUMENTS

## Templates

Use [templates/vision.md](templates/vision.md) as the vision document structure.

## Workflow

1. Read any existing `docs/vision.md`
2. If context is missing or incomplete, ask the user about:
    - Goal: What is the main purpose of this application?
    - Users: Who will use it? (roles, personas)
    - Core Features: What are the 3-5 key capabilities?
    - Value: What problem does it solve?
3. Create/update `docs/vision.md` using the vision template

## DO NOT

- Include technology details in the vision (focus on WHAT, not HOW)
- Write more than one page for the vision
