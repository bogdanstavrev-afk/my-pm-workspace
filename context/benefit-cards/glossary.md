# Benefit Cards — Glossary

Terms specific to Benefit Cards. For general Tide terms see root [glossary.md](../../glossary.md).

| Term | Definition |
| --- | --- |
| **Benefit Card / Multi Benefit Card** | Prepaid, multi-wallet card for employee benefits (Food, Fuel, Telecom, Rewards) with MCC-restricted spend and employer-funded payouts |
| **Benefit wallet** | Closed-loop sub-wallet on the PPI account for a specific benefit category; employer-funded; card spend only (no bank transfers) |
| **General wallet / Open PPI wallet** | Open-loop wallet receiving reimbursement credits and EOY/exit sweeps; supports card, bank transfer, ATM |
| **Structured Partner (SP)** | Corporate employer onboarded via Tide's partner program to issue benefit cards to employees |
| **Target product: Benefits Cards** | Partner type flag in Create Partner BOT for structured partner corporate onboarding |
| **Linked member** | Employee linked to corporate SP; receives benefit card and wallets |
| **MCC** | Merchant Category Code; determines which benefit wallet a card transaction draws from |
| **Fallback** | Auth logic to use General wallet when primary benefit wallet has insufficient balance (Slice 2+) |
| **Reimbursement claim** | Employee-submitted bill for personal spend against Fuel/Telecom wallet balance; approved claims debit benefit wallet and credit General |
| **Pullback** | Employer-initiated recovery of General wallet balance on employee exit; freezes account ~5 days |
| **Delink / Remove employee** | Sever employee–employer relationship in SP; triggers exit settlement workflow |
| **EOY report / Year-end report** | Corporate tax reconciliation report with 40+ columns per employee per wallet per FY |
| **Cut-off date** | Corporate-configured FY end date for benefit wallet sweep (non-meal → General) |
| **FNF (Full & Final)** | Payroll settlement on exit; unused Fuel/Telecom recovered via employer pullback and paid through salary |
| **Slice 1 / Slice 2** | Phased delivery: Slice 1 = internal pilot without fallback/reimbursement app; Slice 2 = fallback, reimbursement, EOY, bulk registration |
| **Pluxee / Sodexo** | Incumbent benefit card provider being phased out for Tide internal employees |
| **Transcorp (TC/TIL)** | RBI-licensed PPI issuer partner for Tide India benefit cards |
| **M2P** | Payment processor / BaaS partner managing multi-wallet at card network level |
| **Full-KYC PPI** | KYC tier allowing ₹2L balance, cash withdrawal, fund transfer — required for benefit cards |
| **Benefit Employee** | BIDM business category for tactical-state employee entities (interim architecture) |
| **Hybrid state** | Interim architecture issuing Business IDs to employees while migrating to individual ownership target state |
| **b2b / b2i validation** | BIDM relationship check: business-to-business (legacy) vs business-to-individual (target for benefit employees) |

## Wallet shorthand

| Shorthand | Full name |
| --- | --- |
| Meal / Food | Food/Grocery wallet |
| General | Open PPI / reimbursement wallet |
| NCMC | Reference pattern for multi-wallet UI (Travel account) — similar wallet landing pages |

## Tax limits (quick reference)

| Wallet | Annual exemption |
| --- | --- |
| Meal | ₹26,400 |
| Rewards/Gift | ₹5,000 |
| Fuel, Telecom | Employer-defined (actual expense) |
