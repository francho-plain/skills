---
name: bragdoc
description: 'Add achievement to brag document. Use when: recording accomplishments, logging wins, adding brag entries. Validates required data and inserts in existing sections only.'
argument-hint: 'date, description'
user-invocable: true
disable-model-invocation: false
---

# Add Brag Entry

Add an achievement to the user's brag document safely, without inventing data.

## References

| Resource | Purpose |
|----------|---------|
| [BRAG-GUIDE.md](./references/BRAG-GUIDE.md) | Best practices for maintaining a brag document |
| [BRAG-TEMPLATE.md](./references/BRAG-TEMPLATE.md) | Template for creating a new brag document |

Use these references when:
- The user needs to create a new brag document → offer the template
- The user asks for guidance on what to record → consult the guide

## Brag File Resolution

The skill must determine the target brag file **before** proceeding:

1. **Check memory**: Read `/memories/bragdoc-config.md` for a saved `brag_file` value.
2. **If found**: Use that absolute path.
3. **If not found**: Ask the user for the brag document **absolute path**, then save it to `/memories/bragdoc-config.md` using this format:
   ```markdown
   # Brag Configuration
   
   brag_file: <absolute-path>
   ```
   3.a **If the provided path does not exist**: Ask the user whether to create a new brag document at that path from the provided template (`./references/BRAG-TEMPLATE.md`). If the user confirms, create the file using the template contents, persist the path in `/memories/bragdoc-config.md`, and continue. If the user declines, ask for an alternate absolute path or abort the operation.
4. **Always persist absolute paths**: Never save relative paths in memory.
5. **Cross-platform compatibility**:
   - In VS Code on Windows, store a Windows absolute path (example: `C:\Users\name\docs\brag.md`) or a WSL UNC path if the file lives in WSL (example: `\\wsl$\Ubuntu\home\name\brag.md`).
   - In VS Code WSL or Copilot CLI on Linux, store a Linux/WSL absolute path (example: `/home/name/brag.md`).
   - If a memory path is not directly usable in the current runtime (Windows vs WSL vs CLI), ask for the equivalent absolute path and update `/memories/bragdoc-config.md`.

This ensures the path is asked only once and remembered for future sessions.

## Required Data

| Field | Format |
|-------|--------|
| Date | Auto-normalized to `YYYY-MM-DD` or `YYYY-MM` |
| Description | Brief, impact-focused |
| Title (optional) | Short, descriptive, if not provided infeer from description |

## Rules

- **Never invent data** — ask for missing fields.
- **Never create sections** — insert only into existing `### Section` blocks.
- **Language**: Write entries in English by default, unless the user explicitly requests another language. Exception: feedback quotes must always remain in the language they were originally written.
- **Single target**: The resolved brag file from memory.
- **Date ordering**: Entries within each section must be sorted by date ascending (oldest first).

## Workflow

1. **Resolve brag file** using the Brag File Resolution steps above.
2. Read the brag file and locate `## YYYY Accomplishments` blocks.
3. Validate all 3 required fields; ask for missing ones.
4. Normalize date to ISO format (`YYYY-MM-DD` or `YYYY-MM`).
5. Find the matching yearly block; if missing, ask user what to do.
6. List available `###` sections and ask user to choose target.
7. Insert entry in correct position to maintain date ascending order:

**Default format:**
```markdown
- **<title>**: <description> _[<date>]_
```

**Feedback Received format:**
```markdown
- **<name> (<role>):** "<quote>" _[<date>]_
```

8. Confirm: section, inserted text, file reference.
9. If `brag_file` is inside a Git repository, and the user confirms the change is correct, create a commit mentioning the updated section, then push to the current remote branch.

## Error Handling

| Condition | Action |
|-----------|--------|
 | File missing | Ask the user whether to create the file from `./references/BRAG-TEMPLATE.md`; if they confirm, create it and continue, otherwise abort and surface guidance to provide a different path. |
| Year block missing | Ask user for action |
| Section not found | List valid options, ask again |
| Invalid date | Attempt auto-fix, else ask |
| Memory file missing | Ask user for absolute path, create memory file |