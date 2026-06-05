---
name: jira-multi-team-tasks
description: >-
  Creates Jira issues for engineering (project EM, tideaccount), design, and other
  tracks. Picks Story vs Task by user impact; links Epics on EM via the Parent field
  or lists open epics for the user to choose. Reads reference.md for templates and JQL.
  Use when creating Jira tickets, stories, tasks, bugs, or design requests for this workspace.
---

# Jira multi-team task creation

## When this applies

Use whenever you **draft or create** Jira work and need the right **issue type**, **project**, and **epic**—especially engineering work in **EM** on `tideaccount.atlassian.net`.

Engineering board (context): [EM board](https://tideaccount.atlassian.net/jira/software/projects/EM/boards/3716).

## Engineering (project EM) — issue type

| Type | Use when |
|------|-----------|
| **Story** | The work has **direct user implication** (UX, behaviour users see, customer-facing outcome, user-visible bug fix framed as user impact). |
| **Task** | Something the team should do **without a direct user implication** (refactor, infra, tooling, tech debt, internal reporting, enablement, backend-only with no user-visible change). |

If unclear, ask one short question: *“Would a user notice or care about the outcome in the product?”* — Yes → Story; No → Task.

Other types (Bug, Spike, etc.) follow [reference.md](reference.md).

## Engineering (project EM) — epic linking

**Goal:** Every new Story or Task in **EM** should be linked to the correct **Epic** when this work belongs to a “big feature” epic.

1. **Infer the epic** from the conversation (feature name, initiative, explicit epic key like `EM-123`).  
2. **If exactly one epic clearly matches** (user confirmed, or unambiguous name match against open epics): link it when creating the issue. State which epic you linked and why.  
3. **If multiple epics could fit or none is obvious:** do **not** guess.  
   - Query **open (not Done) Epics** in project EM using JQL from [reference.md](reference.md).  
   - Present a **numbered list**: key, summary, status (and optional fix version if useful).  
   - **Stop and ask** the user which epic to use (or “none / backlog without epic” if they say so).  
4. **After the user picks:** create (or edit) the issue with the Epic set on **Parent** (project EM). In the REST API this is the **`parent`** field pointing at the Epic issue key (e.g. `parent: { key: "EM-100" }` in `additional_fields`). Use metadata only if your tenant uses a different shape.

Use Atlassian MCP: `searchJiraIssuesUsingJql` for the epic list; `createJiraIssue` / `editJiraIssue` with `additional_fields` including **`parent`** for the chosen Epic.

## General workflow

1. **Track** — Engineering vs design vs other ([reference.md](reference.md)).  
2. **Templates** — Apply structure from [reference.md](reference.md).  
3. **Jira context** — `cloudId`: `tideaccount.atlassian.net`. Engineering **projectKey**: `EM` unless the user specifies otherwise.  
4. **Create** — `issueTypeName`: `Story` or `Task` per rules above; fill summary/description; link epic per **Epic linking** section.  
5. **Confirm** — Return issue key, URL, issue type, and **Parent** Epic key (or note if intentionally unlinked).

## Progressive disclosure

- **JQL, EM defaults, Story/Task nuance, design project placeholders**: [reference.md](reference.md)

## Quality bar

- Summaries are specific and verb-led.  
- Stories emphasise **user outcome** in acceptance criteria where relevant.  
- Tasks state **why** the work matters internally (risk, cost, enablement) without fake user stories.
