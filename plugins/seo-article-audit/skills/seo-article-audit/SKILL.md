---
name: seo-article-audit
description: >-
  Diagnose why a specific AIHR article declined in organic traffic and decide whether
  there is a viable SEO salvage strategy. Use when someone asks why an AIHR article has
  declined, whether it can be salvaged, what happened to traffic for a URL, or what primary
  or secondary keyword strategy to pursue. The workflow reads the article, checks prior
  Outline analysis, derives the primary keyword from the slug, pulls Ahrefs keyword difficulty
  and volume, delegates factual SERP analysis, pulls 6-month Google Search Console query
  comparisons for the exact page, identifies potential secondary keywords, and reports a
  human-in-the-loop strategy recommendation without suggesting article optimizations yet.
---

# SEO Article Audit

## Purpose

Answer this kind of prompt:

```text
The HR Generalist article has declined in traffic, why?
https://www.aihr.com/blog/hr-generalist/
And is there an opportunity to salvage it?
```

The output is a diagnostic strategy report, not an optimization plan. Stop after explaining the
decline, the keyword landscape, and the recommended strategy direction. Do not suggest rewrites,
new sections, FAQs, titles, briefs, or on-page optimizations until the human has reviewed and
discussed the strategy.

## Workflow Summary

1. Read the article and create a full-article artifact.
2. Inspect Outline for previous analysis of this article.
3. Derive the primary keyword from the slug.
4. Pull Ahrefs keyword difficulty and search volume for the primary keyword.
5. Delegate fact-only SERP analysis for the primary keyword.
6. Pull exact-page GSC query data for a 6-month comparison.
7. Identify potential secondary keyword candidates from GSC.
8. Pull Ahrefs difficulty/volume and SERP analysis for selected secondary keyword(s).
9. Decide the strategy direction and report back for human review.

## Guardrails

- Stop at strategy. Do not provide article optimizations yet.
- Separate data gathering from interpretation.
- Treat `serp-analysis` outputs as fact-only evidence. The main auditor owns interpretation.
- If data is unavailable, continue with the remaining evidence and state the gap.
- Do not overfit to one metric. Use article content, Ahrefs, SERP facts, and GSC together.
- Be explicit about what is observed vs inferred.

## 1. Normalize The URL

- Must be an AIHR URL under `https://www.aihr.com/`.
- If the user gives a path such as `/blog/hr-generalist/`, prepend `https://www.aihr.com`.
- Ensure exactly one trailing slash.
- Slug is the last non-empty path segment, e.g. `hr-generalist`.

## 2. Read The Article And Create A Full-Article Artifact

Read the current article before interpreting performance.

Create a Markdown artifact named:

```text
seo-article-audit-<slug>-full-article.md
```

The artifact should contain only the full article content:

```text
Title/H1
Full article body
```

Do not put audit notes, metadata summaries, GSC data, Ahrefs data, SERP findings, or strategy
comments in this artifact. It is a clean copy of the article only, used as source context.

## 3. Inspect Outline For Prior Analysis

Use the bundled `outline-article-refresh-memory` skill before producing conclusions. Check whether
there is a previous monthly record for the article slug or a closely related record.

If prior analysis exists, summarize only the relevant facts:

```text
Prior record title/date
What was previously diagnosed
What strategy or work was previously recommended
Any attached files or notes that matter for this audit
```

If none exists, say no prior Outline analysis was found.

## 4. Determine The Primary Keyword

Start from the slug and convert it into a natural keyword:

```text
hr-generalist -> hr generalist
```

Use this as the primary keyword unless GSC or the article itself strongly indicates that the page is
clearly targeting a different head term. If changing the primary keyword candidate at this stage,
explain why and keep the slug-derived keyword as a checked alternative.

## 5. Pull Ahrefs Data For The Primary Keyword

Use Ahrefs to get keyword-level facts for the primary keyword in the US:

```text
keyword difficulty
search volume
```

Interpretation thresholds:

```text
Keyword difficulty 25+ = hard.
Search volume 200+ = attractive.
For B2B HR topics, search volume 30+ can still be meaningful.
```

