#!/bin/sh
set -e
dir="${1:-linux}"
git clone https://github.com/torvalds/linux.git "$dir"
cd "$dir"
git checkout v7.3
commit=$(git rev-parse HEAD)
expected=c03c1a14507dfaf8b856c2608f9ac216021fc222
if [ "$commit" != "$expected" ]; then
  echo "ERROR: upstream commit mismatch: got $commit expected $expected" >&2
  exit 1
fi
echo "Verified Linux v7.3 at $commit"
