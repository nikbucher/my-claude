# my-claude

A personal Claude Code plugin marketplace with CLI tool guides, a git workflow, and development agents.

## What's Included

### Skills

| Skill              | Description                                                                                     |
|--------------------|-------------------------------------------------------------------------------------------------|
| **commit-message** | Generates git commit messages from staged changes                                               |
| **eza**            | Reference guide for [eza](https://github.com/eza-community/eza), a modern `ls` replacement      |
| **miller**         | Reference guide for [Miller](https://github.com/johnkerl/miller), a CSV/TSV/JSON data processor |
| **pfadfinder**     | Guided incremental refactoring workflow using a scout branch as target state                    |

### Agents

| Agent           | Description                                                       |
|-----------------|-------------------------------------------------------------------|
| **se-engineer** | Code reviewer focused on elegant simplicity and minimalist design |
| **meta-agent**  | Generates new Claude Code agent configurations from descriptions  |

## Install

```bash
/plugin marketplace add nikbucher/my-claude
/plugin install my-tools
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
