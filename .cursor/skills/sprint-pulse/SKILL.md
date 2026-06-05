---
name: sprint-pulse
description: Draft sprint start/end/update posts for #ps-cards from Jira — plain OKR vs non-OKR sections. Use for /sprint-pulse start, end, update, or sprint Slack updates for PS Cards Management.
---

# Sprint pulse (#ps-cards)

Draft Slack-ready sprint updates from Jira. **PM reviews and posts** — do not post to Slack unless the user explicitly asks.

## Purpose

External teams need a plain read on OKR vs non-OKR work without chasing the EM.

| Mode | OKR section | Non-OKR section |
|------|-------------|-----------------|
| **start** | What OKR epics eng is on **this sprint** | Other tickets **in this sprint** |
| **end** | What OKR work **landed this sprint** | What else **shipped this sprint** |

Write **human-readable** — plain English outcomes, not Jira status dumps.

**Sprint end:** report **only what shipped** (Done) — do not include a general "Not delivered" or slip list. **Do** include a **Blocked at sprint close** section when any sprint tickets are in Jira Blocked status.

## Invoke

| Command | When |
|---------|------|
| `/sprint-pulse start` | Beginning of sprint |
| `/sprint-pulse end` | End of sprint |
| `/sprint-pulse update` | Priority shift mid-sprint |

Optional: **Team label** (default `PS Cards Management`), **Jira board/project**

## Sprint scoping (critical)

**Start and end must use different Jira sprints.** Never reuse the same query for both.

### Board

- **PS - Card Management** — board **809** (not the whole PAYSBA project)
- Sprint names on this board: `2026_Q2_04_Card_Management`, `2026_Q2_05_Card_Management`, etc.
- Do **not** use generic names like `Q2 Sprint 4` — they return empty in Jira

### Resolve the sprint first

