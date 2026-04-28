---
name: Repo Standards
description: "Use when working in this repository, especially when creating or updating plugins under plugins/, preparing commits, or finishing implementation tasks. Enforces conventional commits, root README maintenance, and plugin structure validation."
applyTo: "**"
---
# Repository Standards

- Use Conventional Commits for every commit message.
- Follow the pattern: `<type>(<optional-scope>): <short summary>`.
- Preferred types: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`, `ci`, `build`, `perf`.
- Keep summaries imperative and concise.

- When finishing a task, verify whether root documentation is impacted.
- If behavior, available features, plugin catalog, usage, installation, or workflows changed, update the root `README.md` before considering the task complete.

- Any plugin created or updated under `plugins/` must keep required structure and metadata consistent.
- Validate the plugin keeps at least:
  - `plugin.json`
  - `README.md`
- If the plugin provides capabilities, ensure corresponding folders/files are present and consistent:
  - `skills/<skill-name>/SKILL.md` for skills
  - `agents/<agent-name>.agent.md` for agents
- After plugin changes, confirm `README.md` and `plugin.json` reflect current capabilities and naming.
