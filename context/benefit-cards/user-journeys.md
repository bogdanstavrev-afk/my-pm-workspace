# Benefit Cards — User Journeys

## Reimbursement (Fuel & Telecom only — NOT Meal)

Employees who paid from personal funds can claim against pre-allocated wallet balance. Ops team validates receipts; on approval, funds move from benefit wallet → General wallet.

### Employee flow (Slice 2)

1. Navigate to **Reimbursements** section
2. Submit claim: type (Fuel/Telecom), amount, receipt (PDF/JPG, max 5MB), expense date, optional notes
3. Claim allowed even if amount **less than** wallet balance
4. Receive reference number; status = Pending Review (~2–3 business days)
5. Track status: Pending / Approved / Rejected / Partially Approved

### Finance/Ops approval (BOT)

- View claim details, receipt, **real-time** wallet balance
- Options: Full approval, Partial approval, Rejection (mandatory comments for partial/reject)
- **Zero balance at approval:** must reject with reason "Insufficient wallet balance at time of approval"
- **Partial approval (Option B):** transfer available balance; reject remainder with reason
- On approval: debit benefit wallet, credit General; entries on both timelines

### De-duplication

- Slice 1–2: Ops manually checks prior claims
- Slice 3: OCR or invoice number check
- Business rule: do not approve if same bill previously submitted (full or partial)

## End of financial year

Corporate sets cut-off date (aligned to payroll — e.g. 15 working days before report needed).

**On cut-off date:**
- All benefit wallet balances **except Meal** auto-transfer to General wallet
- Meal balance **carried forward** to next FY
- Employee can then: spend via card, bank transfer, or ATM from General
- Pre-cut-off banner (good to have): warn unused balances will move and become taxable

**Year-end report:** Available cut-off + ~8 days. See Confluence Year End Report spec for 40+ column mapping.

## Exit employee

### Settlement rules

| Wallet | On last working day | Post-exit |
| --- | --- | --- |
| **Food/Meal** | Retained (carry forward) | Cannot withdraw; blocks account closure if balance remains |
| **Fuel, Telecom** | Auto-transfer to General at EOD | Employee uses General (card/ATM/transfer) |
| **Rewards** | Retained (carry forward) | Same as Meal |

### Process (slices)

| Slice | Capability |
| --- | --- |
| Slice 2 | Tide Ops marks exit date in BOT; employee banner shows last working day |
| Slice 3 | HR marks exit in portal; batch exit; automated email to Tide (`pluxee@tide.com`) |

**Employer actions post-exit:**
1. Pullback on General wallet (freezes account ~5 days)
2. Delink employee from corporate SP
3. Settle recovered amount via salary/FNF

**Employee comms (Slice 2):** Notify that unused benefit funds moved to main Tide account; can use via card, transfers, ATM.

Exit employees **not included** in standard EOY report.

## Account closure

Employees **cannot opt out** mid-year without employer coordination — benefits are part of salary structure. Employer may offer opt-out window (typically October).

### Scenario 1: Active employee — opt out only (no closure)
- Employee informs employer
- Employer stops future payouts
- **Do not delink** — entry needed in EOY report
- Tide not liable for post-opt-out payouts employer initiates

### Scenario 2: Active employee — account closure
- App shows popover: use remaining balance, coordinate with employer
- Employer decides if closure allowed → contacts Tide
- Funds move benefit → General; tax report to employer
- MS follows regular account closure via chat

### Scenario 3: Ex-employee — account closure
- If meal wallet balance > ₹0: **error** — must use meal balance first
- If only General/other zeroed: take tax liability consent via chat
- Move benefit → General, then standard account closure

**Transcorp view:** Tide holds liability for these scenarios; must handle with employer.

## Benefit preference changes (Phase 2)

Employee selects categories/limits in payroll app → HR report → HR invites to Tide + configures wallets. HR manually syncs payroll changes to Tide platform.

## Employee card experience

- Wallets: landing page + transaction history per wallet (similar to NCMC/Travel)
- Channel/limit management: same as existing cards; ATM blocked on benefit wallets
- Real-time txn notifications per wallet spend/load
- Reimbursement section for claim tracking
