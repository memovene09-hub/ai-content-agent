# tools/render-slide.ps1
# Renderiza un archivo HTML a PNG usando Edge/Chrome headless.
# Uso:
#   .\tools\render-slide.ps1 -HtmlPath templates/carousel/slide2-punto.html -OutputPath carruseles/carrusel-2/slide2.png
#   .\tools\render-slide.ps1 -HtmlPath ...  -OutputPath ...  -Width 1080  -Height 1080

param(
    [Parameter(Mandatory=$true)][string]$HtmlPath,
    [Parameter(Mandatory=$true)][string]$OutputPath,
    [int]$Width = 1080,
    [int]$Height = 1080,
    [int]$WaitMs = 4000
)

$ErrorActionPreference = 'Stop'

# 1) Localizar un navegador disponible (Edge primero — viene con Windows 11)
$candidates = @(
    "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe",
    "C:\Program Files\Microsoft\Edge\Application\msedge.exe",
    "C:\Program Files\Google\Chrome\Application\chrome.exe",
    "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe",
    "$env:LOCALAPPDATA\Google\Chrome\Application\chrome.exe"
)
$browser = $null
foreach ($c in $candidates) {
    if (Test-Path $c) { $browser = $c; break }
}
if (-not $browser) {
    Write-Error "No se encontró Edge ni Chrome. Instala uno para poder renderizar slides."
    exit 1
}

# 2) Resolver rutas absolutas
if (-not (Test-Path $HtmlPath)) {
    Write-Error "HTML no encontrado: $HtmlPath"
    exit 1
}
$htmlAbs = (Resolve-Path $HtmlPath).Path

# OutputPath puede no existir todavía
$outAbs = $OutputPath
if (-not [System.IO.Path]::IsPathRooted($outAbs)) {
    $outAbs = Join-Path (Get-Location) $OutputPath
}
$outDir = Split-Path $outAbs -Parent
if ($outDir -and -not (Test-Path $outDir)) {
    New-Item -ItemType Directory -Path $outDir -Force | Out-Null
}

# 3) Convertir a file:// URL
$fileUrl = "file:///" + ($htmlAbs -replace '\\','/')

# 4) Lanzar headless con virtual-time-budget para esperar fuentes web
$args = @(
    "--headless=new",
    "--disable-gpu",
    "--hide-scrollbars",
    "--no-sandbox",
    "--default-background-color=00000000",
    "--force-device-scale-factor=1",
    "--window-size=$Width,$Height",
    "--virtual-time-budget=$WaitMs",
    "--screenshot=$outAbs",
    $fileUrl
)

# Crear user-data-dir temporal único por llamada para evitar conflictos
$tmpProfile = Join-Path $env:TEMP ("claryon-render-" + [System.Guid]::NewGuid().ToString('N'))
$args = @("--user-data-dir=$tmpProfile") + $args

try {
    $proc = Start-Process -FilePath $browser -ArgumentList $args -NoNewWindow -Wait -PassThru
    if ($proc.ExitCode -ne 0 -and -not (Test-Path $outAbs)) {
        Write-Error "Render falló (exit=$($proc.ExitCode))."
        exit 1
    }
} finally {
    if (Test-Path $tmpProfile) {
        Remove-Item -Recurse -Force $tmpProfile -ErrorAction SilentlyContinue
    }
}

if (Test-Path $outAbs) {
    Write-Host "OK: $outAbs"
    exit 0
} else {
    Write-Error "No se generó el archivo: $outAbs"
    exit 1
}
