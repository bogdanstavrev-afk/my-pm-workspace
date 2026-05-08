Analyse @backlog-export.csv (or query the project tool directly via MCP).

Identify:
1. Tickets untouched for 60+ days (stale)
2. Likely duplicates based on title and description similarity
3. Tickets missing priority, story points, or acceptance criteria
4. P0/P1 tickets without an assignee

Output a health scorecard with:
- Stale tickets (TICKET-ID and last-updated date)
- Likely duplicates (TICKET-ID-A vs TICKET-ID-B and why)
- Missing fields (TICKET-ID and what's missing)
- Critical without owner
- Recommended actions (3-5 concrete next steps)
