# francho-security

Run security checks on your project and dependencies.

## What this plugin does

- Adds a security audit skill that detects whether a repo is new or recently updated.
- Delegates analysis to a dedicated read-only security agent.
- Provides a structured security report with risk level and remediation recommendations.

## Skills

- security-audit: Runs a full audit for fresh repositories, or a targeted audit for new changes.

## Agents

- code-cop: Read-only security analyst agent for vulnerabilities, dependency risks, and license issues.

## Usage

- Keep the plugin enabled in your Copilot setup.
- Ask Copilot to run a security audit on your repository.
- Review the verdict, issues table, and recommended fixes.

## Version

- 0.1.0
