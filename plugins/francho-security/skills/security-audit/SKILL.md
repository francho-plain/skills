---
name: security-audit
description: "Security audit for repositories. Use when: cloning a new repo, pulling changes, performing security review, checking dependencies for vulnerabilities, or auditing code for OWASP risks. Detects clone vs pull and scopes the audit accordingly."
---

# Security Audit

Automated security audit that detects whether a repository was freshly cloned or received new changes, then delegates to the **Code Cop** agent for the appropriate scope of analysis.

## When to Use

- First time opening a cloned repository
- After pulling new changes
- On-demand security review of any repository

## Procedure

### 1. Detect Audit Scope

Run [detect-changes.sh](./scripts/detect-changes.sh) or check git state manually:

- If `.git/copilot-security-audit` marker does **not** exist → **fresh clone** → full audit.
- If marker exists and HEAD differs from stored commit → **new changes** → targeted audit on changed files only.
- If marker exists and HEAD matches → already audited, skip unless the user explicitly requests a re-audit.

To list changed files since last audit:

```bash
git diff --name-only "$(cat .git/copilot-security-audit)" HEAD
```

### 2. Run Security Analysis

Delegate to the **Code Cop** agent:

- **Fresh clone**: Analyze the entire repository (project overview, dependencies, licenses, code security, configuration, build scripts).
- **New changes (pull)**: Analyze only the changed files. Focus on:
  - New or modified dependencies
  - Security patterns in changed code
  - New configuration or CI/CD changes
  - License changes in added dependencies

### 3. Update Audit Marker

After a successful audit, record the current commit:

```bash
git rev-parse HEAD > .git/copilot-security-audit
```

This prevents re-auditing the same changes in future sessions.

### 4. Report

Present the Code Cop findings following its standard report format:

- Security verdict with risk level
- Issues table with severity, category, file, and description
- License summary
- Recommendations for remediation
