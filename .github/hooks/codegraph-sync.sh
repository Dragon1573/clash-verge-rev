#!/usr/bin/env bash
set -euo pipefail

input_json="$(cat)"
tool_name_pattern='"toolName"[[:space:]]*:[[:space:]]*"([^"]+)"'

if [[ "$input_json" =~ $tool_name_pattern ]]; then
    tool_name="${BASH_REMATCH[1]}"
else
    exit 0
fi

if [[ ! "$tool_name" =~ ^(write_.*|replace.*|create_file|create|edit|str_replace_editor|apply_patch)$ ]]; then
    exit 0
fi

codegraph sync -q
