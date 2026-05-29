# Benefit Cards — Architecture & Target State

Source: [RFC-CARDS-0129](https://tideaccount.atlassian.net/wiki/spaces/TBE/pages/6596526139) (DRAFT, Q2'26 target).

## The core problem

Today, benefit card holders are onboarded as **separate business entities** in BIDM with Sole Trader permissions. This creates:

- B2B2C hybrid exposure (employees serviced like business members)
- Employer (Tide Member/corporate) can see employee accounts/balances
- Post-exit employees retain business accounts with funds
- M2P cannot issue multiple PPI accounts to same mobile number
- GA blocked until lifecycle/offboarding model is defined

## Tactical (hybrid) state — ~2 months

**Goal:** GTM with minimal tech effort while enabling migration to target state.

### Key design decisions

| Decision | Choice |
| --- | --- |
| Business ID for employee | **Yes** — still issued (interim) |
| Business category | `Benefit Employee` (was `General Consultant`) |
| IAM role | Start Sole Trader → downgrade to **Employee** once account opened |
| BIDM relationship | Individual → SP Admin business as `Team Member/Employee` (not b2b) |
| Validations | Move from b2b to **b2i** in BIDM for claims/payouts/account creation |

### Onboarding alternatives

- **Alt 1:** SP Global UI for bulk lead registration; Team Hub backend for invitations
- **Alt 2:** Referral code links Individual to SP Admin (not business-to-business); MAM work ~2–3 sprints

### New work by team

| Team | Work |
| --- | --- |
| Benefit Cards | Payout files on new BIDM relationship; payee mgmt i2b; b2i validations; IAM Employee role permissions |
| SP Global | Employee mgmt b2b → b2i validation |
| MAM/Onboarding | Referral code: business-to-individual linking; invitation links with Business Category = Employee |
| IAM | Employee / Ex-Employee roles; remove Add Money on off-boarding |
| BI/Analytics | Exclude `business_category: employee/ex-employee` from KM reports |

### Tactical lifecycle states

| State | Products | Role | Category |
| --- | --- | --- | --- |
| **Functioning** | IAM, Accounts (General + Benefit), Cards, Timeline, Statement, Reimbursements | EMPLOYEE | Benefit Employee |
| **Off-boarding** | Same + transfer Fuel/Telecom → General; delink from employer | OFFBOARDED_EMPLOYEE | Benefit Employee |
| **Off-boarded** | All wallets zero → standard account + business closure | n/a | Closed |

### Hybrid limitations (not supported)

- Same individual as Admin/Director + Benefit Employee in same business
- Individual leaving Employer A and joining Employer B (both on Tide) — workaround: different mobile number
- M2P single PPI per mobile number constraint

## Target state — ~6 months build, ~3 months parallel effort

**Goal:** Resources owned by **Individual**, not Business. Business creation skipped for employee onboarding.

### Expected behaviour changes

| Domain | Current (Team Member) | Target (Benefit Employee) |
| --- | --- | --- |
| Account ownership | Business (Tide Member) | Individual (employee) |
| Card controls | Admin only | Employee self-service |
| Post-exit access | Revoked immediately | Retained until funds depleted |
| Multi-employer | Re-onboarding required | Reuse accounts (Option 1: per-employer resources) or null business_id (Option 2) |
| Employer visibility | Full access to all accounts | **No** access to employee accounts |
| JWT access pattern | business_id | ownership_id or resource-permissions (Solution A recommended) |

### Recommended data model: Option 1 + satellite ownership table

- Resources bound to employer business_id but **owned by Individual** via satellite table
- New employment = new account/card set (no reuse across employers)
- Multi-business login switcher for employees with past/current employers
- Directors see business accounts only; employees see only their own

### Solution comparison (RFC)

| Solution | Scope | Recommendation |
| --- | --- | --- |
| **A — New roles + permissions** | Domain teams only | **Recommended** — no JWT/platform-wide change |
| **B — ownership-id in JWT** | Platform-wide | Not recommended — high complexity |
| **C — resource-id in JWT** | IAM-heavy | Not ideal — JWT bloat |

### Migration to target state — ~2 months

- New onboarding: no Business ID for employee
- Existing hybrid businesses: **blocked/permanently closed** via BOT automation
- Ownership satellite tables backfilled with User-ID
- Reporting excludes Benefit Employee businesses

## M2P program separation [OPEN]

If ST/RB owner also becomes benefit employee: cannot reuse existing PPI under same mobile. Options:

- Separate M2P program for employees (ruled out due to ops cost — same effort as Tide own PPI license)
- Different tenant/program header in m2p-egress proxy

## Open architecture questions

- Allow same individual across multiple concurrent employments? **India: No; EU: Yes**
- Reuse resources across job switches? **Product/Business decision pending**
- Post-exit: employee retains multi-business login access to past employer contexts
- Onboarding journey for fully KYC'd ST/RB owners who also have corporate employment

## Estimates summary

| Phase | Duration |
| --- | --- |
| Hybrid tactical | ~2 months |
| Target state build | ~6 months (3 months if teams parallel) |
| Migration | ~2 months |
