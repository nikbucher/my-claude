# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Rules

- Always bump `version` in each affected plugin's `.claude-plugin/plugin.json` before committing (semver: MAJOR.MINOR.PATCH for breaking.features.fixes).
- Commit messages and agent outputs in English.

## What This Is

A Claude Code plugin marketplace (`my-claude`) containing four plugins: `my-tools` (skills + agents), `my-mcp` (core MCP servers), `my-mcp-jvm` (JVM MCP servers), and `my-rust` (Rust LSP). Provides
CLI guides, workflows, development agents, MCP server integrations, and LSP integrations.

## Architecture

```
.claude-plugin/marketplace.json   — marketplace manifest, references plugins
my-tools/                         — skills + agents plugin
  .claude-plugin/plugin.json      — plugin manifest (name, version, author)
  skills/<name>/SKILL.md          — skill definitions (YAML frontmatter + markdown instructions)
  skills/<name>/*.sh              — helper scripts referenced by skills
  skills/<name>/templates/*.md    — templates referenced by skills
  agents/<name>.md                — agent definitions (YAML frontmatter + system prompt)
my-mcp/                           — core MCP servers (Context7, Playwright)
  .claude-plugin/plugin.json
  .mcp.json
my-mcp-jvm/                       — JVM MCP servers (Vaadin, Karibu, jOOQ, JavaDocs)
  .claude-plugin/plugin.json
  .mcp.json
my-rust/                          — Rust LSP (rust-analyzer)
  .claude-plugin/plugin.json      — plugin manifest with lspServers config
```

**Marketplace vs Plugin**: `.claude-plugin/marketplace.json` at root defines this repo as a marketplace. Each plugin has its own `.claude-plugin/plugin.json`.

## Plugin Component Patterns

### Skills (`SKILL.md`)

- YAML frontmatter: `name`, `description` (required). Description controls when Claude auto-activates the skill.
- Body: markdown instructions with steps, rules, output format.
- Can reference local files: `[templates/vision.md](templates/vision.md)`, helper scripts via `detect.sh`/`rebase.sh`.
- `$ARGUMENTS` placeholder receives user input.
- Shell commands in context blocks: `!`​`git branch --show-current` runs at activation time.

### Agents (`.md` in `agents/`)

- YAML frontmatter: `name`, `description` (required), `tools`, `color`, `model` (optional).
- `description` must include trigger conditions ("Use this when...", "Use proactively after...").
- Body: system prompt defining the agent's persona and methodology.
- Tool selection: start minimal. Prefer Read/Edit/Glob over Bash equivalents.
- Model selection: haiku (simple), sonnet (standard, default), opus (complex reasoning).

## Language

- Skills can be in German or English (pfadfinder is German, others English).

## Development & Testing

```bash
# Test plugin locally without installing
claude --plugin-dir /path/to/my-claude

# Validate plugin structure
/plugin validate ./

# Debug plugin loading
/debug
```

## Installation (for users)

```bash
/plugin marketplace add nikbucher/my-claude
/plugin install my-tools
```

## Versioning

- Plugins are versioned independently and use semantic versioning.
