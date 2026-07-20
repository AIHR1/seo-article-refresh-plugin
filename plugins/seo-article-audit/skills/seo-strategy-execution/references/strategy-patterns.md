# SEO Strategy Pattern Reference

Use this reference to improve strategic reasoning before recommending article changes. It is a thinking vocabulary, not a compliance checklist. The goal is to help the model recognize the searcher's job, the format Google is rewarding, and the editorial move most likely to create useful click recovery.

## Intent Archetypes

| Archetype | Searcher job | Usually winning format | Common weak SEO move |
| --- | --- | --- | --- |
| Definition | Understand what a concept means and where its boundaries are. | Direct definition, boundaries, examples, and concise caveats near the top. | Rewrite the intro without improving the answer or differentiating from the AI Overview. |
| Template | Get a usable artifact to copy, adapt, or download. | Copyable template, worked example, field-by-field guidance, and usage notes. | Add a keyword heading that promises a template but only gives general advice. |
| Examples | See concrete cases and pattern recognition. | Numbered examples, scenario table, before/after examples, and practical interpretation. | Add more generic examples without making them easier to scan or apply. |
| Tools / software | Choose or shortlist platforms, categories, or evaluation criteria. | Tool-category table, use-case matching, selection criteria, and buying cautions. | List vendors or repeat "best tools" language without helping the reader choose. |
| Comparison | Decide between two concepts, roles, methods, or tools. | Difference table, when-to-use guidance, overlap, and decision rules. | Treat the terms as synonyms or bury the distinction in prose. |
| ROI / business case | Justify investment, estimate value, or explain benefits in financial terms. | Formula, input list, example calculation, benefits-to-metrics mapping, and caveats. | Add a standalone ROI heading without volume, GSC, or article-scope evidence. |
| Process / how-to | Complete a workflow or implementation sequence. | Step-by-step sequence, checklist, owner/system mapping, and common failure points. | Add vague best practices that do not change what the reader can do next. |
| Legal / risk-sensitive | Understand obligations, boundaries, and safe handling without overclaiming. | Jurisdiction-aware caveats, conditional language, risk boundaries, and when to seek expert review. | Give definitive legal or dismissal advice, or leave conflicting caveats side by side. |
| Career / role | Understand a job, skill, salary, path, or requirement. | Role definition, responsibilities, salary/context caveats, skills, and next-step guidance. | Add broad career advice without matching the exact career-intent query. |

## Strategic Levers

Use the smallest lever that matches the evidence and the searcher's job. A good lever changes article usefulness, not just keyword density.

| Lever | Use when | Strong move | Avoid |
| --- | --- | --- | --- |
| Make the promised format real | The article promises a template, example, tool, checklist, or worksheet but does not deliver it. | Add the actual copyable artifact or worked format under the promised heading. | Renaming the heading while leaving the format thin. |
| Surface buried value | The article already contains the answer but it is hard to find or not snippet-friendly. | Move or summarize it in a table, short definition, checklist, or lead-in. | Adding duplicate content elsewhere. |
| Split confused concepts | The SERP or GSC shows adjacent terms with distinct jobs. | Add a concise distinction and when-to-use table. | Overexpanding into a separate glossary article without evidence. |
| Build decision support | The query is tools, software, vendor, ROI, or selection-led. | Add criteria, fit-by-use-case, tradeoffs, and business-case guidance. | Vendor list bloat or unsupported "best" claims. |
| Add operational sequence | The query is "how to", process, implementation, or workflow-led. | Add steps, owners, inputs/outputs, systems, and failure points. | Generic best practices that do not help execution. |
| Protect primary intent while targeting secondary | The primary query is demand-constrained or SERP-compressed, but secondary clusters have gaps. | Keep primary coverage stable and add the secondary format in the relevant section. | Repositioning the whole article around a smaller secondary. |
| Tighten for answer competition | AI Overview or snippets answer the basics above the organic results. | Make the top answer sharper and add unique practical value below it. | Only rewriting the first paragraph and calling it recovery. |
| Create a separate asset | The secondary intent is materially different and useful but would bloat or distort the current page. | Recommend a separate page/template/tool with cannibalization and internal-link implications. | Creating a separate page for a tiny cluster without enough demand or differentiation. |
| Stop or deprioritize | No addressable query cluster has a useful format/content gap. | Say why a refresh is not a good click-recovery bet and name the missing evidence. | Publishing a cosmetic refresh to satisfy the process. |

## Gold-Standard Reasoning Examples

### Template intent: insubordination write-up

Weak reasoning:

```text
The primary keyword lost clicks, so rewrite the definition and add a small FAQ.
```

Better reasoning:

```text
The primary definition query appears demand-constrained, but the article has a separate template-led cluster around "insubordination write up". The article also promises a write-up template and does not provide one. The right move is not another definition rewrite; it is to make the promised template real with a copyable write-up format, while preserving the definition section and legal cautions.
```

Strategic lever: Make the promised format real.

### Tools/software intent: HR automation

Weak reasoning:

```text
Add a section for HR workflow automation because it has impressions and the topic fits.
```

Better reasoning:

```text
The page touches several secondary jobs: software selection, workflow design, implementation, and ROI. A single workflow section is too narrow. The stronger portfolio is to add decision support for software/tools, clarify process vs workflow automation, make implementation steps more actionable, and connect benefits to ROI without creating a standalone ROI detour.
```

Strategic levers: Build decision support, split confused concepts, add operational sequence, surface buried value.

### Definition intent under AI Overview pressure

Weak reasoning:

```text
Improve the definition because the primary keyword lost clicks.
```

Better reasoning:

```text
If impressions fell while position improved, the loss may be demand-constrained or SERP-compressed. A sharper definition may help CTR, but it is not a full recovery strategy unless the incremental-click scenario is material. Look for secondary jobs with real gaps before recommending a production diff.
```

Strategic levers: Tighten for answer competition, protect primary intent while targeting secondary, or stop/deprioritize.

## Strategic Framing Prompt

Before choosing recommendations, answer this framing for each serious opportunity. The final report may show it directly or compress it into the opportunity table.

```text
Searcher job:
Intent archetype:
SERP-winning format:
Current article promise:
Current article delivery:
Best strategic lever:
Mediocre SEO move to avoid:
Recommended move:
Why this can recover clicks:
What primary coverage must be preserved:
```

Use the "mediocre SEO move to avoid" line to force strategic contrast. If the answer is only "add an H2", "mention the keyword", "add FAQs", or "make copy clearer", the strategy is probably too shallow unless the evidence shows a specific click-recovery mechanism.

## Strategy Quality Heuristics

- Prefer a useful artifact, table, checklist, example, or decision aid over a keyword-only heading.
- Treat a small, high-intent format gap as more strategically valuable than a broad keyword with collapsed demand.
- Do not let low keyword difficulty outweigh stronger GSC click evidence.
- Do not let a secondary keyword distort the article's primary job.
- When the article already answers the query, improve findability or compression before adding length.
- When the SERP rewards templates, tools, images, examples, or comparison tables, decide whether AIHR should supply that format or explicitly avoid the intent.
- A recommendation is strategically strong when a human editor can see exactly why the change helps the searcher, not only why it may help SEO.
