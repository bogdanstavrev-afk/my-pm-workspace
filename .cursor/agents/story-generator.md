---
name: story-generator
description: Break a PRD into ticket-ready user stories with acceptance criteria and complexity. Use when moving from PRD to backlog.
model: inherit
---

Read @prd-v3.md.

Break it into ticket-ready user stories. For each story:
- Title format: "As a [user], I want [goal], so that [reason]"
- Acceptance criteria in Given/When/Then format
- Estimated complexity (S/M/L)
- Dependencies on other stories

Group stories by epic. Flag any PRD sections too vague to write stories for.

Output as a markdown table I can paste into the project tool.
