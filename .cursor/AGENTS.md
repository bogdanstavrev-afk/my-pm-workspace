# Cursor agents (PM workspace)

Project subagents live in `.cursor/agents/`. Invoke via Agent mode or `@<name>` when supported.

| Agent | Use when |
|-------|----------|
| **slack-secretary** | Triage Slack channels/threads; decisions, blockers, actions; draft replies (requires **tide-slack** MCP) |
| **cpo-challenger** | Pressure-test PRDs, roadmaps, or strategy before leadership |
| **prd-writer** | Draft or complete a PRD from a feature brief |
| **review-panel** | Triple review (eng, VP product, UX) before build |
| **stakeholder-update** | Weekly leadership update from sprint data + decisions log |
| **sprint-pulse** | Draft #ps-cards sprint start/end/update posts from Jira (`/sprint-pulse start`) |
| **story-generator** | PRD → ticket-ready user stories |
| **backlog-audit** | Quick backlog health (stale, duplicates, unowned P0/P1) |
| **competitive-snapshot** | Competitor pricing, features, launches vs Tide |
| **research-synth** | Synthesise UX interview transcripts |
| **metrics-insights** | MoM/QoQ trends from metrics CSV |

## Slack Secretary

- **Agent:** `.cursor/agents/slack-secretary.md`
- **Skill:** `.cursor/skills/slack-secretary/SKILL.md`
- **MCP:** `tide-slack` in `~/.cursor/mcp.json` (user-level; not in this repo)
- **Example:** “@slack-secretary brief #ps-cards-india-team since yesterday, Format A”

For use in **all projects**, the same agent is installed at `~/.cursor/agents/slack-secretary.md` (user scope overrides only when names collide; project agents take priority in this repo).

## Sprint pulse

- **Skill:** `.cursor/skills/sprint-pulse/SKILL.md`
- **Template:** `templates/ps-cards-sprint-pulse.md`
- **Confluence:** [#ps-cards sprint update](https://tideaccount.atlassian.net/wiki/spaces/PAYM/pages/6899302623)
- **MCP:** Atlassian (Jira)
- **Sprint scoping:** board 809 sprint name in JQL (`2026_Q2_05_Card_Management`); start ≠ end sprint
- **Sprint end:** OKR + non-OKR **delivered only** — no not-delivered section
- **Examples:** `/sprint-pulse start`, `/sprint-pulse end PS Cards board Cards India`, `/sprint-pulse update`
