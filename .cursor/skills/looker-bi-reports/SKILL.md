---
name: looker-bi-reports
description: >-
  Pulls Looker dashboard data and drafts peer-facing BI memos (monthly packs and ad-hoc
  progress checks) for Team Cards and Budgets. Uses tideaccount.eu.looker.com dashboards
  602 and 10911; query timezone Europe/London; monthly tables use separate counts per
  calendar month (not blended trailing-3-month totals); YoY same month where available.
  Default memo format: KPI header plus 3–4 headline bullets with changes, plain language
  for non-technical peers (no repro blocks or implementation jargon in the message).
  Use when the user asks for a monthly BI report, MoM/WoW/YoY metrics from Looker,
  Team Cards KPIs, Budgets funnel, or Bluecard dashboard summaries.
---

# Looker BI reports (Team Cards & Budgets)

## When this applies

Use when the user wants **data pulled from Looker** and turned into a **structured memo** for **product managers, peers, and engineering**—not C-level polish. Default to **plain language** suitable for **non-technical peers** unless the user asks for technical detail.

Typical asks:

- **Monthly pack** — Performance for the **completed calendar month** (e.g. early May → **April**) across the dashboards in [reference.md](reference.md).
- **Progress / health** — How Team Cards or Budgets are trending (MoM, WoW where relevant).
- **Exploration** — Deltas, funnels, or segments described in [reference.md](reference.md).

## Tone and audience

- **Direct and scannable**: bullets, short paragraphs, tables where helpful.
- **Honest about gaps**: if the numbers do not support a breakdown, say simply that we cannot split it from this view and what might be worth a follow-up.
- **No inflated exec framing** — clarity over ceremony.
- **Peer-facing copy** — Avoid implementation jargon in the **delivered memo** (see **Plain language for delivery** below). Technical fetch steps stay in [reference.md](reference.md) for the agent only.

## Plain language for delivery (required)

In the **message the user sends to peers**, **do not** mention: merge queries, scripts, APIs, MCP, query IDs, explore or field names, `run_dashboard` behaviour, login/auth, join logic, or similar. **Do not** include a **Repro context** block, filter dumps, or “how the data was pulled.”

**Allowed** light sourcing when useful: e.g. “from our Team Cards dashboard in Looker” or “April 2026 (UK reporting month)” — still non-technical.

## Memo format (default)

1. **Header — Key KPIs** — One line naming the **product area** and **report month** (e.g. **Team Cards — April 2026**).
2. **3–4 bullets** — Each bullet picks **one** of the most important KPIs (see [reference.md](reference.md) priorities) and states **the number**, **the comparison** (e.g. vs last month, vs same month last year), and **direction/magnitude** in plain English (e.g. “up about 6% year on year”). Prioritise what leadership and peers track first (volume, active/transacting cards, growth).
3. **Optional below the fold** — Shorter sections as in [reference.md](reference.md): e.g. **Highlights** (plan split, segments), **Worth a closer look**, **Open questions** — still plain language, no technical appendix.

If the user explicitly wants a **detailed table** (month-by-month columns), add it **after** the header and bullets, using **product labels** for metrics — not internal field names.

## Workflow

1. **Read** [reference.md](reference.md) for dashboard IDs, KPI priorities, comparison rules, fetch notes, and outline.
2. **Fix the reporting period** — Confirm **report month** (always the **finished** month unless the user says otherwise). Use **`Europe/London`** for all Looker queries and memo wording — see [reference.md](reference.md); **do not ask** the user which timezone to use.
3. **Fetch data** — Use the Looker MCP integration (how-to, edge cases, and the Flow of Expense Cards chart): see [reference.md](reference.md). Keep implementation detail **out** of the peer-facing memo.
4. **Apply comparisons** — For monthly packs: where month-level totals exist, treat **each of the three calendar months before the report month as its own figure** (not one blended “last three months” total). Add **YoY** (same calendar month, prior year) when data exists. Use **MoM** vs the immediate prior month when it helps the story. If a comparison is missing (window too short, definition mismatch), say so in **one short plain sentence**, not technical diagnosis.
5. **Write the memo** using the **default memo format** above and the **standard outline** in [reference.md](reference.md) — **without** repro blocks or technical plumbing in the delivered text.

## Dashboard priority

For combined reporting, treat **Team Cards / Expense KPIs** ([dashboard 602](reference.md)) as **primary**; **Budgets** ([dashboard 10911](reference.md)) as **secondary** but required when the monthly pack covers both Bluecard areas—see [reference.md](reference.md) for what to emphasize on each.

## Quality bar

- **Headline bullets**: cover the **largest moves** and **top KPIs** from [reference.md](reference.md); each bullet should make sense **without** reading a table.
- **Month-by-month tables** (when included): **one column per calendar month** for the report month and each of the three prior months for **the same metric** — not one blended trailing-quarter figure.
- **What caught attention**: largest deltas first; one line of interpretation only when the **numbers** support it; otherwise “worth digging into” / “not explained from this view.”
- Do not claim **causality** unless the user provides an external fact; stick to **what moved** and **when**.

## Progressive disclosure

- **Dashboard links, KPI lists, funnel narrative, comparison rules, fetch caveats, outline template**: [reference.md](reference.md)
