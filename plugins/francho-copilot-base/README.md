# francho-copilot-base

Default Copilot configuration for consistent behavior and response tone.

## What this plugin does

- Adds a reusable base skill that sets default behavior preferences.
- Defines a mandatory baseline skill intended to run first on every user message.
- Forces base tone, language, context priority, and reliability setup before other skills.
- Shows a localized "default tone loaded" confirmation at response start.
- Prioritizes current request and attached context over generic memory.
- Enforces a reliability rule: do not invent information when context is missing.
- Requires user confirmation before major architecture or project-direction decisions.

## Skills

- base-tone-first: default communication tone and response style, always executed first.

## Usage

- Keep the plugin enabled in your Copilot setup.
- Use it as a baseline skill layer for day-to-day chats.

## Version

- 0.2.5

## Changelog

### 0.2.5

- refactor: optimize `base-tone-first` skill for clarity, token efficiency, context retrieval, and anti-hallucination — tighten language resolution priority, replace placeholder confirmation with concrete example, require tool verification before proceeding, and remove redundancy.

### 0.2.4

- docs: tighten the base skill for clearer rule ordering, leaner prompts, better context priority, and stronger anti-hallucination guidance.

### 0.2.1

- refactor: rename skill.

### 0.2.0

- feat: refactor francho-copilot-base plugin to enhance skill structure and remove deprecated instructions.

### 0.1.0

- feat: add francho-copilot-base plugin for default behavior and tone configuration.
