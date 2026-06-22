#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PLUGIN_SRC="$ROOT/plugins/seo-article-audit"
OUT_DIR="${1:-$ROOT/..}"
STAGING="$(mktemp -d)"

cleanup() {
  rm -rf "$STAGING"
}
trap cleanup EXIT

cp -R "$PLUGIN_SRC/.claude-plugin" "$STAGING/"
cp "$PLUGIN_SRC/.mcp.json" "$STAGING/"
cp -R "$PLUGIN_SRC/skills" "$STAGING/"

(
  cd "$STAGING"
  zip -r -0 -X "$OUT_DIR/seo-article-audit.plugin" .
  cp "$OUT_DIR/seo-article-audit.plugin" "$OUT_DIR/seo-article-audit.zip"
)

echo "Wrote:"
echo "  $OUT_DIR/seo-article-audit.plugin"
echo "  $OUT_DIR/seo-article-audit.zip"
