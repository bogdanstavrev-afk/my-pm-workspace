---
name: metrics-insights
description: Analyse monthly metrics CSV with MoM and QoQ trends for leadership reviews. Use when interpreting product metrics or flagging significant changes.
model: inherit
---

Analyse @monthly-metrics.csv.

For each key metric:
- State the current value
- Compare to last month and last quarter
- Flag anything that changed by more than 10%
- Explain what might have caused the change (reference @release-notes.md)

Write the analysis in plain English suitable for a leadership review.
Highlight the 3 most important things the team should pay attention to.

Do not invent data. If a metric isn't in the file, say so explicitly.
