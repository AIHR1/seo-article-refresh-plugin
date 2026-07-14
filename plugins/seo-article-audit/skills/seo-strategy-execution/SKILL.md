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

## Required Inputs

Start with the best available evidence:

- AIHR article URL and current article content.
- The prior `seo-article-audit` strategy report, when available.
- GSC query findings for the exact page, especially current/previous clicks, impressions, CTR, position, and query losses.
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

If fresh evidence contradicts the prior strategy, say so and explain the contradiction before drafting edits.

### 3. Read The Article For Coverage And Bloat

Review the current article before suggesting changes. Map the article by section:

- What each section currently covers.
- Which keyword or intent it supports.
- Which GSC/SERP opportunity it already addresses.
- Which sections are thin, outdated, redundant, off-intent, or overly long.

Prefer tightening, rewriting, or consolidating existing sections before adding new sections. Add new content only when the opportunity is clear and not already covered.

### 4. Refresh SERP And Competitor Evidence

For every keyword you actively target:

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

Create a prioritized list of changes. Each change must state:

- Action type: add, rewrite, tighten, consolidate, remove, change heading, update intro, add example, add table, add FAQ, improve internal transition, or adjust snippet-facing copy.
- Target location in the article.
- Target keyword(s).
- Click-recovery rationale.
- How it supports the primary keyword.
- Secondary keyword and People Also Search For / related-search mapping, when relevant.
- SERP or competitor evidence used.
- Bloat control decision.
- Rewrite risk assessment.

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

Use the smallest effective edit format:

- Section-level replacement copy for rewrites.
- New paragraph copy for additions.
- Old heading -> new heading for heading changes.
- Remove/consolidate notes for cuts.
- A pre-marked diff for changed article sections, then use `article-diff-md` to show the draft edits as a single red/green diff-block artifact.

Drafts must be concise, useful, and non-duplicative. Avoid expanding the article by default. If the article grows, explain why the added content is worth the extra length.

Production diffs must use exact old text from the current article. If you cannot match the exact old text, label the draft as advisory and do not present it as a production-ready patch.

Focused changed-section diffs are allowed only when the user explicitly asks for focused draft edits. Label them clearly. For final delivery, prefer the full `article-diff-md` article artifact unless the user requests a focused diff.

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
- Recommendations preserve article focus and avoid bloat.
- Drafts are original and do not copy competitors.
- Rewrites include risk assessment.
- Draft edits are shown through `article-diff-md` unless the user explicitly asked for recommendations only.
- Production diffs use exact old article text; focused drafts are labeled clearly when the user explicitly requested them.
- Any claim about downloadable or editable asset formats was verified.
- Outline was updated after execution work, or a blocker/approval need is explicitly unresolved.
- Primary keyword support is explicit, even when the recovery path uses secondary keywords.
- People Also Ask and related-search ideas are used only when they fit the article's purpose.

## What Not To Do

- Do not restart the diagnostic audit unless required evidence is missing.
- Do not skip Outline memory checks or final Outline update in production SEO refresh work.
- Do not treat Ahrefs as a SERP source.
- Do not ask the SERP sub-agent for strategy or edits.
- Do not blindly add sections for every secondary keyword.
- Do not bloat the article with generic SEO filler.
- Do not copy competitor language or reproduce distinctive structure.
- Do not show draft edits only as plain replacement text when the user asked for execution. Use `article-diff-md` for the draft-edit view.
- Do not present a focused advisory draft as a full production diff.
- Do not invent Word/PDF/downloadable/template-format claims.
- Do not claim a change will recover clicks with certainty. State expected help and why.
- Do not remove existing coverage without considering which GSC queries it may support.
