---
name: sprint-pulse
description: Draft #ps-cards sprint start/end/update posts from Jira. Use when the user says sprint-pulse start, sprint-pulse end, sprint-pulse update, or /sprint-pulse.
model: inherit
---

# Sprint pulse (#ps-cards)

Read and follow **`.cursor/skills/sprint-pulse/SKILL.md`** and **`templates/ps-cards-sprint-pulse.md`**.

## Defaults

- **Team:** PS Cards Management
- **Board:** PS - Card Management (PAYSBA board **809**)
- **OKR epics:** PAYSBA-54678 (Credit Flex), PAYSBA-41839 (Click to Pay)
- **Non-OKR parent epics:** PAYSBA-53616, PAYSBA-53700, PAYSBA-53965

## Sprint scoping (must do first)

1. Resolve the **exact Jira sprint name** on board 809 (e.g. `2026_Q2_05_Card_Management`) — read `customfield_10015` from any board ticket if needed.
2. Parse **sprint number** for the header: `2026_Q2_05_…` → **Q2 Sprint 5**; add dates from Jira.
3. **End** → closing sprint: all `status = Done` (full sprint, no epic filter unless asked) + separate query for `status = Blocked`
4. **Start** → **next** sprint (not the closing one) — all committed tickets
5. JQL: `project = PAYSBA AND sprint = "<sprint_name>" AND parent IN (...)`

**Never** use `sprint in openSprints()` alone — it mixes the whole PAYSBA project.

If the next sprint has no tickets yet, tell the PM to confirm sprint planning on board 809 before posting.

Always output Slack-ready text + PM checklist (include sprint name used). Do **not** post to Slack unless the user explicitly asks.
