#!/usr/bin/env bash
# Lint script for local development
# Runs the same checks as the CI workflow

set -e

echo "🔍 Running linting checks..."
echo ""

# Check if tools are installed
check_tool() {
    if ! command -v "$1" &> /dev/null; then
        echo "❌ $1 is not installed. Please install it first."
        echo "   Run: npm install -g $2"
        return 1
    fi
    return 0
}

# Function to run a check
run_check() {
    local name="$1"
    local command="$2"
    
    echo "📋 $name..."
    if eval "$command"; then
        echo "✅ $name passed"
    else
        echo "❌ $name failed"
        return 1
    fi
    echo ""
}

# Track overall status
FAILED=0

# Check tool availability
echo "Checking for required tools..."
check_tool "markdownlint-cli2" "markdownlint-cli2" || FAILED=1
check_tool "cspell" "cspell" || FAILED=1
check_tool "prettier" "prettier" || FAILED=1

if [ $FAILED -eq 1 ]; then
    echo ""
    echo "💡 Install all tools at once with:"
    echo "   npm run install-tools"
    echo ""
    exit 1
fi

echo "✅ All tools installed"
echo ""

# Run linting checks
run_check "Markdown Lint" "markdownlint-cli2 '**/*.md' '#node_modules'" || FAILED=1
run_check "Spell Check" "cspell '**/*.md' --no-progress" || FAILED=1
run_check "Format Check" "prettier --check '**/*.{md,yml,yaml,json}'" || FAILED=1

# Link check is optional (requires Rust/Cargo)
if command -v lychee &> /dev/null; then
    run_check "Link Check" "lychee --verbose --no-progress '**/*.md'" || echo "⚠️  Link check had issues (non-critical)"
else
    echo "ℹ️  Link check skipped (lychee not installed)"
fi

echo ""
if [ $FAILED -eq 0 ]; then
    echo "✨ All checks passed!"
    exit 0
else
    echo "❌ Some checks failed. Please fix the issues above."
    exit 1
fi

