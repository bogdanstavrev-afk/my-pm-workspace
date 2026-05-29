# Benefit Cards — Local Knowledge Base

Curated from Confluence (PAYM, TBE, COM spaces). Last synced: **2026-05-29**.

Use this folder as the source of truth for Benefit Cards product context in this workspace. Confluence remains authoritative for live specs; update here when major pages change.

## Executive summary

Tide's **Multi Benefit Card** lets Indian corporates (structured partners) load tax-advantaged employee benefits into MCC-restricted wallets (Food, Fuel, Telecom, Rewards) on a single RuPay card, with a General wallet for reimbursements and year-end sweeps. It competes with Pluxee/Sodexo and runs on Transcorp PPI + M2P multi-wallet infrastructure.

**Where we are:** Internal Slice 1 pilot with Tide employees is done or underway. Slice 2 adds wallet fallback, in-app reimbursement, and automated EOY reporting. **External GA is on hold** (May 2026) because R&C identified the product as a de facto B2B2C model — employees retain app access and wallet balances post-exit — without adequate BIDM alignment or offboarding design. RFC-CARDS-0129 defines a hybrid interim architecture (`Benefit Employee` business category) en route to individual-owned resources.

**The three things that break if you get them wrong:**
1. **Wallet rules** — Meal carries forward; Fuel/Telecom sweep to General at EOY/exit; reimbursement is Fuel/Telecom only; no cross-wallet spend
2. **Lifecycle** — Exit, account closure, and EOY are core flows with tax and employer liability implications
3. **Refunds** — Must return to the originating wallet or tax ring-fencing breaks

## Confluence source index

| Topic | Confluence page |
| --- | --- |
| Product overview | [Benefit cards Overview](https://tideaccount.atlassian.net/wiki/spaces/PAYM/pages/5629510257) |
| Full PRD | [Benefit Cards PRD](https://tideaccount.atlassian.net/wiki/spaces/PAYM/pages/5618796425) |
| User journeys (reimbursement, exit, EOY) | [Benefit Cards - User Journey](https://tideaccount.atlassian.net/wiki/spaces/PAYM/pages/6590661437) |
| Internal launch / slices | [Internal Launch Plan](https://tideaccount.atlassian.net/wiki/spaces/PAYM/pages/6085214587) |
| Wallet fallback logic | [Wallet Fallback PRD](https://tideaccount.atlassian.net/wiki/spaces/PAYM/pages/5989662888) |
| Payment processing / refunds | [Payment Processing](https://tideaccount.atlassian.net/wiki/spaces/PAYM/pages/5814714425) |
| Reimbursement scenarios | [Reimbursement Scenarios](https://tideaccount.atlassian.net/wiki/spaces/PAYM/pages/5833293986) |
| Yearly limits & tax | [Yearly Benefit Limits](https://tideaccount.atlassian.net/wiki/spaces/PAYM/pages/6126436479) |
| Year-end report spec | [Year End Report](https://tideaccount.atlassian.net/wiki/spaces/PAYM/pages/6053167139) |
| Account closure | [Account Closure Process](https://tideaccount.atlassian.net/wiki/spaces/PAYM/pages/6595117216) |
| Target state architecture | [RFC-CARDS-0129 Target State](https://tideaccount.atlassian.net/wiki/spaces/TBE/pages/6596526139) |
| Post-mortem / governance | [Post-Mortem Report (DRAFT)](https://tideaccount.atlassian.net/wiki/spaces/COM/pages/6727861248) |

## Files in this folder

| File | Contents |
| --- | --- |
| [product-overview.md](./product-overview.md) | What it is, value prop, personas, rollout phases, partners |
| [wallets-and-limits.md](./wallets-and-limits.md) | Wallet types, MCC rules, tax/RBI limits, fallback |
| [user-journeys.md](./user-journeys.md) | Onboarding, reimbursement, exit, EOY, account closure |
| [payment-and-transactions.md](./payment-and-transactions.md) | Auth, refunds, reversals, RuPay routing |
| [architecture-and-target-state.md](./architecture-and-target-state.md) | Hybrid tactical vs target state, BIDM, ownership model |
| [governance-and-status.md](./governance-and-status.md) | Current status, R&C findings, open strategic questions |
| [glossary.md](./glossary.md) | Benefit Cards–specific terms |

## Key contacts & channels

- Slack: `#ps-cards-india-team`
- Structured partner / PPI partner: **Transcorp** (via M2P)
- Corporate onboarding: Partnerships team + SP (Structured Partner) portal
- Support email (exit cases): `pluxee@tide.com`

## India-only scope

Benefit Cards is an **India (IN)** product. Jurisdiction: prepaid PPI via Transcorp, RuPay network, Income Tax Act benefit exemptions.
