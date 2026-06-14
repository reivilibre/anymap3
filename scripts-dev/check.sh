#!/usr/bin/env bash
set -euo pipefail

run_cmd() {
    local cmd="$1"
    echo "Running: $cmd"
    local output
    if output=$(eval "$cmd" 2>&1); then
        return 0
    else
        local exit_code=$?
        echo "✗ Failed: $cmd"
        echo "$output"
        exit "$exit_code"
    fi
}

run_cmd "cargo clippy --all-targets --all-features --fix --allow-dirty --allow-staged -- -D warnings"
run_cmd "cargo fmt"
run_cmd "cargo test"

echo "All checks passed!"
