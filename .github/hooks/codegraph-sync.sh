#!/usr/bin/env bash
set -euo pipefail

input_json="$(cat)"
tool_name_pattern='"tool_name"[[:space:]]*:[[:space:]]*"([^"]+)"'

if [[ "$input_json" =~ $tool_name_pattern ]]; then
    tool_name="${BASH_REMATCH[1]}"
else
    exit 0
fi

if [[ ! "$tool_name" =~ ^(write_.*|replace.*|create_file|apply_patch)$ ]]; then
    exit 0
fi

codegraph sync -q
