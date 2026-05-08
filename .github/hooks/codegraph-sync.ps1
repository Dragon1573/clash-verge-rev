$inputJson = [Console]::In.ReadToEnd()
$hookInput = $inputJson | ConvertFrom-Json

if ($hookInput.tool_name -notmatch '^(write_.*|replace.*|create_file|apply_patch)$') {
    exit 0
}

codegraph.ps1 sync -q
