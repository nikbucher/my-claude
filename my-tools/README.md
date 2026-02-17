# my-claude

Personal Claude Code plugin with CLI tool guides, development workflows, and specialized agents.

## How it works

- **Skills** are activated automatically by Claude when the task at hand matches the skill's description. No explicit invocation needed.
- **Agents** are used as specialized subagents for complex tasks. Claude delegates work to them when their expertise is required.

## Prerequisites

Some skills require CLI tools to be installed:

```bash
brew install eza     # for the eza skill
brew install miller  # for the miller skill
```

## Skills

### commit-message

Generates git commit messages from staged changes. Analyzes `git status` and `git diff --staged`, then produces a properly formatted commit message (English, imperative mood, max 72 character first
line).

### eza

Reference guide for [eza](https://github.com/eza-community/eza), a modern `ls` replacement. Covers git integration, tree views, icons, sorting, filtering, and common usage patterns.

### miller

Reference guide for [Miller (mlr)](https://miller.readthedocs.io/), a data processing tool for CSV, TSV, JSON, and tabular files. Covers filtering, aggregation, joins, format conversion, and chained
operations.

### pfadfinder

Pfadfinder refactoring workflow. Uses a "scout branch" (one commit ahead) as a target state, then guides step-by-step refactoring with IntelliJ shortcuts, automated rebase, and progress tracking.

Includes helper scripts:

- `detect.sh` -- finds branches that are exactly 1 commit ahead
- `rebase.sh` -- rebases the scout branch onto the implementation branch

### vision

Creates or updates a project vision document (`docs/vision.md`). Asks about goal, users, core features, and value proposition, then generates a structured vision covering goal, users, core features,
key workflows, and success criteria. Focuses on WHAT, not HOW — no technology details.

## Agents

### se-engineer

Expert code reviewer focused on elegant simplicity and thoughtful design. Identifies unnecessary complexity, suggests cleaner alternatives, and crafts minimalist solutions.

### meta-agent

Generates new Claude Code sub-agent configuration files from user descriptions. Handles naming, tool selection, model choice, and trigger pattern design.

## Installation

```bash
# Add as marketplace and install (default: user scope — all projects)
/plugin marketplace add nikbucher/my-claude
/plugin install my-claude

# Or limit to current project only
/plugin install my-claude --scope project

# Or local only (not shared via git)
/plugin install my-claude --scope local
```

| Scope   | Datei                         | Sichtbarkeit               |
|---------|-------------------------------|----------------------------|
| user    | `~/.claude/settings.json`     | Nur du, in allen Projekten |
| project | `.claude/settings.json`       | Ganzes Team (im Git)       |
| local   | `.claude/settings.local.json` | Nur du, nur dieses Projekt |

## Updating

Third-Party-Marketplaces haben standardmässig kein Auto-Update.

```bash
# Manuell updaten
/plugin update my-claude

# Auto-Update aktivieren
# /plugin → Marketplaces → Auto-Update
```

## Development

```bash
# Test locally without installing
claude --plugin-dir /path/to/my-claude

# Validate plugin structure
/plugin validate ./
```

## Troubleshooting

- `/debug` — Plugin-Ladedetails und Fehler anzeigen
- `/plugin validate ./` — Plugin-Struktur validieren
- Cache-Pfad: `~/.claude/plugins/cache/`

## Related: AIUP Plugins

[AI Unified Process (AIUP)](https://aiup.dev) ist eine strukturierte Methodik für AI-gestützte Softwareentwicklung. Die Plugins stammen aus dem
Original-Repo [martinellich/aiup-marketplace](https://github.com/martinellich/aiup-marketplace).

```bash
# AIUP-Marketplace hinzufügen (Fork mit commands-to-skills Refactoring)
/plugin marketplace add nikbucher/aiup-marketplace#feature/commands-to-skills

# Plugins aktivieren
/plugin install aiup-core              # Stack-agnostische Methodik
/plugin install aiup-vaadin-jooq       # Vaadin/jOOQ Stack
```

- **aiup-core**: Vision, Requirements, Entity Model, Use Cases (5 Skills, 2 MCP-Server)
- **aiup-vaadin-jooq**: DB-Migration, Implementierung, Karibu- & Playwright-Tests (4 Skills, 4 MCP-Server)

## Structure

```
my-claude/
├── .claude-plugin/
│   └── plugin.json
├── skills/
│   ├── commit-message/
│   │   └── SKILL.md
│   ├── eza/
│   │   └── SKILL.md
│   ├── miller/
│   │   └── SKILL.md
│   ├── pfadfinder/
│   │   ├── SKILL.md
│   │   ├── detect.sh
│   │   └── rebase.sh
│   └── vision/
│       ├── SKILL.md
│       └── templates/
│           └── vision.md
├── agents/
│   ├── se-engineer.md
│   └── meta-agent.md
└── README.md
```
