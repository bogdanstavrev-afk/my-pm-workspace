# #ps-cards sprint update — simple templates

Post to **#ps-cards** at **sprint start** and **sprint end** so external teams know what's on OKRs and what shipped — without chasing the EM.

## What each post answers

| When | OKR | Non-OKR |
|------|-----|---------|
| **Sprint start** | What OKR epics eng is working on this sprint | What other tickets (bugs, improvements, tech debt) are in flight |
| **Sprint end** | What OKR work actually landed | What else shipped |

**Sprint end:** share **only what shipped** — no not-delivered or slip list.

Keep it **short and plain**. One line per epic (OKR) or ticket (non-OKR). Write for someone who doesn't live in Jira.

## Linking rules (paste-safe for Slack)

- **OKR** → Jira **Epic** only — one line per epic, not every sub-ticket
- **Non-OKR** → individual ticket key + short title
- **No asterisk bold**, **no `<url|label>`**
- Jira keys usually auto-link on send

**Examples**

```
• PAYSBA-54678 · Credit Flex on Tide Cards — BE APIs + eligibility endpoints landed
• PAYSBA-54284 · Fix DI export in cards — Done
```

---

## How to create the post (Cursor skill)

Run **`/sprint-pulse start`**, **`/sprint-pulse end`**, or **`/sprint-pulse update`** in Cursor Agent (or `@sprint-pulse`).

**Skill:** `.cursor/skills/sprint-pulse/SKILL.md`  
**Board:** [PS - Card Management](https://tideaccount.atlassian.net/jira/software/c/projects/PAYSBA/boards/809)

**Sprint scoping:** Start and end use **different** sprints on board 809. Jira sprint names look like `2026_Q2_05_Card_Management` — not `Q2 Sprint 4`. Do not use project-wide `openSprints()`; always filter `sprint = "<exact name>"`.

**Sprint number in header:** Parse from Jira name — `2026_Q2_05_Card_Management` → **Q2 Sprint 5** in the post title. Use Jira `startDate` / `endDate` for the date range.

---

## Sprint START

```
📍 PS Cards Management — Sprint start · Q2 Sprint 5 · <dates>

OKR work this sprint
• PAYSBA-XXXXX · <epic title> — <what we're doing / focus>
• …

Non-OKR work this sprint
• PAYSBA-XXXXX · <short title>
• …

Anything changed vs last sprint?
• <priority shift or new item> — or None

Heads-up
• <risk or decision needed> — or None
```

---

## Sprint END

```
✅ PS Cards Management — Sprint end · Q2 Sprint 5 · <dates>

OKR work delivered
• PAYSBA-XXXXX · <epic title> — <what landed, in plain English>
• … — or Nothing on OKRs this sprint

Non-OKR work delivered
• PAYSBA-XXXXX · <short title> — Done
• … — or Nothing else this sprint

Heads-up for next sprint
• <risk> — or None
```

---

## Mid-sprint (priority shift — post same day)

```
⚠️ PS Cards Management — Update · Q2 Sprint 5 · <date>

What changed
• …

Why
• …

Now targeting
• …
```

---

*Confluence: [Weekly PM Sync → #ps-cards sprint update](https://tideaccount.atlassian.net/wiki/spaces/PAYM/pages/6899302623)*
