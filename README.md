# Francho Skills

A practical marketplace of GitHub Copilot plugins for everyday workflows: English coaching, Python guidance, security auditing, and brag tracking.

[![Marketplace](https://img.shields.io/badge/marketplace-francho--skills-1f6feb)](.claude-plugin/marketplace.json)
[![Plugins](https://img.shields.io/badge/plugins-4-success)](plugins)
[![License](https://img.shields.io/badge/license-MIT-blue)](LICENSE)

Inspired by the discoverability style of awesome plugin collections, but focused on installable Copilot Agent Plugins you can use right away.

## Plugin Catalog

| Plugin | Type | What you get |
| --- | --- | --- |
| [francho-english-teacher](plugins/francho-english-teacher) | Skill | Improves your English directly in chat, with a short score and correction tip. |
| [francho-python](plugins/francho-python) | Agent | Python and Databricks coaching for fundamentals, code quality, and practical development workflows. |
| [francho-security](plugins/francho-security) | Skill + Agent | Security audits with a dedicated read-only analyst agent and structured remediation output. |
| [francho-brag](plugins/francho-brag) | Skill | Adds achievements to your brag document with required-field validation and memory of your brag file name. |

## Why this repo

- Curated plugin set with clear, task-focused behavior.
- Ready for both VS Code and Copilot CLI usage.
- Includes a marketplace definition in [.claude-plugin/marketplace.json](.claude-plugin/marketplace.json).

## Quick Start

### VS Code (Agent Plugins)

Agent Plugins in VS Code are in preview and may depend on organization settings.

1. Open the Command Palette.
2. Run `Chat: Install Plugin From Source`.
3. Enter `FranchoLab/skills`.
4. Enable plugins from Extensions (`@agentPlugins`) or Chat Customizations.

Optional marketplace setting:

```json
{
  "chat.plugins.marketplaces": [
    "github/copilot-chat-plugins",
    "github/awesome-copilot",
    "FranchoLab/skills"
  ]
}
```

### Copilot CLI

1. Register this repo as a marketplace:

```bash
copilot plugin marketplace add FranchoLab/skills
copilot plugin marketplace list
```

The marketplace name is `francho-skills`.

2. Install plugins from the marketplace:

```bash
copilot plugin install francho-english-teacher@francho-skills
copilot plugin install francho-python@francho-skills
copilot plugin install francho-security@francho-skills
copilot plugin install francho-brag@francho-skills
copilot plugin list
```

3. Alternative: install directly from repository paths:

```bash
copilot plugin install FranchoLab/skills:plugins/francho-english-teacher
copilot plugin install FranchoLab/skills:plugins/francho-python
copilot plugin install FranchoLab/skills:plugins/francho-security
copilot plugin install FranchoLab/skills:plugins/francho-brag
copilot plugin list
```

## Typical Use Cases

- "Coach my English in every prompt I write in English."
- "Review this Python module and suggest refactors for readability."
- "Run a security audit for recent repository changes."
- "Add this achievement to my brag document."

## Repository Layout

```text
.
├── .claude-plugin/
│   └── marketplace.json
└── plugins/
    ├── francho-brag/
    ├── francho-english-teacher/
    ├── francho-python/
    └── francho-security/
```

## Troubleshooting

- Plugin not visible in VS Code:
  - Confirm Agent Plugins are enabled by policy/settings.
  - Confirm each plugin has a valid `plugin.json`.
- Skill or agent not triggering:
  - Verify naming and paths in each `SKILL.md` or `.agent.md` file.
- Copilot CLI installation fails:
  - Check command syntax with `copilot plugin --help`.

## References

- VS Code Agent Plugins:
  https://code.visualstudio.com/docs/copilot/customization/agent-plugins
- Copilot CLI, finding and installing plugins:
  https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-finding-installing
- Copilot CLI plugin reference:
  https://docs.github.com/en/copilot/reference/copilot-cli-reference/cli-plugin-reference
