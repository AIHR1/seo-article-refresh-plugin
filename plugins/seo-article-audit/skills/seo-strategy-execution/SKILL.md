---
name: seo-strategy-execution
description: >-
  Turn a confirmed AIHR SEO article audit strategy into compact, click-focused article
  change recommendations and draft edits. Use after seo-article-audit when a human asks
  to execute the strategy, suggest SEO refresh changes, draft optimizations, rewrite or
  tighten sections, change headings, map keyword opportunities to article edits, assess
  rewrite risk, or prepare diff-ready article updates. This skill may interpret GSC,
  SERP, competitor, and article evidence, must use the bundled serp-analysis skill
  for live Google SERP facts, must use article-diff-md to show draft edits as a
  red/green diff block, must use outline-article-refresh-memory before and after
  execution work, and must not use Ahrefs SERP tools.
---

# SEO Strategy Execution

## Purpose

Convert a confirmed SEO article audit strategy into specific article changes that are likely to recover clicks.

This is the execution step after `seo-article-audit`. The audit diagnoses the decline and chooses the strategy direction. This skill decides what to change in the article, why each change should help, what keyword or SERP opportunity it targets, and what risk the change creates.

## Core Goal

Regain clicks. Rankings matter only when they can plausibly produce clicks from the current SERP.

Every recommended edit must connect to at least one click-recovery path:

- Improve fit for the primary keyword's observed intent.
- Capture a secondary keyword with meaningful GSC/SERP opportunity.
- Address People Also Ask or related-search demand when it supports the article's scope.
- Improve CTR or snippet relevance without changing the article's target intent.
- Reduce mismatch, duplication, or bloat that weakens the article's usefulness.

## Click-Recovery Portfolio Gate

Do not treat compliance, readability, or a low-risk diff as success. Before drafting
edits, establish a measurable click-recovery thesis across a bounded recovery portfolio. The portfolio may contain the primary query and multiple distinct secondary clusters. When the audit classifies the primary query as AIHR-wide / demand-constrained, the recovery thesis may be secondary-led; it must say clearly that this is not a promise to replace all primary-query loss. Do not cap discovery at one or two clusters: screen the broad opportunity universe first, then keep the smallest set of opportunities that has a credible combined recovery thesis. For each proposed opportunity, show:

| Required proof | What to show |
| --- | --- |
| Addressable query cluster | Exact GSC queries, current and previous clicks/impressions, and current position or a clearly stated data gap. |
| Search opportunity | Screenshot-backed live SERP intent and modules, plus the competitor pattern or content gap that makes the opportunity plausible. |
| Intervention mechanism | Why a specific change could win new impressions, improve CTR, or better satisfy an intent that the current article does not already meet. |
| Incremental-click scenario | A transparent, non-guaranteed range with the arithmetic and assumptions shown (for example, addressable impressions × assumed CTR change). |
| Portfolio materiality and risk | Why the combined, bounded range justifies the changes, which contribution each cluster can realistically make, and which existing query coverage might be lost. |

Each portfolio opportunity needs the first four proofs; the portfolio passes only when the combined plan has the fifth. A definition or copy cleanup does **not** pass by itself unless the model demonstrates an incremental-click scenario. Do not call a change click-focused merely because it fits the primary keyword.

If a heading or lead-in promises a template, example, tool, worksheet, or other format that the article does not actually provide, treat that as a substantive format gap. The intervention must then add the promised, source-supported format under the relevant heading—not merely add a keyword heading or generic FAQ.

Return **No-Go — no credible click-recovery path on the current page** only when neither the primary path nor any evidenced secondary cluster has an actionable intent/format gap. Do not create a production diff in that case. Instead, choose and justify one of:

- a materially different rewrite hypothesis to test with fresh evidence;
- a separate or supporting article/page opportunity, where keyword cannibalization and
  internal-link implications are addressed; or
- deprioritization, with the evidence for stopping investment.

## Required Inputs

Start with the best available evidence:

- AIHR article URL and current article content.
- The prior `seo-article-audit` strategy report, when available.
- GSC query findings for the exact page, especially current/previous clicks, impressions, CTR, position, and query losses.
- The audit's primary-demand vs page-loss diagnosis, including monthly exact-page versus AIHR-wide exact-query comparisons when the primary query drives the loss.
- Primary and secondary keyword direction approved or discussed by the human.
- Existing `serp-analysis` reports and screenshots for every keyword being targeted.

If the audit report is missing, ask for it only when the URL/article alone is not enough to understand the strategy. If SERP evidence is missing or stale for a keyword you want to target, run `serp-analysis` again before recommending keyword-targeted changes.

