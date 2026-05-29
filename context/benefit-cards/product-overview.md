# Benefit Cards — Product Overview

## What it is

The **Multi Benefit Card** is a prepaid, multi-wallet card solution for corporates to distribute employee benefits in a tax-efficient, compliant way. Employees get one card with distinct wallets (Food, Fuel, Telecom, Rewards) governed by MCC restrictions. Employers fund wallets via structured partner onboarding and monthly payouts.

Tide extends existing payments infrastructure (PPI, cards, payouts) into a **corporate benefit distribution model** — replacing incumbents like Pluxee/Sodexo for Tide and external corporates.

## Value proposition

- Streamlines benefit disbursement and employee spend
- Ensures regulatory compliance and tax efficiency (wallet ring-fencing)
- Single card for multiple benefit categories
- Employer controls, reporting, and year-end reconciliation

## Target audience & rollout

| Phase | Timing | Audience |
| --- | --- | --- |
| **Phase 1 — Internal pilot (Slice 1)** | Nov 2025 | ~250 eligible Tide employees; target 100+ volunteers; Sodexo cards remain parallel |
| **Phase 2 — Enhanced pilot (Slice 2)** | Feb 2026 | Remaining Tide employees; wallet fallback, in-app reimbursement, EOY report, bulk lead registration |
| **Phase 3 — GA** | Apr 2026 (planned) | External corporate clients (B2B structured partners) |

**Current status:** GA launch **on hold** pending strategic/governance resolution. See [governance-and-status.md](./governance-and-status.md).

## Personas

| Persona | Capabilities |
| --- | --- |
| **Admin** | Invite employees, allocate cards, enable benefit wallets, initiate monthly transactions |
| **Finance** | Review staged monthly transactions, approve |
| **Approver** | Approve employee-submitted reimbursement bills |
| **Employee** | Use benefit card, view wallet transactions, submit reimbursement claims for personal spend |

## Corporate onboarding flow (high level)

1. **Structured Partner setup** — Corporate registered as "Registered Business" in BIDM; KYX manual (same as SP onboarding); Transcorp manages onboarding policy
2. **Business account** — Partnerships creates Tide account via Create Partner BOT (`partner type = Structured partner`, target product = **Benefits Cards**)
3. **Benefit configuration** — Partnerships defines wallets at corporate level (Food, Fuel, Telecom, Rewards); editable each financial year (Slice 2+)
4. **Roles** — Admin (Slice 1); Finance + Approver roles from IAM (Slice 2)
5. **Load funds** — Corporate loads via existing load-funds rails; prepaid model before payouts
6. **Payouts** — Manual CSV bulk payout in Phase 1; employer specifies target wallet per payout

## Employee onboarding routes

### Referral-based (Tide internal, Phase 1)
- New members enter employer referral code during onboarding
- Existing members: referral codes updated via BOT
- KMs (KYX_C): entry via "Recommended for you" + push notification

### Bulk upload (external corporates + Tide, Phase 2)
- Admin uploads CSV: full name, PAN, phone, email, communication address
- Employee receives SMS/email invitation
- Admin sees Tide onboarding status per employee

### Entry point by KYX level

| Member type | KYX | Entry point | Card/wallet |
| --- | --- | --- | --- |
| New member | KYX_0 → full KYC | Progressive onboarding screen | Card issued after full KYC |
| Existing RM | KYX_0/KYX_A → full KYC | Progressive onboarding screen | Card issued after full KYC |
| Existing KM | KYX_C | Recommended for you / push | Wallets enabled on existing Tide card |

**Hard rule:** Benefit card issued only after **full KYC** (Full-KYC PPI, max balance ₹2,00,000).

## Card & physical product

| Phase | Card design |
| --- | --- |
| Phase 1 | Regular blue Tide card |
| Phase 2 | Dedicated benefit card design |

Activation, PIN, digital card details: same as existing Tide card flows. ATM **not** permitted on benefit wallets.

## Distribution options (employer → employee)

1. **Direct delivery** — Personalized cards to employee addresses
2. **Bulk office delivery** — Non-personalized cards to employer (requires instant cards / bulk lead logic — [OPEN QUESTION] feasibility vs referral code model)

## Slice 1 known limitations

1. **No wallet fallback** — Transaction declined if primary MCC-mapped wallet insufficient, even when General has balance
2. **Manual reimbursement** — No in-app automated flow in Slice 1
3. **Rewards wallet** — Not offered in Slice 1; Sodexo used for rewards
4. **EOY report** — Phase 1 txn data populated manually in report

## Key partners & systems

- **Transcorp** — PPI license, corporate onboarding policy, MCC mapping (IT guidelines)
- **M2P** — Multi-wallet at processor; fallback implementation preference Option 1 (M2P-side fallback to General)
- **RuPay** — All card transactions; no direct merchant partnerships (unlike Sodexo model)
- **BIDM** — Business/individual relationships; current b2b validation being moved to b2i for benefit employees
- **SP Global portal** — Corporate employer UX (reuse existing SP solutions web portal)

## Open product questions (from Confluence)

- MCC codes per wallet per IT guidelines — Transcorp/M2P
- ATM block configuration on benefit wallets — M2P/Tide
- VKYC trigger conditions completeness — Transcorp/M2P
- Corporate SP onboarding policy — Transcorp
- EOY transfer API (closed-loop → open-loop General) — Transcorp/M2P
- Can wallet config be stored before employee onboards? (Possible, like NCMC)
- Remitter name for corporate load funds — legal validation needed
