# francho-brag

Maintain your brag document with AI assistance.

## What this plugin does

- Adds the `bragdoc` skill to record achievements and wins in a brag document.
- Validates required data before inserting entries, so it never invents information.
- Remembers the brag document absolute path across sessions using `/memories/bragdoc-config.md`.
- If the target brag document does not exist, it can create it from a built-in template after user confirmation.
- If the brag file is in a Git repository, it can commit (with updated section in the message) and push after user confirmation.

## Skills

- bragdoc: Adds an achievement entry to the user's brag document, prompting for any missing required fields.

## Usage

- Keep the plugin enabled in your Copilot setup.
- Ask Copilot to record an achievement (e.g. "add to my brag doc: shipped the login redesign on 2026-04-28").
- On first use, the skill will ask for the brag document absolute path and remember it for future sessions.
- If the provided file path does not exist, the skill asks whether to create a new brag document from template.
- Use it to create a new brag document or get guidance on what to record.

## Version

- 0.1.3

## Changelog

### 0.1.3

- feat: rename skill entrypoint from `brag` to `bragdoc`.
- feat: switch stored memory path key to `/memories/bragdoc-config.md`.
- feat: support creating a missing brag file from template after user confirmation.

### 0.1.2

- feat: enhance francho-brag plugin to support optional commit/push after user confirmation.

### 0.1.1

- feat: update brag plugin to require absolute path for document storage and enhance memory handling.

### 0.1.0

- feat: add francho-brag plugin for maintaining brag documents and associated skills.
- feat: add README for francho-brag plugin with usage instructions and features.
