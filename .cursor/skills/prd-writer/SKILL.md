---
name: prd-writer
description: >-
  Drafts and revises product documents (Full PRD, Feature Brief, One-Pager, AI Feature PRD,
  Agentic/Workflow PRD, Strategy Doc). Use when the user says write a PRD, spec this out,
  feature brief, one-pager, strategy doc, or needs a formal product document for engineering
  and leadership.
---

# PRD writer playbook

Run this playbook end to end before producing a document. Pair with the `prd-writer` agent (`.cursor/agents/prd-writer.md`) for tone and quality bar.

## Step 1 — Pick document type

| Type | Use when |
|------|----------|
| **Full PRD** | Net-new feature or material change; engineering kickoff needs full context |
| **Feature Brief** | Scoped enhancement; single squad; &lt;2 sprint build |
| **One-Pager** | Leadership alignment, pitch, or go/no-go before discovery |
| **AI Feature PRD** | ML/LLM capability with evals, guardrails, and human-in-the-loop |
| **Agentic / Workflow PRD** | Multi-step agent or automation pipeline |
| **Strategy Doc** | Theme, bet, or portfolio direction — not build-ready spec |

If intent is obvious from context, proceed without asking. Otherwise ask one short question listing the types above.

## Step 2 — Load the template

Read the matching file under `references/` in this skill folder:

- `references/full-prd-template.md`
- `references/feature-brief-template.md`
- `references/one-pager-template.md`
- `references/ai-feature-prd-template.md`
- `references/agentic-prd-template.md`
- `references/strategy-doc-template.md`

Fill every section. Use `TBD` only where unknown — add to **Open questions**.

## Step 3 — Write the document

### Universal rules

- Lead with the **problem** and **who** is affected; then solution.
- Tie every requirement to a **user scenario** or **measurable outcome**; requirements must be **testable**.
- State **in scope** and **out of scope** explicitly.
- Surface assumptions: `> **Assumption:** …`
- No marketing language or filler.
- Prefer real numbers; flag gaps in **Open questions**.

### Regulated / fintech (Tide)

If the work touches member data, fraud, credit, KYC/AML, payments, or invoicing → include **Regulatory & Compliance Considerations**.

Use canonical terms on first use (KYB, KYC, BCA, etc.). Expand or link if a workspace glossary exists.

### AI features

Always include:

- Confidence / evidence for model outputs
- Failure modes and guardrails
- Human-in-the-loop checkpoints
- Feedback loop for improvement over time

### Agentic / pipeline features

Describe: **trigger**, **step-by-step pipeline**, **failure handling per step**, **observability**.

## Step 4 — Save output

- Default path: `prds/<feature-slug>-<doc-type>.md` (e.g. `prds/invoice-reminders-prd.md`)
- Never overwrite an existing user-authored file without explicit confirmation.

## Step 5 — Close with next steps

After the document, add ≤3 bullets:

1. Who to share with first
2. Open questions to resolve before kickoff
3. Next artifact (tech spec, design brief, API contract, Jira stories via `story-generator` agent)

## Related workspace assets

- Agent: `.cursor/agents/prd-writer.md`
- Jira stories: `.cursor/agents/story-generator.md` + `jira-multi-team-tasks` skill
- Challenge draft: `.cursor/agents/cpo-challenger.md`
