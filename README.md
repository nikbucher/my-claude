# my-claude

A personal Claude Code plugin marketplace with CLI tool guides, a git workflow, and development agents.

## What's Included

### Skills

| Skill              | Description                                                                                     |
|--------------------|-------------------------------------------------------------------------------------------------|
| **commit-message** | Generates git commit messages from staged changes                                               |
| **eza**            | Reference guide for [eza](https://github.com/eza-community/eza), a modern `ls` replacement      |
| **inception**      | Creates or updates an Architecture Inception Canvas (AIC)                                       |
| **miller**         | Reference guide for [Miller](https://github.com/johnkerl/miller), a CSV/TSV/JSON data processor |
| **pfadfinder**     | Guided incremental refactoring workflow using a scout branch as target state                    |
| **vision**         | Creates or updates the project vision document                                                  |

### Agents

| Agent           | Description                                                       |
|-----------------|-------------------------------------------------------------------|
| **se-engineer** | Code reviewer focused on elegant simplicity and minimalist design |
| **meta-agent**  | Generates new Claude Code agent configurations from descriptions  |

## Install

```bash
# In claude code
/plugin marketplace add nikbucher/my-claude
/plugin install my-tools

# In terminal
claude plugin marketplace add nikbucher/my-claude
claude plugin install my-tools@my-claude
```

By default, plugins are installed at user scope (all projects). To limit scope:

```bash
/plugin install my-tools --scope project   # whole team, via .claude/settings.json
/plugin install my-tools --scope local     # only you, only this project
```

| Scope   | File                          | Visibility                  |
|---------|-------------------------------|-----------------------------|
| user    | `~/.claude/settings.json`     | Only you, in all projects   |
| project | `.claude/settings.json`       | Whole team (in Git)         |
| local   | `.claude/settings.local.json` | Only you, only this project |

## Update

Third-party marketplaces have no auto-update by default.

```bash
# Manual update
/plugin update my-claude

# Enable auto-update via UI
# /plugin → Marketplaces → Auto-Update
```

## Uninstall

```bash
# In claude code
/plugin disable my-tools

/plugin uninstall my-tools
/plugin marketplace remove nikbucher/my-claude

# In terminal
claude plugin disable my-tools

claude plugin uninstall my-tools@my-claude
claude plugin marketplace remove nikbucher/my-claude
```

## Prerequisites

Some skills require external tools:

```bash
brew install eza miller
```

## Interesting links

- [Claude Code Plugins](https://code.claude.com/docs/en/plugins)
- [Claude Code Plugins Reference](https://code.claude.com/docs/en/plugins-reference)
- [Discover marketplaces plugins](https://code.claude.com/docs/en/discover-plugins)
- [AIUP](https://aiup.dev)
- [AIUP Marketplace](https://aiup.dev/marketplace)
- [AIUP Docs](https://aiup.dev/docs)
