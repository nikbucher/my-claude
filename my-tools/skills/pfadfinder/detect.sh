#!/bin/bash
# Findet Branches die genau 1 Commit ahead sind (potentielle Pfadfinder)

git for-each-ref --format='%(refname:short)' refs/heads | while read b; do
  [ "$(git rev-list --count HEAD..$b 2>/dev/null)" = "1" ] && echo "$b"
done