## Tool Boundaries

- Use `outline-article-refresh-memory` before execution work to check prior monthly records for the article slug and URL.
- Use `outline-article-refresh-memory` after execution work to create or update the current monthly record with the execution summary, proposed changes, rewrite risks, and diff artifact or diff summary.
- Use `serp-analysis` for live Google SERP facts. It remains fact-only.
- You may interpret `serp-analysis` output, visit competitor pages from the live SERP, inspect AIHR's article, and recommend or draft article changes.
- Do not use Ahrefs SERP tools, Ahrefs site-explorer, Ahrefs rank-index exports, or pasted Ahrefs SERP rows for SERP facts.
- Do not ask `serp-analysis` to recommend article edits. It only returns observed SERP inventory.
- If keyword difficulty or volume is needed and not already present from the audit, use only the same Ahrefs keyword metrics boundary defined in `seo-article-audit`: `keywords-explorer-overview` for difficulty and search volume in the US.
- Do not claim downloadable formats, templates, tools, worksheets, or editable assets are available unless you verified them in the article or source asset.

## Memory Workflow

At the start of every execution run:

1. Use `outline-article-refresh-memory` to search the AIHR SEO Article Refresh collection for the article slug and URL.
2. Read relevant prior records and carry forward do-not-repeat notes, prior strategy decisions, reverted ideas, or previous draft edits.
3. State whether Outline memory was read and which record(s) mattered.

At the end of every execution run:

1. Use `outline-article-refresh-memory` to create or update the current monthly record.
2. Store the strategy execution summary, prioritized changes, rewrite risk assessment, and draft-edit diff or diff summary.
3. Return the Outline document link when the write succeeds.

If an Outline write is blocked, rejected, or requires approval, follow `outline-article-refresh-memory`: stop and ask for approval instead of silently skipping it.

## Workflow

### 1. Check Outline Memory

Search prior Outline memory for the article slug and URL before drafting execution recommendations. Use relevant prior records to avoid repeating stale analysis, previously rejected edits, or duplicated work.

### 2. Reconstruct The Strategy

Identify:

- Primary keyword and whether it remains the main target.
- Secondary keyword(s) chosen as the recovery path.
- Queries with lost clicks, high impressions, weak CTR, or striking-distance positions.
- SERP constraints that affect clicks, such as AI Overview, ads, PAA, image/video modules, tools/templates, or dominant page types.
- Human-approved strategy direction, if stated.

Before accepting an earlier audit shortlist, run a **portfolio challenge**. Reopen the GSC candidate universe and the exact People Also Ask and People also search for / related-search terms from every live SERP already captured. Compare at least three credible, distinct intents when available. Explicitly classify each as:

```text
portfolio opportunity
supporting coverage only
separate-page hypothesis
rejected, with evidence
```

Do not treat a term as rejected simply because it has no exact-page GSC row. It may be a new-coverage hypothesis; check its allowed Ahrefs metrics, its live SERP intent, and the current article's coverage before deciding. Keep PAA questions and related-search terms as exact, separately labelled observations.

If fresh evidence contradicts the prior strategy, say so and explain the contradiction before drafting edits.

### 3. Read The Article For Coverage And Bloat

Review the current article before suggesting changes. Map the article by section:

- What each section currently covers.
- Which keyword or intent it supports.
- Which GSC/SERP opportunity it already addresses.
- Which sections are thin, outdated, redundant, off-intent, or overly long.

Do not default to the smallest edit. Prefer tightening, rewriting, or consolidating
when that is sufficient to pass the Click-Recovery Portfolio Gate. Add or materially restructure
content only when the gate shows an addressable query/intent opportunity that the
current article does not already cover.

### 4. Refresh SERP And Competitor Evidence

For every keyword you actively target, and every SERP-derived hypothesis with a clear on-page gap that remains under consideration:

- Use existing `serp-analysis` output if it is available and current.
- Rerun `serp-analysis` if live SERP evidence is missing, stale, or not screenshot-backed.
- Open visible competitor pages from the live SERP before proposing material content additions or rewrites.

Report a `SERP compliance status`:

```text
Compliant - screenshot-backed live Google SERP evidence from serp-analysis.
Blocked - required browser/SERP route unavailable.
```

In normal production execution, `Blocked` means do not make keyword-targeted article recommendations for that keyword. Ask the user to connect the required browser tooling or provide compliant SERP evidence.

From competitors, extract patterns only:

- Intent angle and page format.
- Topics, examples, tools, templates, comparisons, or definitions they cover.
- What appears above the fold.
- How they answer PAA or related-search needs.
- Gaps where AIHR can be more useful, clearer, more practical, or more concise.

