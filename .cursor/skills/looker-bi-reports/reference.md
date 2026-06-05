# Looker BI reports — reference data

Edit this file as dashboards and priorities evolve. It is the source of truth for **which Looker content** to use and **how monthly memos are structured**.

---

## Looker instance

| Item | Value |
|------|--------|
| Host | `https://tideaccount.eu.looker.com` |

Deep links use `/dashboards/{id}`.

---

## Dashboard registry

### 602 — Expense / Team Cards KPIs (primary)

| Field | Value |
|-------|--------|
| URL | [Dashboard 602](https://tideaccount.eu.looker.com/dashboards/602) |
| Focus | **Expense Card** and **Team Cards** KPIs tracked for the product. |
| Product themes | Churn and lifecycle: **month-over-month** created **team cards**, **closed** and **expired** cards; **billable** cards; cards **transacting** in the selected period (previous vs current month as exposed in the dashboard); **transaction volumes**; distribution of **members** and **plans**. |

**Monthly memo emphasis (Team Cards — top priority):**

- **Active cards**
- **Transaction volumes**
- **Transacting cards** (count)
- **Transacting members** (count)

Use this dashboard as the **anchor** for the Executive Snapshot when both 602 and 10911 are in scope.

**`run_dashboard` caveat — “Flow of Expense Cards (# of Team Cards)” (purple line + bars)**

In the UI this is a **combined chart** (Balance / active count line + New / Expired / Churn bars). In the **`run_dashboard`** JSON from the API/MCP, that section often shows up as **`element_type: text`** with **only the heading** — **no `query_result`**. The monthly numbers you see on screen (e.g. Balance ~30k, New / Expired / Churn for April) are **not** present in that payload.

To get the **same** figures programmatically you typically need one of:

1. **Merge query API + local join** — This dashboard uses **Merged Results**: primary explore **“Product - Cards & Team Cards(new)”** plus two secondary queries, merged on **creation month** vs **update month**.  
   - Merge URL (stable id): `https://tideaccount.eu.looker.com/merge?mid=yxQK3VSfWdrKjXP7cYG10A`  
   - **Workspace script:** [`scripts/looker_merge_fetch.py`](../../../scripts/looker_merge_fetch.py) — authenticates with the Looker API (same credentials as **looker-toolbox** MCP: env vars or `~/.cursor/mcp.json`), calls **`GET /merge_queries/{merge_query_id}`**, runs each source **`GET /queries/{query_id}/run/json`**, then **left-joins** on **primary** `member_cards.created_month` = **secondary** `member_cards.updated_month`.  
   - Example:  
     `python scripts/looker_merge_fetch.py --merge-id yxQK3VSfWdrKjXP7cYG10A -o merge_flow.json`  
   - The merge query adds **table calculations** in Looker (not returned by raw `run/json` on each source alone). The **Balance** column (purple line) is:  
     `Balance = running_total_of_new_cards - churn - running_total_of_expired_cards`  
     i.e. **running total of new cards** (primary) minus the merge measure **`churn`** (from query 2) minus **`running_total_of_expired_cards`** (from query 3) — as defined in the merge’s `dynamic_fields`. The script **[`scripts/looker_merge_fetch.py`](../../../scripts/looker_merge_fetch.py)** recomputes **`Balance`** the same way after joining rows.  
   - Monthly bar heights (**New**, **Churned Cards** −1156, **Expired Cards** −604) come from **other** merge table calcs (`New Expense Cards`, `-count_of_card_id_2`, `-count_of_card_id`) — different from the cumulative fields inside **Balance**.
2. **Full dashboard definition** — Resolve **`dashboard_elements`** for that tile’s **`query_id`** / merge refs, then **`run_query`** by ID.
3. **Explore from Here** — Note **model**, **explore**, and **field names**; then **`query`** / **`query_sql`** with **`Europe/London`**.

**Auth note:** Some EU instances accept **`application/x-www-form-urlencoded`** `POST /api/4.0/login`; pure JSON login may return **404** — the script tries both.

Other tiles on **602** still return usable monthly series via **`run_dashboard`** (e.g. **`card_transaction_team_member.*`** by **`transaction_month`**; **`member_teamcard_details.card_cancelled_at_month`** for cancellations). Treat those as **related** to churn/expiry only if definitions match the chart.

### 10911 — Budgets (pods; shipped end of March)

| Field | Value |
|-------|--------|
| URL | [Dashboard 10911](https://tideaccount.eu.looker.com/dashboards/10911) |
| Focus | First-track **budgets** feature: behaves like **pods**; executive view includes **active budgets**. |

**What to monitor:**

- **Card transactions** and **transaction volume**: **month-over-month** and **week-over-week** where the dashboard supports it.
- **Split**: **team cards** vs **admin spend**; emphasise **team members’ spend** where available.
- **Funnels** shown on the dashboard: interpret stages such as companies / budgets **funded**, **spend with card**, **cards issued**, etc.
- **Intended journey** (for narrative): create a budget → **fund** it → **issue a card** on that budget → **spend** with that card (revenue from card transactions).
- **Commercial context**: each member may open **up to three budgets for free** — relevant when interpreting adoption vs monetisation.

---

## Reporting cadence

| Concept | Rule |
|---------|------|
| Report month | The **completed calendar month** under review (e.g. when writing **at the beginning of May**, the report month is **April**). |
| Dashboards in scope | Both **602** and **10911** for the standard monthly Bluecard pack unless the user narrows to one. |
| “Previous month” in churn/KPI copy | Align filters with **report month** vs **prior month** as implemented in each dashboard’s filters. |

**Timezone (fixed):** Always use **`Europe/London`** for Looker `query_timezone`, calendar-month boundaries, and how you describe periods in the memo. **Do not** ask the user which timezone to apply.

---

## Comparison rules (monthly pack)

For the **report month** (e.g. April):

1. **Prior three months — separate counts** — For metrics where **month-level totals** exist (transaction counts, volumes, cancellations, etc.), show **January, February, and March** as **three separate figures** when the report month is April — **not** a single blended sum or average of “the previous quarter” in the **Executive Snapshot** table. You may add **MoM** (e.g. April vs March) or **vs January** in commentary.
2. **Year over year** — Compare to the **same calendar month in the prior year** (e.g. April N vs April N−1) when that month appears in the query output.

Present **absolute** and **percentage** change where meaningful; for rates or penetration-style metrics, use **percentage points** when appropriate and label clearly.

If the API or dashboard returns only MoM, surface that and note what is missing.

---

## Standard memo outline

Use this order unless the user asks for something shorter. **Peer-facing memos** follow [SKILL.md](SKILL.md): **Key KPIs header**, then **3–4 bullets** with the most important metrics and changes — **no Repro context** section and no merge/script/API terminology in the message.

### 1. Key KPIs (header + bullets)

- **Header**: product area + report month (e.g. **Team Cards — April 2026**).
- **3–4 bullets**: top KPIs from dashboard priorities below — each bullet = **metric**, **value or trend**, **change** (MoM / YoY / vs recent baseline) in plain language.
- Optional **compact table** after the bullets if helpful — month columns Jan → report month, plus YoY where available; use **business labels** only.

### 2. Highlights

- Breakdowns peers care about (plan, segment, team vs admin spend on Budgets, etc.).
- Short interpretation; avoid internal chart/tile names unless peer-friendly (“spend by plan” not field names).

### 3. Anomalies and noticeable differentiations

- Obvious outliers or divergences between segments.
- If something looks odd, describe it simply (“March was unusually high vs April”) — not filter or pipeline jargon.

### 4. What caught attention

- Larger deltas first; brief “why it might matter” only when the **same numbers** support it.
- Otherwise: **“Worth looking into”** / **“Not clear from this dashboard.”**

---

## Ad-hoc “how are we progressing?” requests

1. Map the question to **602** and/or **10911** using the sections above.
2. Pull the smallest sufficient dataset: **`run_dashboard`** first; **`query`** if specific fields or cuts are needed.
3. Answer with **metric + period + comparison**; end with **risks or open questions** if metrics alone do not explain movement.

---

## Guardrails

- Do not invent KPIs not present in Looker output unless the user defines them.
- Do not state **causal** explanations without evidence; prefer **observed co-movement** and **questions**.
- **Peer-facing memos** — Do **not** include repro blocks, dashboard IDs, filter strings, or technical sourcing. Optional one line: e.g. “Numbers from our Team Cards view in Looker, April 2026 (UK month).” **Agents** may use dashboard ids and filters **internally** while fetching; see fetch sections above.
