#!/usr/bin/env bash
set -euo pipefail

mkdir -p _includes/obis-manual

BASE="https://raw.githubusercontent.com/iobis/manual/master"

FILES=(
  dna_data.md
  checklist.md
)

for f in "${FILES[@]}"; do
  curl -fsSL -o "_includes/obis-manual/$f" "$BASE/$f"
done

# Make R chunks fail soft: render errors inline instead of halting the build.
# This is because fetched files may reference paths/resources that exist only
# in the source repo (iobis/manual).
for f in "${FILES[@]}"; do
  sed -i.bak -E 's/^(```\{r[^}]*)\}/\1, error=TRUE, warning=TRUE\}/' \
    "_includes/obis-manual/$f"
  rm "_includes/obis-manual/$f.bak"
done