Do not copy competitor wording, structure verbatim, distinctive examples, proprietary frameworks, tables, or phrasing. Use competitor evidence to understand intent and coverage gaps, then create original AIHR guidance.

### 5. Build The Change List

Create a prioritized list of changes only after at least one opportunity passes the
Click-Recovery Portfolio Gate. Each change must state:

- Action type: add, rewrite, tighten, consolidate, remove, change heading, update intro, add example, add table, add FAQ, improve internal transition, or adjust snippet-facing copy.
- Target location in the article.
- Target keyword(s).
- Click-recovery rationale.
- How it supports the primary keyword.
- Secondary keyword and People Also Search For / related-search mapping, when relevant.
- SERP or competitor evidence used.
- Bloat control decision.
- Rewrite risk assessment.

Do not include a change whose mechanism is only “clearer copy” or “better SEO” without
an explicit incremental-click scenario. New headings, FAQs, sections, or a separate-page
recommendation must map to a query cluster and live SERP evidence; do not add them as
generic completeness improvements.

Do not recommend a change just because a competitor has it. Recommend it only when it advances the click-recovery strategy and fits AIHR's article.

### 6. Assess Rewrite Risk

For every rewrite, consolidation, removal, or heading change, assess what could be lost:

- Existing GSC queries the section may support.
- Primary intent signals that could weaken.
- Related concepts the article currently covers.
- Internal links, examples, or definitions that should be preserved.
- Whether the edit could gain one keyword while losing another.

Use one of these risk labels:

```text
Low risk - preserves existing intent and improves clarity.
Medium risk - changes emphasis; preserve named concepts and query coverage.
High risk - may weaken existing keyword coverage or shift article intent.
Do not change - risk outweighs likely click recovery.
```

### 7. Draft The Edits

When the user wants execution, produce draft edits, not only recommendations.

Use the format that the passing recovery thesis requires:

- Section-level replacement copy for rewrites.
- New paragraph copy for additions.
- Old heading -> new heading for heading changes.
- Remove/consolidate notes for cuts.
- A pre-marked diff for changed article sections, then use `article-diff-md` to show the draft edits as a single red/green diff-block artifact.

Drafts must be concise, useful, and non-duplicative. Avoid expansion that has no
measurable recovery mechanism. If the article grows, explain the addressable query
cluster, expected incremental-click scenario, and why the added content is worth the
extra length.

Production diffs must use exact old text from the current article. If you cannot match the exact old text, label the draft as advisory and do not present it as a production-ready patch.

For production execution, the full `article-diff-md` article artifact is required. A focused changed-section diff is allowed only when the user explicitly asks for focused draft edits; label it clearly and do not treat it as the production deliverable.

For legal, protected-activity, safety, dismissal, or jurisdiction-sensitive content, reconcile any conflict between the proposed wording and the current article before drafting the production patch. Use conditional, jurisdiction-aware language unless the source evidence supports a narrower statement. Do not leave a contradictory original legal statement unchanged beside a new boundary or caveat.

### 8. Update Outline Memory

After producing recommendations or draft edits, update Outline through `outline-article-refresh-memory`. Capture:

- Article URL and slug.
- Prior record(s) consulted.
- Strategy direction and click-recovery target.
- Proposed changes and rewrite risks.
- SERP compliance status.
- Diff artifact link or a summary of the diff when the file is local-only.

Do not finish a production execution run while the Outline update is unresolved.

## Output Contract

Return Markdown with these sections:

```text
Article And Strategy
Evidence Used
Outline Memory Status
SERP Compliance Status
Click-Recovery Portfolio Gate
Secondary Opportunity Portfolio And Rejections
Prioritized Changes
Keyword And SERP Mapping
Competitor Patterns Used
Bloat And Rewrite Risk
Draft Edits
Expected Click Impact
Open Questions Or Human Checks
Artifacts
```

### Prioritized Changes

Use a table unless the edits are too detailed for a table:

```text
| Priority | Change | Location | Target keyword(s) | Click-recovery rationale | Evidence | Risk |
```

### Secondary Opportunity Portfolio And Rejections

Show the broad comparison before the chosen changes:

```text
| Cluster | Source (GSC, PAA, or related search) | GSC baseline / data gap | Ahrefs metrics | Live-SERP intent and modules | Current coverage | Decision and rationale |
```

Use the exact PAA and related-search text captured by `serp-analysis`. Never invent, merge, or relabel these terms. A phrase with no GSC row may be a valid new-coverage hypothesis, but it must not be presented as existing page demand.

