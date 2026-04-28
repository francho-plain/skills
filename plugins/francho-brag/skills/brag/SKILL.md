---
name: brag
description: 'Add achievement to brag document. Use when: recording accomplishments, logging wins, adding brag entries. Validates required data and inserts in existing sections only.'
argument-hint: 'title, date, description'
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

1. **Check memory**: Read `/memories/brag-config.md` for a saved `brag_file` value.
2. **If found**: Use that filename.
3. **If not found**: Ask the user for the brag document filename, then save it to `/memories/brag-config.md` using this format:
   ```markdown
   # Brag Configuration
   
   brag_file: <user-provided-filename>
   ```

This ensures the filename is asked only once and remembered for future sessions.

## Required Data

| Field | Format |
|-------|--------|
| Title | Short, descriptive |
| Date | Auto-normalized to `YYYY-MM-DD` or `YYYY-MM` |
| Description | Brief, impact-focused |

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

## Error Handling

| Condition | Action |
|-----------|--------|
| File missing | Stop, report |
| Year block missing | Ask user for action |
| Section not found | List valid options, ask again |
| Invalid date | Attempt auto-fix, else ask |
| Memory file missing | Ask user for filename, create memory file |