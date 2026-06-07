# tools/build-compiled.ps1
# Ensambla CLAUDE.md + MODES.json + skills + engines + prompts + brands en compiled.json.
# Uso (desde la raíz del repo):  .\tools\build-compiled.ps1
# Convención: NUNCA editar compiled.json a mano. Esto lo regenera.

param(
    [string]$RepoRoot = (Get-Location).Path,
    [string]$OutFile  = "compiled.json"
)

$ErrorActionPreference = 'Stop'

function Read-Text([string]$rel) {
    return [System.IO.File]::ReadAllText((Join-Path $RepoRoot $rel))
}

function Read-Json([string]$rel) {
    return (Read-Text $rel) | ConvertFrom-Json
}

$compiled = [ordered]@{
    version       = "0.2.0"
    generated_at  = (Get-Date).ToString("o")
    model         = "claude-haiku-4-5-20251001"
    system_prompt = Read-Text "CLAUDE.md"
    modes         = (Read-Json "MODES.json").modes
    global        = (Read-Json "MODES.json").global
    skills        = [ordered]@{}
    engines       = [ordered]@{}
    prompts       = [ordered]@{}
    brands        = [ordered]@{}
}

# Skills (markdown)
Get-ChildItem (Join-Path $RepoRoot "skills") -Filter "*.md" | Sort-Object Name | ForEach-Object {
    $compiled.skills[$_.BaseName] = [System.IO.File]::ReadAllText($_.FullName)
}

# Engines (markdown)
Get-ChildItem (Join-Path $RepoRoot "engines") -Filter "*.md" | Sort-Object Name | ForEach-Object {
    $compiled.engines[$_.BaseName] = [System.IO.File]::ReadAllText($_.FullName)
}

# Prompts (markdown)
Get-ChildItem (Join-Path $RepoRoot "prompts") -Filter "*.md" | Sort-Object Name | ForEach-Object {
    $compiled.prompts[$_.BaseName] = [System.IO.File]::ReadAllText($_.FullName)
}

# Brands — cada subcarpeta de brands/
Get-ChildItem (Join-Path $RepoRoot "brands") -Directory | Sort-Object Name | ForEach-Object {
    $client = $_.Name
    $brandPath = $_.FullName
    $compiled.brands[$client] = [ordered]@{
        identity_md        = [System.IO.File]::ReadAllText((Join-Path $brandPath "identity.md"))
        elements           = ([System.IO.File]::ReadAllText((Join-Path $brandPath "elements.json")) | ConvertFrom-Json)
        formats_md         = [System.IO.File]::ReadAllText((Join-Path $brandPath "formats.md"))
        successful_prompts = ([System.IO.File]::ReadAllText((Join-Path $brandPath "successful-prompts.json")) | ConvertFrom-Json)
    }
}

# Serializar y escribir sin BOM
$json = $compiled | ConvertTo-Json -Depth 100
$outPath = Join-Path $RepoRoot $OutFile
[System.IO.File]::WriteAllText($outPath, $json, [System.Text.UTF8Encoding]::new($false))

Write-Host "compiled.json regenerado: $outPath ($($json.Length) chars, $($compiled.skills.Keys.Count) skills, $($compiled.brands.Keys.Count) brands)"
