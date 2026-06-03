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

**Sprint end:** report **only what shipped** — do not include a "Not delivered" or slip list.

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

- **Sprint end:** add `AND status = Done`
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

- **OKR** → Epic key + title, one line per epic
- **Non-OKR** → ticket key + short title
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

- **OKR work delivered** — epic-level outcomes in plain English (Done in **this** sprint only)
- **Non-OKR work delivered** — individual Done tickets in **this** sprint only
- **Heads-up for next sprint** — forward-looking only, not a slip list
- Omit epics/tickets that did not ship — do not call out misses in channel

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

OKR work delivered
• PAYSBA-XXXXX · <epic title> — <what landed>
— or Nothing on OKRs this sprint

Non-OKR work delivered
• PAYSBA-XXXXX · <short title> — Done
— or Nothing else this sprint

Heads-up for next sprint
• <risk> — or None
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

- **Good (end):** "Credit Flex — BE APIs, schemas, and eligibility endpoints landed"
- **Bad (end):** "9/12 tickets Done; PAYSBA-54979 In Progress"
- **Bad (start):** listing Done work from the sprint that just closed
- **Bad (both):** same ticket list for start and end
- OKR lines (end) = epic outcomes for work that **landed this sprint**. Non-OKR lines (end) = Done tickets **this sprint only**.

## PM review checklist

- [ ] Correct **sprint** used (end = closing sprint; start = next sprint — not the same)
- [ ] Header includes **sprint number** from Jira (e.g. Q2 Sprint 5) when available
- [ ] JQL used `sprint = "<Card Management sprint name>"` on board 809
- [ ] OKR vs non-OKR split is correct
- [ ] Plain English — would Lora understand without opening Jira?
- [ ] Sprint end lists **only Done / shipped** work — no not-delivered section
- [ ] Heads-up is forward-looking, not a repeat of missed sprint items

## What NOT to do

- Do not post to Slack without explicit user request
- Do not use `openSprints()` or `closedSprints()` without a named Card Management sprint
- Do not list every sub-task under an OKR epic
- Do not add a **Not delivered** section on sprint end
- Do not use bureaucratic headers like "Delivered — OKR" — use "OKR work delivered"
- Do not use `*` or `<url|label>` in Slack output
