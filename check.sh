#!/bin/sh
# Fails if this repository holds anything it should not: a file outside the list below, or a secret (gitleaks).
# Run by the pre-commit hook and by the check on GitHub. Everything here is generated from the private source by
# its publish script; add a path here only when that script starts publishing it.
set -eu
cd "$(dirname "$0")"
allowed='^(README\.md|LICENSE|check\.sh|\.gitignore|server\.json|plugin\.json|mcp\.json|assets/logo\.png|skills/wordofagent/SKILL\.md|\.githooks/pre-commit|\.github/workflows/check\.yml)$'
files=$(if [ "${1:-}" = --staged ]; then git diff --cached --name-only --diff-filter=ACMR; else git ls-files; fi)
bad=$(printf '%s\n' "$files" | grep -Ev "$allowed" | grep -v '^$' || true)
if [ -n "$bad" ]; then
  printf 'Not allowed in this public repository:\n%s\n' "$bad" >&2
  exit 1
fi
if [ "${1:-}" = --staged ]; then gitleaks git --pre-commit --staged --redact --no-banner; else gitleaks git --redact --no-banner; fi