1. Read sprint name + dates from a board-809 ticket (`customfield_10015` / Sprint field) or the [board backlog](https://tideaccount.atlassian.net/jira/software/c/projects/PAYSBA/boards/809).
2. Build the post header from Jira: **sprint number** (when parseable) + **dates** from `startDate` / `endDate`.

### Sprint header (include sprint number from Jira)

Card Management sprint names follow: `2026_Q2_05_Card_Management`

| Jira field | Use in post |
|------------|-------------|
| `_Q2_05_` in name | **Q2 Sprint 5** (quarter + sprint number; drop leading zero) |
| `startDate` / `endDate` | **21 May – 3 Jun 2026** (UK-friendly short dates) |

**Header format:**

```
<emoji> <Team label> — Sprint start · Q2 Sprint 5 · 21 May – 3 Jun 2026
<emoji> <Team label> — Sprint end · Q2 Sprint 5 · 21 May – 3 Jun 2026
```

If the Jira name has no parseable number (e.g. `Refined - Card Management`), use the Jira sprint name as-is — do not invent a sprint number.

In the PM checklist footnote, note the Jira sprint name used for the query (e.g. `2026_Q2_05_Card_Management`).

| Mode | Which sprint | JQL sprint filter |
|------|--------------|-------------------|
| **end** | The sprint **closing / just closed** | `sprint = "<closing_sprint_name>"` |
| **start** | The sprint **starting next** | `sprint = "<next_sprint_name>"` |

### JQL pattern (always include sprint name)

```
project = PAYSBA
AND sprint = "<exact Card Management sprint name>"
AND parent IN (PAYSBA-54678, PAYSBA-41839, ...)   -- Cards Management epics
```

- **Sprint end (shipped):** `AND status = Done` — all Done tickets in the sprint; no epic filter unless the PM asks to narrow
- **Sprint end (blocked):** separate query `AND status = Blocked` — same sprint name; list every blocked ticket
- **Sprint start:** all tickets in that sprint (any status); OKR = epic-level focus from in-flight work

### What NOT to use for sprint scope

- `sprint in openSprints()` — spans the **whole PAYSBA project**, mixes Card Management with Card Payments and other teams
- `sprint in closedSprints()` without a named sprint — returns Done work from **all past sprints**
- Epic-only filtering without a sprint filter — wrong sprint boundary

### Cards Management epic filter

**OKR:** PAYSBA-54678 (Credit Flex), PAYSBA-41839 (Click to Pay)

**Non-OKR:** PAYSBA-53616, PAYSBA-53700, PAYSBA-53965

Exclude other teams' OKRs (e.g. MCY 52964, Auto Top-up 52509) unless the user asks.

### If next sprint is not populated yet

After sprint planning, the next sprint (e.g. `2026_Q2_06_Card_Management`) may have no tickets until the EM moves them. **Do not** copy the closing sprint backlog into the start post. Tell the PM: confirm the next sprint is created on board 809 and tickets are assigned, then re-run start.

## Linking rules

- **Sprint end (default):** one line per **epic** — `PAYSBA-EPIC · epic title — plain-English outcome`. Stakeholders open the epic in Jira to see stories. Do **not** list every story/sub-task unless the PM asks for a full ticket audit.
- **Sprint start:** epic key + title + one-line focus; non-epic work → ticket key + short title when no epic parent
- Format: `PAYSBA-KEY · title — detail`; no `*` bold, no `<url|label>`
- Use `None` when a section has nothing — not `_None_`

## Workflow

1. **Resolve sprint** — closing sprint (end) or next sprint (start) on board 809
2. **Query Jira** with `sprint = "<name>"` + Cards Management epic filter
3. Split **OKR epics** vs **non-OKR tickets**
4. Draft in plain language
5. Output Slack-ready text + PM checklist (include sprint name used)

## `/sprint-pulse start`

- Tickets committed to the **next** sprint only
- OKR epics + one-line focus each (what eng is doing)
- Non-OKR tickets in that sprint
- Optional: anything changed vs last sprint, heads-up

## `/sprint-pulse end`

- **Work delivered** — group Done tickets by epic; **one human-readable line per epic** summarising what landed (plain English, no service names or endpoint paths unless essential). Include epic key + title for Jira drill-down. Merge small epics into a sensible narrative when helpful; skip epics with no Done work.
- **Blocked at sprint close** — plain-English blocker summary; prefer epic key when all blocked tickets share an epic, otherwise one line per blocked ticket. Use `None` if none. Not a slip list — do not list In Progress, Deploying, Draft, etc.
- **Heads-up for next sprint** — forward-looking only; plain English; ticket keys optional
- Query all Done in the sprint (no epic filter). Do not list individual story keys in the default stakeholder post.

## Output templates

### Sprint START

```
📍 <Team label> — Sprint start · Q2 Sprint 5 · <dates>

OKR work this sprint
• PAYSBA-XXXXX · <epic title> — <focus in plain English>

Non-OKR work this sprint
• PAYSBA-XXXXX · <short title>

Anything changed vs last sprint?
• <shift> — or None

Heads-up
• <risk> — or None
```

### Sprint END

```
✅ <Team label> — Sprint end · Q2 Sprint 5 · <dates>

Work delivered
• PAYSBA-XXXXX · <epic title> — <what landed, plain English; open epic for stories>
• …

Blocked at sprint close
• PAYSBA-XXXXX · <epic or ticket> — <blocker in plain English>
— or None

Heads-up for next sprint
• <forward-looking risk or focus> — or None
```

### Mid-sprint UPDATE

```
⚠️ <Team label> — Update · Q2 Sprint 5 · <date>

What changed
• …

Why
• …

Now targeting
• …
```

## Writing style

- **Good (end):** "PAYSBA-54678 · Credit Flex on Tide Cards — Backend foundation landed: eligibility APIs, schemas, and credit-service integration so eng can build the member experience next"
- **Bad (end):** listing PAYSBA-54836, PAYSBA-54837, GET /api/v4/… endpoint names, or "9/12 tickets Done"
- **Bad (end):** sub-task keys, adapter service names, liquibase changesets in the channel post
- **Good (blocked):** "PAYSBA-41839 · Click to Pay — backfills for existing cardholders' phone and address blocked at close"
- Write for someone who does not live in Jira — epic key is the link; outcome is the message

## PM review checklist

- [ ] Correct **sprint** used (end = closing sprint; start = next sprint — not the same)
- [ ] Header includes **sprint number** from Jira (e.g. Q2 Sprint 5) when available
- [ ] JQL used `sprint = "<Card Management sprint name>"` on board 809
- [ ] Sprint end is **epic-level plain English** — not a story/sub-task dump
- [ ] Sprint end lists **only Done / shipped** work in delivery sections — no general not-delivered slip list
- [ ] **Blocked at sprint close** lists every Blocked ticket in the sprint (or None)
- [ ] Heads-up is forward-looking, not a repeat of blocked or missed items

## What NOT to do

- Do not post to Slack without explicit user request
- Do not use `openSprints()` or `closedSprints()` without a named Card Management sprint
- Do not list every story or sub-task on sprint end unless the PM asks for a full audit
- Do not add a general **Not delivered** or slip list on sprint end (In Progress, Deploying, Draft, etc.)
- Do include **Blocked at sprint close** when Blocked tickets exist in the sprint
- Do not use bureaucratic headers like "Delivered — OKR" — use "OKR work delivered"
- Do not use `*` or `<url|label>` in Slack output
