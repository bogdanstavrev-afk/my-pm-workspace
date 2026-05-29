# Benefit Cards — Governance & Status

Source: [Post-Mortem Report (DRAFT)](https://tideaccount.atlassian.net/wiki/spaces/COM/pages/6727861248) — reviewed Apr–May 2026.

## Current status

**GA launch is ON HOLD.** Product flows under review. Reassessment required before any external corporate go-live.

Internal Phase 1 (Tide employee pilot) proceeded with Low residual risk (Dec 2025). Phase 2/GA reassessment (Jan 2026) raised strategic concerns — RCSD-1425.

## Why the retro was triggered

RCC feedback identified that benefit cards introduce **B2C servicing exposure** within a structured B2B partner model — not fully assessed in original risk intake:

- Employees interact directly with wallets/cards via Tide app
- Post-employment fund retention creates hybrid lifecycle
- No Figma/journey artefacts provided during initial risk review
- **No BIDM alignment check** in risk assessment intake

## Key issues identified

| Issue | Impact |
| --- | --- |
| Product not validated against BIDM | Strategic governance uncertainty; delayed go-live; rework across Product/R&C |
| Quasi-B2C exposure via employee wallets | Regulatory classification ambiguity; dispute ownership unclear (employer vs Tide) |
| Strategic business model risk not owned | Misalignment with B2B-only positioning; senior escalation needed |
| Unintended B2B → B2C transition | Offboarding/account closure undefined; product redesign may be needed |

## Lessons learned

- Risk assessments must explicitly classify **B2B vs B2C exposure** — not infer from partner onboarding alone
- Mandatory **BIDM/entity model validation** before risk sign-off
- Offboarding and exit are **core flows**, not edge cases
- Minimum design maturity (Figma, user journeys) required before risk sign-off
- Spreadsheet-only risk input insufficient — need happy/unhappy/exit path walkthroughs

## Action plan (from post-mortem)

| Action | Owner | Status |
| --- | --- | --- |
| Update risk template for non-final product artefacts | R&C | Not started |
| Reopen risk assessment (strategic + offboarding + B2C) | R&C + Product | Not started |
| Confirm go-live status and B2C mitigations | R&C + Product | Pending |
| Define offboarding model (closure rules, wallet termination, fund withdrawal) | Product + Ops + R&C | Not started |
| Add BIDM alignment to risk intake | R&C | In progress (Q2 2026) |
| Vulnerability mapping + happy/unhappy path methodology | R&C | Not started |
| Senior stakeholder escalation channels | R&C + Product | Not started |

## Risk assessment history

| Milestone | Ticket | Outcome |
| --- | --- | --- |
| Phase 1 internal launch (Oct 2025) | RCSD-1282 | Low residual risk; conduct risk accepted (SME app used by employees) |
| GA scope expansion (Jan 2026) | RCSD-1425 | On hold |

## Regulatory framing

- Product is **not inherently prohibited** under RBI PPI framework
- Key concern is **business model classification and conduct alignment**, not regulatory permissibility
- Semi-closed PPI with MCC restrictions is compliant infrastructure; servicing model governance is the gap

## Product implications for PM work

When writing PRDs, specs, or stakeholder updates:

1. Always address **exit/offboarding** and **post-employment fund access**
2. Explicitly state **B2B partner vs B2C employee** servicing boundaries
3. Reference BIDM entity model (Individual, Business, relationship types)
4. Do not assume GA timeline — flag dependency on R&C reassessment
5. Flag [OPEN QUESTION] for unresolved Transcorp/M2P/legal items

## Related RFC actions

From RFC-CARDS-0129:

1. Determine downstream impact of `Business Category = Employee` on reporting
2. Research membership model details for target state
