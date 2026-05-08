# Skill: MOIA - Member Operations Impact Assessment

## When to use
Before any change that could affect contact volume, agent workflows, tooling, policies, or member-facing communications. Run this BEFORE the go/no-go review, not after.

## Inputs needed
- PRD or change brief (@-mention)
- Expected launch date and rollout plan (% of base, geos)
- Affected member segments and estimated population
- Any new comms, error states, or policy changes

## Steps
1. Identify every member-visible change (UI, comms, policy, pricing, eligibility).
2. For each change, predict the contact reasons it could create or remove.
3. Estimate volume delta: contacts per 1,000 affected members per week. State assumptions.
4. Map each contact reason to the team(s) that handle it (Tier 1, Disputes, KYC, Collections, etc.).
5. Identify tooling or macro changes needed (CRM fields, canned responses, knowledge base, internal runbooks).
6. Identify training needs and minimum lead time before launch.
7. Flag policy or compliance asks (FCA, AML, complaints handling).
8. Define the success / safety metrics Member Ops will watch post-launch.
9. Recommend a go / hold / phased launch position with reasoning.

## Output format
**Change:** [Feature name]
**PM / DRI:** [name]
**Planned launch:** [date, % rollout]
**Affected population:** [segment, estimated count]

**1. Member-visible changes**
- [Change] - [where it appears]

**2. Predicted contact impact**
| Reason | Direction | Est. delta /1k members /week | Assumptions |
|---|---|---|---|
| [reason] | + / - | [n] | [basis] |

**3. Teams affected**
- [Team]: [what changes for them]

**4. Tooling & content updates needed**
- CRM / case fields:
- Macros / canned responses:
- Knowledge base articles:
- Internal runbooks:

**5. Training**
- Audience:
- Format (async doc / live session):
- Minimum lead time before launch:

**6. Policy & compliance**
- [Item] - owner - status

**7. Post-launch monitoring**
- Primary metric:
- Guardrails:
- Review cadence (e.g. daily for 2 weeks):

**8. Recommendation**
- [ ] Go as planned
- [ ] Phase rollout - [conditions]
- [ ] Hold - [blocker]

**Reasoning:** [2-3 sentences]

## Tone
Operational and concrete. Member Ops leaders should be able to action this without a follow-up call.

## What NOT to do
- Don't hand-wave volume ("small impact"). Give a number with an assumption, even if rough.
- Don't assume existing macros cover new scenarios - check.
- Don't treat training as optional. If lead time is too short, say so and recommend a phased launch.
- Don't skip the recommendation. Member Ops needs a position to react to, not a menu.
