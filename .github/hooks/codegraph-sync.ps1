$inputJson = [Console]::In.ReadToEnd()
$hookInput = $inputJson | ConvertFrom-Json

if ($hookInput.toolName -notmatch '^(write_.*|replace.*|create_file|create|edit|str_replace_editor|apply_patch)$') {
    exit 0
}

codegraph.ps1 sync -q
