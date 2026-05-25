#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

timestamp="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
token="$(LC_ALL=C tr -dc 'a-z0-9' </dev/urandom | head -c 8)"

printf '%s public dumb push %s\n' "$timestamp" "$token" >> dumb-log.txt

git add dumb-log.txt
git commit -m "dumb public push ${timestamp}"
git push origin HEAD

