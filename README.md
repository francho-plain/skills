# Francho Skills

Collection of agent plugins to use with VS Code (GitHub Copilot Chat) and Copilot CLI.

This repository includes:

- A marketplace in .claude-plugin/marketplace.json
- Three plugins:
	- plugins/francho-english-teacher
	- plugins/francho-python
	- plugins/francho-security
- Main customizations included in this repository:
	- Skill: prompt-english-coach
	- Agent: Python coach
	- Skill: security-audit
	- Agent: code-cop

## Repository structure

```text
.
├── .claude-plugin/
│   └── marketplace.json
└── plugins/
	├── francho-english-teacher/
	│   ├── plugin.json
	│   ├── README.md
	│   └── skills/
	│       └── prompt-english-coach/
	│           └── SKILL.md
	├── francho-python/
	│   ├── plugin.json
	│   ├── README.md
	│   └── agents/
	│       └── python-databricks-coach.agent.md
	└── francho-security/
		├── plugin.json
		├── README.md
		├── agents/
		│   └── code-cop.agent.md
		└── skills/
			└── security-audit/
				└── SKILL.md
```

## Requirements

- A recent VS Code version with GitHub Copilot enabled
- Copilot CLI installed (for the CLI section)
- Git available on your system

## Usage in VS Code

Agent Plugins in VS Code are currently in preview and depend on your organization settings.

### Option A: install from source (recommended for quick testing)

1. Open the Command Palette.
2. Run Chat: Install Plugin From Source.
3. Enter `FranchoLab/skills` as the source repository.
4. Enable the plugin from Extensions > Agent Plugins - Installed or from Chat Customizations.

### Option B: use marketplaces in VS Code

VS Code supports plugin marketplaces through chat.plugins.marketplaces.

Example:

```json
{
	"chat.plugins.marketplaces": [
		"FranchoLab/skills"
	]
}
```

Then, in Extensions, search with @agentPlugins to browse and install.

## Usage in Copilot CLI

### 1) Register this repository as a marketplace

This repo includes a marketplace in .claude-plugin/marketplace.json, which Copilot CLI detects when you add the repository.

```bash
copilot plugin marketplace add FranchoLab/skills
copilot plugin marketplace list
```

The marketplace name is francho-skills.

### 2) Install the plugin from that marketplace

```bash
copilot plugin install francho-english-teacher@francho-skills
copilot plugin install francho-python@francho-skills
copilot plugin install francho-security@francho-skills
copilot plugin list
```

### 3) Alternative: install directly from the repository

```bash
copilot plugin install FranchoLab/skills:plugins/francho-english-teacher
copilot plugin install FranchoLab/skills:plugins/francho-python
copilot plugin install FranchoLab/skills:plugins/francho-security
copilot plugin list
```

### 4) Update or uninstall

```bash
copilot plugin update francho-english-teacher
copilot plugin update francho-python
copilot plugin update francho-security
copilot plugin uninstall francho-english-teacher
copilot plugin uninstall francho-python
copilot plugin uninstall francho-security
```

## Useful marketplace commands (Copilot CLI)

```bash
copilot plugin marketplace list
copilot plugin marketplace browse francho-skills
copilot plugin marketplace remove francho-skills
```

Note: if the marketplace has installed plugins, removal might require --force.

## Quick troubleshooting

- The plugin does not appear in VS Code:
	- Check that chat.plugins.enabled is enabled by your organization.
	- Confirm plugin.json is in a recognized path (root, .plugin, .github/plugin, .claude-plugin).
- The skill does not load:
	- Check the name in SKILL.md and the skill folder name.
- Copilot CLI install fails:
	- Run copilot plugin [SUBCOMMAND] --help to see command help.

## Official references

- VS Code Agent Plugins:
	https://code.visualstudio.com/docs/copilot/customization/agent-plugins
- Copilot CLI - Finding and installing plugins:
	https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-finding-installing
- Copilot CLI plugin reference:
	https://docs.github.com/en/copilot/reference/copilot-cli-reference/cli-plugin-reference