### Click-Recovery Portfolio Gate

Before `Prioritized Changes`, include a table:

```text
| Query cluster and portfolio role | Addressable queries and baseline | SERP / competitor evidence | Intervention mechanism | Incremental-click scenario and assumptions | Portfolio contribution / result |
```

Use a calculated scenario range, not a promise. If a required input is unavailable,
state the gap and fail that opportunity rather than inventing an estimate. State the primary-demand verdict and whether the portfolio is secondary-led. When every evidenced path fails, put `No-Go` here and omit `Draft Edits` and the production diff.

### Draft Edits

For each drafted edit, include:

```text
Change:
Location:
Why:
Draft copy:
Risk notes:
```

After drafting the edits, use `article-diff-md` to format and show the draft edits as a red/green diff block. This skill owns choosing and marking the edits; `article-diff-md` is only the delivery formatter.

Provide `article-diff-md` with:

```text
article URL or article text
pre-marked draft edits, with removed lines prefixed `-` and added lines prefixed `+`
short voice-over summary of what changed and why
```

If the user only wants a strategic recommendation and explicitly does not want draft copy, skip `article-diff-md`. Otherwise, draft-edit output should use it.

### Outline Memory Status

Always include:

```text
Outline read status:
Outline write status:
Outline document:
```

Use `n/a` only when the user explicitly excluded Outline persistence. In production SEO refresh work, Outline is expected.

## Quality Bar

Before finalizing, self-check:

- Prior Outline records were checked, or a blocker is explicitly reported.
- Every keyword-targeting recommendation is backed by GSC, SERP, competitor, or article evidence.
- Every targeted keyword has live Google SERP evidence from `serp-analysis`.
- SERP compliance status is included.
- The plan is about recovering clicks, not maximizing keyword count.
- The report states whether the primary-query loss is page-specific, AIHR-wide / demand-constrained, mixed, or unresolved. When it is constrained, the plan uses an evidenced secondary-led recovery portfolio rather than pretending a primary rewrite will restore demand.
- At least one recovery portfolio passes the Click-Recovery Portfolio Gate before a production draft is created; otherwise the output is an explicit No-Go or a justified separate-page/rewrite hypothesis.
- Each passing opportunity includes query data, SERP/competitor evidence, an intervention mechanism, and a transparent incremental-click scenario.
- Recommendations preserve article focus and avoid bloat.
- Drafts are original and do not copy competitors.
- Rewrites include risk assessment.
- Draft edits are shown through `article-diff-md` unless the user explicitly asked for recommendations only.
- Production diffs use exact old article text and include the full `article-diff-md` artifact; focused drafts are labeled clearly and used only when the user explicitly requested them.
- Legal, protected-activity, safety, dismissal, and jurisdiction-sensitive edits reconcile conflicting current wording and use a justified risk label.
- Any claim about downloadable or editable asset formats was verified.
- Outline was updated after execution work, or a blocker/approval need is explicitly unresolved.
- Primary keyword support is explicit, even when the recovery path uses secondary keywords.
- People Also Ask and related-search ideas are used only when they fit the article's purpose.
- The broad secondary-opportunity universe was compared before a narrow recovery portfolio was selected.
- Rejected candidates, including SERP-derived hypotheses such as ROI or templates, have an explicit evidence-based reason rather than being silently omitted.

## What Not To Do

- Do not restart the diagnostic audit unless required evidence is missing.
- Do not skip Outline memory checks or final Outline update in production SEO refresh work.
- Do not treat Ahrefs as a SERP source.
- Do not ask the SERP sub-agent for strategy or edits.
- Do not blindly add sections for every secondary keyword.
- Do not narrow the audit to the first plausible secondary keyword or treat a prior shortlist as complete without a portfolio challenge.
- Do not return No-Go merely because one secondary cluster cannot replace all primary-query loss; assess the bounded recovery portfolio.
- Do not pass a cosmetic, low-risk, or compliance-complete refresh as a click-recovery strategy without a passing Click-Recovery Portfolio Gate.
- Do not recommend new headings, FAQs, or sections without an addressable query cluster, live SERP evidence, and an incremental-click mechanism.
- Do not bloat the article with generic SEO filler.
- Do not copy competitor language or reproduce distinctive structure.
- Do not show draft edits only as plain replacement text when the user asked for execution. Use `article-diff-md` for the draft-edit view.
- Do not present a focused advisory draft as a full production diff.
- Do not invent Word/PDF/downloadable/template-format claims.
- Do not claim a change will recover clicks with certainty. State expected help and why.
- Do not remove existing coverage without considering which GSC queries it may support.
