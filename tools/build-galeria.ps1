# tools/build-galeria.ps1
# Genera una galería HTML AUTOCONTENIDA (imágenes embebidas en base64) de las
# piezas aprobadas de una marca, lista para compartir como un solo archivo.
# Uso:  .\tools\build-galeria.ps1 -Brand bites
# Salida: outputs/{brand}/galeria-{brand}.html

param(
    [string]$Brand = "bites",
    [string]$RepoRoot = (Get-Location).Path
)

$ErrorActionPreference = 'Stop'

$srcDir = Join-Path $RepoRoot "outputs/$Brand/aprobadas"
if (-not (Test-Path $srcDir)) { Write-Error "No existe $srcDir"; exit 1 }

$files = Get-ChildItem $srcDir -File |
    Where-Object { $_.Extension -match '\.(png|jpe?g|webp)$' } |
    Sort-Object Name
if ($files.Count -eq 0) { Write-Error "No hay imágenes aprobadas en $srcDir"; exit 1 }

function Get-Mime([string]$ext) {
    switch ($ext.ToLower()) {
        ".png"  { "image/png" }
        ".jpg"  { "image/jpeg" }
        ".jpeg" { "image/jpeg" }
        ".webp" { "image/webp" }
        default { "application/octet-stream" }
    }
}

function Get-Title([string]$name) {
    $t = [System.IO.Path]::GetFileNameWithoutExtension($name)
    $t = $t -replace '[-_]', ' '
    return (Get-Culture).TextInfo.ToTitleCase($t.ToLower())
}

# Construir array JS con cada imagen (base64 una sola vez)
$entries = @()
foreach ($f in $files) {
    $bytes  = [System.IO.File]::ReadAllBytes($f.FullName)
    $b64    = [System.Convert]::ToBase64String($bytes)
    $mime   = Get-Mime $f.Extension
    $title  = (Get-Title $f.Name) -replace "'", "\'"
    $fname  = $f.Name -replace "'", "\'"
    $entries += "{name:'$fname',title:'$title',data:'data:$mime;base64,$b64'}"
}
$jsArray = $entries -join ",`n"

$brandTitle = (Get-Culture).TextInfo.ToTitleCase($Brand)
$count = $files.Count

$html = @"
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>$brandTitle — Contenido Generado</title>
<style>
  *,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
  body{background:#fafafa;color:#1a1a1a;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Helvetica,Arial,sans-serif;padding:0 0 80px}
  header{background:#fff;border-bottom:3px solid #E2342B;padding:28px 40px;display:flex;align-items:center;justify-content:space-between;flex-wrap:wrap;gap:16px;position:sticky;top:0;z-index:10}
  .brand{display:flex;align-items:baseline;gap:12px}
  .brand h1{font-size:26px;font-weight:800;letter-spacing:-.5px}
  .brand .b{color:#E2342B}.brand .s{color:#FBC219}
  .brand .sub{font-size:12px;color:#888;font-weight:600;letter-spacing:2px;text-transform:uppercase}
  .meta{font-size:13px;color:#888}
  .dl-all{background:#E2342B;color:#fff;border:none;font-size:13px;font-weight:700;letter-spacing:.5px;padding:11px 20px;border-radius:9px;cursor:pointer;transition:background .15s}
  .dl-all:hover{background:#b91c1c}
  .grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(300px,1fr));gap:24px;padding:36px 40px;max-width:1400px;margin:0 auto}
  .card{background:#fff;border-radius:16px;overflow:hidden;box-shadow:0 2px 14px rgba(0,0,0,.07);display:flex;flex-direction:column;transition:transform .2s,box-shadow .2s}
  .card:hover{transform:translateY(-4px);box-shadow:0 10px 28px rgba(0,0,0,.13)}
  .card img{width:100%;aspect-ratio:4/5;object-fit:cover;display:block;background:#eee}
  .card .body{padding:16px 18px;display:flex;flex-direction:column;gap:12px}
  .card .title{font-size:15px;font-weight:700;color:#1a1a1a;line-height:1.3}
  .card .fname{font-size:11px;color:#aaa}
  .card .dl{margin-top:2px;background:#FBC219;color:#1a1a1a;text-align:center;font-size:13px;font-weight:800;letter-spacing:.3px;padding:11px;border-radius:9px;text-decoration:none;cursor:pointer;transition:background .15s}
  .card .dl:hover{background:#e6ae00}
  footer{text-align:center;color:#bbb;font-size:12px;padding:30px}
</style>
</head>
<body>
<header>
  <div class="brand">
    <h1><span class="b">$brandTitle</span></h1>
    <span class="sub">Contenido generado</span>
  </div>
  <div style="display:flex;align-items:center;gap:18px">
    <span class="meta">$count pieza(s) aprobada(s)</span>
    <button class="dl-all" onclick="descargarTodo()">&#8595; Descargar todo</button>
  </div>
</header>
<div class="grid" id="grid"></div>
<footer>Generado para revisi&oacute;n &middot; &aacute;brelo en cualquier navegador &middot; doble clic en una imagen para verla completa</footer>
<script>
const imgs = [
$jsArray
];
const grid = document.getElementById('grid');
imgs.forEach(it => {
  const card = document.createElement('div'); card.className='card';
  const im = document.createElement('img'); im.src=it.data; im.alt=it.title; im.loading='lazy';
  im.onclick = ()=>window.open(it.data,'_blank');
  const body = document.createElement('div'); body.className='body';
  const t = document.createElement('div'); t.className='title'; t.textContent=it.title;
  const fn = document.createElement('div'); fn.className='fname'; fn.textContent=it.name;
  const a = document.createElement('a'); a.className='dl'; a.innerHTML='&#8595; Descargar'; a.href=it.data; a.download=it.name;
  body.appendChild(t); body.appendChild(fn); body.appendChild(a);
  card.appendChild(im); card.appendChild(body); grid.appendChild(card);
});
function descargarTodo(){
  imgs.forEach((it,i)=>setTimeout(()=>{
    const a=document.createElement('a'); a.href=it.data; a.download=it.name;
    document.body.appendChild(a); a.click(); document.body.removeChild(a);
  }, i*400));
}
</script>
</body>
</html>
"@

$outPath = Join-Path $RepoRoot "outputs/$Brand/galeria-$Brand.html"
[System.IO.File]::WriteAllText($outPath, $html, [System.Text.UTF8Encoding]::new($false))
$sizeKb = [math]::Round((Get-Item $outPath).Length/1KB)
Write-Host "Galeria generada: $outPath ($count imagenes, $sizeKb KB)"
