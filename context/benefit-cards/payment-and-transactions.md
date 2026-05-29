# Benefit Cards — Payment & Transactions

## Network & routing

- All benefit card transactions via **RuPay** network
- No direct merchant partnerships (unlike Sodexo/Pluxee model)
- MCC determines primary wallet; auth checks wallet balance before approve/decline

## Authorization options (Tide ↔ M2P)

| Option | Where fallback lives | Tide preference |
| --- | --- | --- |
| **Option 1** | M2P detects insufficient benefit wallet → falls back to General; same productCode in auth payload | **Preferred** |
| **Option 2** | Tide does fallback logic; returns updated productCode to M2P | Alternative |
| **Option 3** | No fallback | Rejected — bad UX, revenue loss |
| **Option 4** | Single benefit wallet at M2P; Tide holds multi-wallet config | Reconciliation complexity |

## Refunds & reversals — core rule

**Credits must return to the originating wallet.** Wrong-wallet crediting breaks tax ring-fencing and employer compliance.

| Wallet | Refund/reversal destination |
| --- | --- |
| Fuel | Fuel wallet |
| Food | Meal wallet |
| Telecom | Telecom wallet (note: Payment Processing doc has typo saying "meal wallet" for telecom refunds — treat as telecom) |
| General | General wallet |

Use **Original RRN** (RuPay/VISA) to identify source wallet when available.

## High-risk refund scenarios

| Scenario | Risk | Mitigation |
| --- | --- | --- |
| Same-day auth reversal | LOW | Full txn context |
| Clearing-time reversal (>24h) | MEDIUM | RRN reconciliation |
| Merchant post-settlement refund | HIGH | MCC may not match original |
| Partial refund | MEDIUM | Proportional matching |
| Duplicate refund | HIGH | Idempotency checks |
| Suppressed/different MCC in credit | **CRITICAL** | RRN-first; MCC fallback unreliable |
| Expired/suspended card | MEDIUM | Alternative workflow |
| Over-refund | HIGH | Amount validation |

## Balance sync (Tide vs M2P)

Misaligned balances between Tide ledger and M2P sub-wallets cause auth mismatches:

- M2P authorises from Fuel; Tide declines from General → final status = **Decline**
- Requires real-time sync and consistent productCode mapping

## Transaction types by wallet

| Wallet | Supported | Refund behaviour |
| --- | --- | --- |
| Fuel | Card TXN, Refund, Reversal | Credit back to Fuel |
| Food | Card TXN, Refund, Reversal | Credit back to Meal (incl. Swiggy/Zomato online refunds) |
| Telecom | Card TXN, Refund, Reversal | Credit back to Telecom |
| General | All merchants | Credit back to General if origination was General |

## Audit & recon

- Account type must appear in Tide ledger file
- SMS notifications on wallet spend/load
- One-way match rule needed for internal wallet-to-wallet transfers (Benefit Cards structured partners) — see REC-26
- Year-end report columns sourced from CCAS (card debits), CPS (reversals), claim submission/assessment tables

## Controls

- ATM withdrawal blocked on multi-benefit wallets
- POS/online restricted by MCC per wallet
- SET PIN permitted; card reorder TBD (replacement fee borne by employer)
- Spend limit management available to cardholders
- Channel management (POS, Online, Tap & Pay) — members can manage per wallet
