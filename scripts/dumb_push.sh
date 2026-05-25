#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

timestamp="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
if command -v uuidgen >/dev/null 2>&1; then
  uuid="$(uuidgen)"
  token="${uuid%%-*}"
else
  token="$(date -u +"%s")"
fi

printf '%s public dumb push %s\n' "$timestamp" "$token" >> dumb-log.txt

git add dumb-log.txt
git commit -m "dumb public push ${timestamp}"
git push origin HEAD
