# Jira task templates by team / track

Edit labels, design project, and custom field IDs as your org evolves. **EM / tideaccount** defaults below are the source of truth for engineering in this workspace.

---

## Global conventions

| Item | Value |
|------|--------|
| Atlassian site (`cloudId`) | `tideaccount.atlassian.net` |
| Engineering project key | **EM** |
| EM board (reference) | [EM board](https://tideaccount.atlassian.net/jira/software/projects/EM/boards/3716) |
| Design / UX project key | `[DES — set if different]` |
| Product / PM project (optional) | `[PM — optional]` |

**Summary pattern:** Verb + outcome — scope or constraint  
Example: `Add cohort filter to Team Cards report — AM30 cohort`

**Description skeleton:**

```markdown
## Context
Why now, links to docs/Slack/decisions.

## Goal / ask
One paragraph.

## Scope
- In scope: …
- Out of scope: …

## Acceptance criteria
- [ ] …
- [ ] …

## Links
- …

## Notes
Dependencies, flags, analytics keys.
```

---

## Engineering (EM) — Story vs Task

| Issue type | When |
|------------|------|
| **Story** | Direct **user implication** (visible behaviour, UX, customer-facing outcome, user-noticeable fix). |
| **Task** | Work that **should be done** but **no direct user implication** (refactor, infra, tooling, internal jobs, tech debt, purely internal metrics/pipelines with no product UI change). |

**Bug / Spike:** Use **Bug** for defects; **Spike** for time-boxed discovery—see templates below.

---

## Engineering (EM) — Epics (open list + linking)

### When to auto-link an epic

Link the epic on create **only if**:

- The user gave an epic key or unambiguous epic name, or  
- After fetching open epics, **exactly one** epic clearly matches the feature (and you state that assumption).

Otherwise **list epics and ask** (see SKILL.md).

### JQL — not-done Epics in EM

Use this (or tighten with `ORDER BY updated DESC`):

```jql
project = EM AND type = Epic AND statusCategory != Done
```

If your site uses different Epic naming:

```jql
project = EM AND issuetype = Epic AND statusCategory != Done
```

Return fields useful for picking: `summary`, `status`, `key`, optionally `fixVersions`.

### How to set Epic on create/update (EM)

On project **EM**, Jira labels this relationship **Parent** in the UI. Under the hood it is the standard **`parent`** issue link: set the parent to the **Epic** issue key.

When creating or editing via MCP/API, pass in **`additional_fields`**:

- **`parent`**: `{ "key": "EM-xxx" }` where `EM-xxx` is the Epic issue.

Optional: call **`getJiraIssueTypeMetaWithFields`** for EM + Story/Task if validation errors suggest a different field id on your tenant.

| UI name (EM) | API field | Example |
|----------------|-----------|---------|
| Parent | `parent` | `{ "parent": { "key": "EM-100" } }` |

---

## Bug template (EM)

- Steps to reproduce  
- Expected vs actual  
- Environment (prod/stage), app version  
- Logs / screenshots  

---

## Spike template (EM)

- Time box  
- Questions to answer  
- Done = decision / doc / follow-up tickets listed  

---

## Design team

**When:** UX/UI exploration, flows, specs—not EM implementation-only work unless agreed.

| Field | Typical value |
|-------|----------------|
| Project | `[DES]` |
| Labels | `design`, `needs-discovery` |

**Design request:**

```markdown
## Ask
Artifact or decision needed.

## Audience / platform
…

## Constraints
…

## References
Figma: [link]

## Deliverables
- [ ] …
```

---

## Cross-functional requests

If work spans design + EM, split or link issues per team conventions; call out epic on **EM** items using the same epic rules as above.

---

## Stakeholder / intake (optional)

| Field | Typical value |
|-------|----------------|
| Project | `[PM]` |

---

## Issue type names (verify in Jira)

Exact strings must match the project. Example:

| Project | Story | Task | Bug | Epic |
|---------|-------|------|-----|------|
| EM | Story | Task | Bug | Epic |

Use **`getJiraProjectIssueTypesMetadata`** for EM if creation fails on issue type name.