These are heuristics, not absolute rules. A lower-volume B2B keyword can still be viable if intent is
strong and SERP fit is realistic.

## 6. Delegate Primary Keyword SERP Analysis

Use the bundled `serp-analysis` skill as the contract for a fact-only sub-agent task when sub-agents
are available.

Pass only:

```text
keyword
keyword role: primary
market: US
Ahrefs keyword facts already gathered
required screenshot filename/path
```

Do not ask the SERP sub-agent to read the AIHR article or recommend optimizations. It should return
observed search intent, exact People Also Ask questions, exact related searches / people-also-search-for
queries, organic result links, SERP modules, ads, AI Overview facts, caveats, and screenshot path.

If sub-agents are not available, run the `serp-analysis` workflow directly and keep the same fact-only
boundary.

## 7. Pull GSC Exact-Page Query Data

Call the GSC MCP tool for the exact normalized page URL.

Use a 6-month comparison:

```text
current 6 months vs previous 6 months
country: US
dimensions: query, page
metrics: clicks, impressions, average position, CTR
```

For the exact page, identify:

```text
Total clicks: current vs previous
Total impressions: current vs previous
Average CTR: current vs previous
Average position: current vs previous
Queries that currently bring clicks
Queries that previously brought clicks
Queries with the largest click losses
Queries with large impression volume but weak CTR
Queries with average positions near striking distance, especially positions 4-20
Queries where rankings dropped materially
Queries where impressions changed materially
```

Keep raw query facts separate from interpretation.

## 8. Determine Potential Secondary Keywords

Select secondary keyword candidates from GSC query data. Prioritize candidates that have at least one
of these signals:

```text
Meaningful current or previous clicks
High or growing impressions
Average position in or near striking distance
Clear relevance to the article topic
Distinct intent from the primary keyword
Potential to explain the decline or salvage opportunity
```

Do not select a secondary keyword just because it has high impressions. It must be relevant and have
some realistic path to useful traffic.

For selected secondary keyword candidates, repeat the keyword checks:

```text
Ahrefs keyword difficulty
Ahrefs search volume
Fact-only SERP analysis through `serp-analysis`
```

It is acceptable to analyze one strong secondary keyword first. Analyze more only when the GSC data
shows multiple plausible directions.

## 9. Determine Strategy Direction

Use all evidence to choose one of these strategy directions:

```text
Double down on the primary keyword.
Switch the primary keyword only if intent has changed and another keyword has a better opportunity.
Keep the primary keyword, but double down on secondary keywords.
Deprioritize or stop investing if the SERP and demand no longer support a realistic salvage path.
```

Strategy criteria:

- Primary keyword viability depends on observed search intent, Ahrefs difficulty/volume, SERP
  composition, AI Overview pressure, competing page types, and GSC evidence.
- Secondary keyword viability depends on GSC query evidence, Ahrefs difficulty/volume, SERP facts,
  and relevance to the article's current or plausible scope.
- A strategy can be mixed, e.g. keep the primary keyword while using secondary keywords as the
  traffic recovery path.

Do not suggest concrete optimizations yet.

## Final Output

Return a Markdown strategy report with these sections:

```text
Article Reviewed
Prior Analysis Checked
Traffic Decline Summary
Primary Keyword Facts
Primary SERP Facts
GSC Query Findings
Secondary Keyword Candidates
Secondary SERP Facts
Strategy Recommendation
Why This Strategy
Open Questions For Human Review
Artifacts
```

The final report should answer:

```text
Why did the article decline?
Is the primary keyword still viable?
Is there a better secondary keyword opportunity?
Is there an opportunity to salvage the article?
Which strategy should we discuss before optimization work begins?
```

End by asking the human to confirm or challenge the strategy before any optimization plan is created.

## What Not To Do

- Do not produce a rewrite plan.
- Do not suggest headings, FAQs, title tags, meta descriptions, images, or content additions.
- Do not create final article diffs.
- Do not treat the SERP sub-agent as an article strategist.
- Do not skip reading the article.
- Do not skip GSC if the question is about traffic decline.
