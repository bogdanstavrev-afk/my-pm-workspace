# Benefit Cards — Wallets & Limits

## Wallet structure

| Wallet | Type | MCC restriction | Spend channels | Notes |
| --- | --- | --- | --- | --- |
| **Food / Meal** | Closed-loop benefit | Restaurants, grocery (e.g. 5411, 5812, 5814) | POS, online | Carry-forward at FY end and on exit |
| **Fuel** | Closed-loop benefit | Petrol pumps (5541, 5542) | POS, online | Reimbursement eligible; EOY/exit → General |
| **Telecom** | Closed-loop benefit | Telecom MCCs | POS, online | Reimbursement eligible; EOY/exit → General |
| **Rewards / Gift** | Closed-loop benefit | [OPEN — list pending Transcorp] | — | Annual cap ₹5,000 (tax); not in Slice 1 |
| **General / Open PPI** | Open-loop | All merchants | Card, bank transfer, ATM | Two purposes: (1) reimbursement destination, (2) EOY sweep of unused non-meal balances |

### General wallet rules

- Cannot receive employer benefit loads directly (employer loads closed-loop wallets)
- Can receive transfers from benefit wallets (reimbursement approval, EOY sweep, exit settlement)
- Employee can withdraw via existing bank transfer / ATM capability
- Acts as **ultimate fallback** for card auth when primary benefit wallet insufficient (Slice 2+)

### Cross-wallet rules

- **Cross-usage between benefit wallets is NOT allowed** (e.g. Fuel → Meal) — tax compliance
- Only fallback path for restricted wallets is **General wallet**
- No partial deductions across wallets — full txn amount must be available in a single wallet

## Wallet fallback (Slice 2+)

**Tax-compliant fallback (from Benefit Cards PRD):**

| Primary wallet (txn MCC) | Fallback | If General insufficient |
| --- | --- | --- |
| Fuel | General only | Decline |
| Meal | General only | Decline |
| Telecom | General only | Decline |
| General | None | Decline |

**Extended fallback PRD (Wallet Fallback Logic doc)** — includes Rewards as intermediate step before General for unmapped/benefit MCC txns. Tide preference for auth: **Option 1** — M2P implements fallback, sends updated productCode to Tide.

Implementation owner: M2P must support sub-wallets for all members; balance sync between Tide ledger and M2P is critical.

## Regulatory limits

### RBI PPI (Full-KYC)

| PPI type | Max balance | Cash withdrawal |
| --- | --- | --- |
| Full-KYC PPI | ₹2,00,000 | Permitted (banks only) |

Benefit cards operate as **semi-closed system PPIs**. No balance transfer between wallets (except defined sweep/reimbursement flows). Transaction logs retained 10 years.

### Income Tax Act — exemption thresholds

| Wallet | Legal basis | Annual limit | Monthly derived | Enforcement |
| --- | --- | --- | --- | --- |
| **Meal** | Sec 17(2)(viii), Rule 3(7)(iii) | **₹26,400** | ₹2,200 (2 meals × 22 days × ₹50) | Hard block at annual; warn at monthly |
| **Gift/Rewards** | Sec 17(2)(viii) | **₹5,000** | N/A | Hard block at annual |
| **Fuel** | Sec 10(14)(ii) | Employer-defined | Employer-defined | Per employer policy; no fixed IT cap |
| **Telecom** | Sec 10(14)(ii) | Employer-defined | Employer-defined | Per employer policy |

**Critical tax notes:**
- Meal exemption **not available under new tax regime (115BAC)**
- Rule 3(2) motor car perquisite values (₹1,800–₹2,400/month) are **NOT** fuel wallet limits — those apply to employer-provided cars
- Exceeding exemption limits → taxable perquisite, not illegal transaction

### Funding enforcement (Banking Service — future)

| Scenario | Behaviour |
| --- | --- |
| Within annual + monthly | Allow |
| Monthly exceeded, annual OK | Soft warning, allow on confirm |
| Annual breach | Hard block with max-allowed amount |
| FY rollover (1 Apr) | YTD counters reset; no carry-forward of unused limit |
| Mid-year joiner | Pro-rata limit by months remaining |

Reversals/revocations **free up** annual limit for re-funding.

## KYC upgrade triggers

When min-KYC wallet approaches limits:
- Trigger at ₹7,000 overall balance → IAN/banner with deeplink to full KYC
- Block further employer credits when: balance = ₹10,000, new credit would exceed ₹10K, or monthly spend cap hit
- Member notified with reason; must complete VKYC with OVDs

## Employer wallet configuration

- Wallets configured at **employer level** by Partnerships team
- All employees see corporate-level wallet definitions (even if they opted out of specific benefits)
- Main/Reimbursement (General) account created by default
- Monthly + yearly limits per wallet; configs visible to employer
- Benefit wallet amounts **cannot be changed/edited** mid-cycle (Phase 1) — [confirm with Transcorp]
