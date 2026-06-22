# SEO Article Audit Plugin

Codex/Claude plugin for auditing AIHR article search performance.

The plugin bundles two skills:

- `seo-article-audit`: pulls Google Search Console query data for an AIHR article, combines it with Ahrefs keyword and content-gap data, and produces a static Excel workbook plus Markdown analysis.
- `article-diff-md`: formats pre-marked article edits into one GitHub-style red/green Markdown diff block.

## Contents

- `.codex-plugin/plugin.json` - Codex plugin manifest.
- `.claude-plugin/plugin.json` - Claude plugin manifest.
- `.mcp.json` - MCP server configuration for the local GSC bridge and Ahrefs MCP endpoint.
- `bin/seo-article-audit-server` - executable wrapper for the local stdio MCP server.
- `servers/seo_article_audit_server.py` - stdio MCP server that fetches GSC reports from AIHR's GSC API.
- `skills/` - plugin skill instructions and helper scripts.

## Requirements

- Python 3.
- Network access to `https://aihr-gsc-api.vercel.app`.
- Access to the Ahrefs MCP server configured in `.mcp.json` when running the full audit workflow.

## Local Check

From this folder, the local MCP server should respond to initialization and tool listing:

```sh
printf '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{}}\n{"jsonrpc":"2.0","id":2,"method":"tools/list","params":{}}\n' | ./bin/seo-article-audit-server
```

## License

Proprietary. Public visibility of this repository does not grant an open-source license.
