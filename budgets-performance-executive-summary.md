# Budgets Performance So Far - Executive Summary

## Headline

Budgets has validated demand for **ring-fencing money**: members are creating and funding Budget accounts at meaningful volume. The main gap is downstream activation: very few funded Budgets are progressing to **card issuance, first card spend, or repeat spend**.

The feature launched on **30 March 2026**, with campaigns starting the following week. Since launch, creation has remained steady, but the data suggests Budgets is currently behaving more like a savings/pot feature than a spend-control product.

## Key performance metrics

| Metric | Value | Readout |
| --- | ---: | --- |
| Budgets created | 1,471 | Strong initial adoption signal |
| Companies creating Budgets | 1,154 | 1.27 Budgets per company on average |
| Budgets funded | 618 | 42% of created Budgets |
| Cards issued | 87 | 6% of created Budgets |
| Budgets with card transactions | 13 | 1% of created Budgets |
| Deposit transactions | 1,586 | Funding/top-up behaviour is active |
| Withdrawal transactions | 951 | Members are also using Budgets to move money back |
| Total funded amount | GBP 2.28m | Meaningful money movement into Budgets |
| Card transaction amount | GBP 6.47k | Only 0.28% of funded value spent via Budget cards |
| Closed Budget accounts | 98 | 7% closure rate |

## Funnel view

### Lifetime funnel

| Step | Count | Conversion from created |
| --- | ---: | ---: |
| Budget accounts created | 1,471 | 100% |
| Active Budget accounts | 1,373 | 93% |
| Active funded Budget accounts | 603 | 41% |
| Active without first funding | 770 | 52% |
| Active cards | 66 | 4% |
| Card-transacted Budget accounts | 13 | 1% |

### First-time success funnel

| Step | Count | Conversion from first Budget created |
| --- | ---: | ---: |
| First Budget created | 650 | 100% |
| First Budget funded | 218 | 33.5% |
| First Budget card issued | 31 | 4.8% |
| First Budget first card transaction | 5 | 0.8% |
| Multiple card transactions within 30 days | 3 | 0.5% |

### Funding drop-off

| Funding status | Budgets |
| --- | ---: |
| Funded within 7 days | 545 |
| Funded beyond 7 days | 73 |
| Not funded within 7 days | 154 |
| Not funded after more than 7 days | 699 |

### Card issuance drop-off

| Card status | Budgets |
| --- | ---: |
| Card issued within 7 days | 56 |
| Card issued beyond 7 days | 9 |
| No card issued within 7 days | 257 |
| No card issued after more than 7 days | 1,153 |

### Expansion and habit formation

| Behaviour | Count | Rate |
| --- | ---: | ---: |
| First Budget created base | 650 | 100% |
| Second Budget created | 120 | 18.5% |
| Third Budget created | 46 | 7.1% |
| First Budget card transacted | 5 | 0.8% |
| Second Budget card transacted | 0 | 0% |

## Weekly creation trend

| Week | New Budgets created |
| --- | ---: |
| 2026-03-30 | 285 |
| 2026-04-06 | 350 |
| 2026-04-13 | 270 |
| 2026-04-20 | 237 |
| 2026-04-27 | 257 |

Campaigns appear to have supported a strong launch spike, and creation volume remained healthy through April.

## Segment notes

- Creation is weighted toward **Standard plan** members: 746 Budgets, or 51% of created Budgets.
- Smart, Pro, and Max account for 21%, 18%, and 10% respectively.
- Most companies are still single-Budget users:
  - Single-Budget companies: 530
  - Multi-Budget companies with 2-3 Budgets: 119
  - Power users with 4+ Budgets: 1

## Product interpretation

1. **Creation is working.** Members understand the value of setting money aside into dedicated Budget pots.
2. **Funding is the first major opportunity.** A 42% funding rate is promising, but more than half of active Budgets remain unfunded.
3. **Card activation is the critical bottleneck.** Only 6% of Budgets have cards issued and only 1% have card transactions.
4. **Budgets is not yet a spend-control habit.** GBP 2.28m has been funded, but only GBP 6.47k has been spent through Budget cards.
5. **Insufficient funds matter more than limit usage today.** Declines are mostly from `BUDGET_INSUFFICIENT_FUNDS`; limit-exceeded declines are currently low.

## Recommended focus for Budgets 2.0

Prioritise the activation loop:

**Create Budget -> Fund Budget -> Issue Card -> First Spend -> Repeat Spend**

Recommended product moves:

- Make **Add funds** the obvious next step after Budget creation.
- Make **Issue card from this Budget** the primary post-funding CTA.
- Add funded-but-no-card prompts in Budget detail and Budget list views.
- Use Admin-only nudges for unfunded Budgets, funded Budgets without cards, and cards without first spend.
- Position the explainer around spending from a Budget, not only setting money aside.
- Treat monetisation above 3 Budgets cautiously until multi-Budget and card-spend behaviour strengthens.
