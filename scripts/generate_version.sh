#!/bin/sh
set -eu

PROJECT_DIR="$(git rev-parse --show-toplevel)"
OUTPUT_FILE="${PROJECT_DIR}/version.go"

cat > "$OUTPUT_FILE" <<EOF
package main

// nolint: goimports
// autogenerated by $(basename "$0") on $(date -Ru)

const version = "$(git describe --long --always) ($(go version)) [$(date -Ru)]"
EOF
