---
name: user-story-writing
description: >-
  Write clear, testable user stories using the As a / I want / So that format with
  well-defined acceptance criteria. Use when the user asks to write, draft, refine,
  or review user stories, epics, or feature requirements. Applies INVEST criteria and
  avoids solution-baked stories or missing user value.
---

# User Story Writing

## Story Format

Always use this structure:

```
**As a** [specific user role],
**I want** [a capability or action],
**So that** [the benefit or outcome they receive].
```

**Acceptance Criteria** (for each story):
```
- [ ] Given [context], when [action], then [expected result]
- [ ] Given [context], when [action], then [expected result]
- [ ] Edge case: [scenario] is handled gracefully
```

## INVEST Checklist

Before finalizing any story, verify:

| Criterion | Question to Ask |
|-----------|----------------|
| **I**ndependent | Can this be built and shipped without another story? |
| **N**egotiable | Is the *what*, not the *how*, defined? |
| **V**aluable | Does the "so that" clause deliver clear user or business value? |
| **E**stimable | Is scope clear enough to size? |
| **S**mall | Can it ship in one sprint? If not, split it. |
| **T**estable | Can QA write a test for every acceptance criterion? |

## Writing Process

1. **Identify the user role** — be specific (e.g., "admin user", "first-time visitor", not just "user")
2. **State the capability** — use a verb phrase focused on the outcome, not the implementation
3. **Articulate the value** — answer "why does this matter?" for the user
4. **Write acceptance criteria** — minimum 2–3, covering happy path + at least one edge case
5. **Apply INVEST** — split if not small/independent, reframe if solution-baked

## Story Templates

### Feature Story
```
As a [role], I want [feature], so that [outcome].

Acceptance Criteria:
- [ ] Given I am logged in, when I [action], then [result]
- [ ] Given [precondition], when [edge case], then [graceful handling]
- [ ] The [element] is accessible via keyboard navigation
```

### Error/Edge Case Story
```
As a [role], I want to be informed when [failure scenario],
so that I can [recovery action].

Acceptance Criteria:
- [ ] Given [bad input / system error], when I [action], then I see [error message]
- [ ] The error message explains what happened and what to do next
- [ ] The system does not lose my prior input
```

### Permission/Access Story
```
As a [role], I want [access to X], so that I can [task].

Acceptance Criteria:
- [ ] Users with [role] can [action]
- [ ] Users without [role] see [restricted message / redirect]
- [ ] Audit log records [action]
```

## Common Pitfalls

| Pitfall | Bad Example | Fixed |
|---------|-------------|-------|
| **Solution-baked** | "...I want a dropdown menu..." | "...I want to filter results by category..." |
| **Missing value** | "As a user, I want to log in." | "...so that I can access my saved preferences." |
| **Too broad** | "As a user, I want to manage my account." | Split into: view profile, edit profile, change password, delete account |
| **Vague role** | "As a user..." | "As an unauthenticated visitor..." |
| **Untestable criteria** | "The page should be fast." | "The page loads in under 2s on a 4G connection." |

## Splitting Large Stories

If a story fails the **Small** criterion, split by:

- **Happy path vs. edge cases** — ship core flow first
- **Roles** — admin version vs. standard user version
- **CRUD** — create, read, update, delete as separate stories
- **Data source** — manual entry vs. import vs. API
- **Platform** — desktop first, then mobile

## Output Format

When writing user stories, produce a numbered list with title, story, and acceptance criteria for each:

```
## Story 1: [Short title]

**As a** [role],
**I want** [capability],
**So that** [value].

**Acceptance Criteria:**
- [ ] Given..., when..., then...
- [ ] Given..., when..., then...
- [ ] [Edge case]
```
