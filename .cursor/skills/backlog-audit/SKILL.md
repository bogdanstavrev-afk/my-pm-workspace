---
name: backlog-audit
description: Audit backlog health for stale tickets, duplicates, missing fields, and unowned P0/P1. Use for quarterly or health backlog reviews.
---

# Backlog Audit

## When to use
When asked to audit the health of a backlog (typically quarterly).

## Inputs needed
- A project key or a backlog CSV export

## Steps
1. List all tickets in the project
2. Identify tickets untouched for 60+ days (stale)
3. Find likely duplicates based on title and description similarity
4. Find tickets missing priority, story points, or acceptance criteria
5. Find P0/P1 tickets without an assignee
6. Group findings by category

## Output format
**Stale tickets (60+ days untouched)**
- [TICKET-ID]: [title] - last updated [date]

**Likely duplicates**
- [TICKET-ID-A] vs [TICKET-ID-B] - [why they look similar]

**Missing fields**
- [TICKET-ID]: missing [priority / points / criteria]

**Critical without owner**
- [TICKET-ID]: P0 with no assignee

## Recommended actions
[3-5 concrete next steps]
