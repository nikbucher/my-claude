#!/bin/bash
# Pfadfinder Rebase Script
# Rebase den Pfadfinder-Branch auf den Implementierungs-Branch
#
# Verwendung:
#   rebase.sh [impl-branch] [target-branch]

set -e

impl_branch="${1:-feature/inventory-upload}"
target_branch="${2:-dev/nik--inventory-upload}"

echo "═══════════════════════════════════════════════════════════"
echo "Pfadfinder Rebase: $impl_branch → $target_branch"
echo "═══════════════════════════════════════════════════════════"

echo ""
echo "→ Rebasing $target_branch onto $impl_branch..."
if git rebase -X theirs "$impl_branch" "$target_branch"; then
    echo "✓ Rebase erfolgreich"
else
    echo "✗ Rebase fehlgeschlagen - bitte manuell lösen"
    exit 1
fi

echo ""
echo "→ Checkout $impl_branch..."
git checkout "$impl_branch"

echo ""
echo "→ Verbleibender Diff:"
git diff --stat "$impl_branch" "$target_branch"

remaining=$(git diff --stat "$impl_branch" "$target_branch" | tail -1)
echo ""
echo "═══════════════════════════════════════════════════════════"
echo "Status: $remaining"
echo "═══════════════════════════════════════════════════════════"
