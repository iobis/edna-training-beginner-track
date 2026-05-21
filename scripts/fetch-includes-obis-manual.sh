#!/usr/bin/env bash
set -euo pipefail

mkdir -p _includes/obis-manual

BASE="https://raw.githubusercontent.com/iobis/manual/master"

FILES=(
  dna_data.md
  checklist.md
)

for f in "${FILES[@]}"; do
  wget -q -O "_includes/$f" "$BASE/$f"
done