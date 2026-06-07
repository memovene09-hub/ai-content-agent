# Skill: Carousel Generation

Se activa desde `brief-intake.md` cuando el formato es carrusel y el brief está validado.
Requiere `clients/{cliente}/brand.md` cargado con las secciones `## Identidad visual`,
`## Personajes` y `## Carrusel — Identidad Visual`.

**Arquitectura:**
- **Slide 1 (Cover):** Higgsfield AI genera SOLO background + persona (sin texto, sin logo).
  Luego se compone vía template HTML que overlay-ea logo, headline y rule. Render final con
  `tools/render-slide.ps1`. Resultado: pixel-perfect.
- **Slides 2, 3, 4 (tipográficos):** templates HTML directos → PNG con `tools/render-slide.ps1`.
  NO pasan por AI. Logo, tipografía, paleta e idioma 100% controlados.

---

## Paso 1 — Numeración de carrusel

Detectar carpetas existentes con el patrón `carruseles/carrusel-*`.
Contar el número más alto y proponer el siguiente.

Preguntar:
> "Guardaré este carrusel en `carruseles/carrusel-[N]/`. ¿De acuerdo?"

Guardar como `{N}`. Carpeta final: `carruseles/carrusel-{N}/`.
Archivos: `slide1.png`, `slide2.png`, `slide3.png`, `slide4.png`.

---

## Paso 2 — Resolver assets de identidad

Antes de construir cualquier prompt o HTML, resolver desde `brand.md`:

### 2a — Logo path
- Leer `brand.md → ## Identidad visual → ### Logo → Path`.
- Si el archivo existe en disco: `LOGO_OK = true`, `LOGO_PATH = "{ruta absoluta}"`.
- Si está [PENDIENTE] o el archivo no existe: `LOGO_OK = false`. Usar fallback wordmark.

### 2b — Tipografía
- Leer `brand.md → ## Identidad visual → ### Tipografía`. Los templates ya cargan las
  fuentes vía Google Fonts. Si el cliente declara fuentes distintas, sustituir en los
  templates antes de renderizar (placeholder `Fraunces` / `Inter`).

### 2c — Idioma
- Tomar el campo `idioma` del brief (heredado de content-ideas / brief-intake).
- Default si no viene: `brand.md → ## Idioma por defecto`.
- Mapear etiquetas:

  | Idioma | Slide 2 label | Slide 3 label | Slide 4 label |
  |--------|---------------|---------------|---------------|
  | es     | EL PUNTO      | POR QUÉ IMPORTA | SÍGUENOS    |
  | en     | THE POINT     | WHY IT MATTERS  | FOLLOW US   |

- **Regla fuerte:** TODO texto que aparezca en imagen va en este idioma. Sin excepciones.
  Si el brief llegó con copy en otro idioma, traducir antes de meter al template.

### 2d — Marcas externas mencionadas
- Tomar el campo `marcas_externas` del brief (lista de nombres, ej. `["WhatsApp", "HubSpot"]`).
- Para cada marca:
  1. Normalizar a kebab-case (`whatsapp`, `hubspot`).
  2. Buscar en este orden, tomar el primero que exista:
     `references/brands/{slug}-white.png`,
     `references/brands/{slug}-on-dark.png`,
     `references/brands/{slug}-logo.png`,
     `references/brands/{slug}.png`.
  3. Si existe → agregar a `BRAND_LOGOS` con path resuelto.
  4. Si NO existe → **detener y preguntar al usuario**:
     > "Mencionaste {Marca} en el brief y no encuentro su logo en `references/brands/`.
     > ¿Lo agregas como `{slug}-logo.png` (fondo transparente) o lo omitimos en los slides?"
  5. Esperar respuesta antes de continuar.

---

## Paso 3 — Construir HTML del brand-mark (reutilizable)

Si `LOGO_OK`:
```html
<img src="file:///{LOGO_PATH}" alt="Claryon">
```

Si NO `LOGO_OK` (fallback):
```html
<span class="wordmark">CLARYON</span>
```

Guardar como `BRAND_MARK_HTML`. Se inyecta en los 4 templates en cada placeholder
`{{BRAND_MARK_HTML}}`.

---

## Paso 4 — Generar Slide 1 (cover con AI background + overlay)

### 4a — Construir prompt de background

El prompt para Higgsfield genera ÚNICAMENTE el background + persona.
**Cero texto, cero logo en la imagen AI.** Esos elementos se overlay-ean después.

Si `brand.md → ## Personajes → [persona del brief] → Higgsfield Character Media ID`
está disponible: incluirlo como referencia de personaje.
Si está [PENDIENTE]: usar el fallback descriptivo.

Plantilla de prompt (inglés — instrucciones para Higgsfield):
```
{PERSONA_DESCRIPTION_OR_REFERENCE}, in a dark editorial scene.
Dark navy background (#131f3c) with subtle purple (#693f8c) lighting accents.
Subject positioned on the right side of the frame, looking confident.
Left half of the frame is empty negative space for typography overlay — keep it dark and uncluttered.
Cinematic moody lighting, dark, modern, professional.
ABSOLUTELY NO TEXT, NO LETTERS, NO LOGOS, NO WORDMARKS anywhere in the image.
1:1 square format, 1080x1080.
```

Mostrar el prompt al usuario y pedir aprobación antes de generar.

### 4b — Generar y descargar background AI
```
generate_image(modelo="gpt_image_2", prompt="{PROMPT}")
→ job_id
→ job_status(job_id) hasta "completed"
→ URL del archivo
```

Descargar a `carruseles/carrusel-{N}/_render/cover-bg.png`:
```bash
mkdir -p "carruseles/carrusel-{N}/_render"
curl -L -o "carruseles/carrusel-{N}/_render/cover-bg.png" "{URL}"
```

### 4c — Componer HTML del slide 1

Leer `templates/carousel/slide1-cover.html`. Sustituir placeholders:
- `{{LANG}}` → `es` o `en`
- `{{COVER_BG_PATH}}` → ruta absoluta del cover-bg.png con `file:///` (forward slashes)
- `{{BRAND_MARK_HTML}}` → el snippet de Paso 3
- `{{HEADLINE_HTML}}` → headline en el idioma del post (usar `<br>` para saltos de línea)
- `{{HEADLINE_SIZE_CLASS}}` → vacío (default 108px), `size-md` (92px) o `size-sm` (78px)
  según longitud del headline:
    - ≤ 22 chars: vacío
    - 23–34 chars: `size-md`
    - ≥ 35 chars: `size-sm`
- `{{BRAND_LOGOS_ROW_HTML}}` → si hay marcas externas:
  ```html
  <div class="brand-logos-row">
    <span class="label">CON</span>
    <img src="file:///{path-marca-1}"><img src="file:///{path-marca-2}">
  </div>
  ```
  (label: `CON` en español, `WITH` en inglés). Si no hay marcas: vacío.

Guardar en `carruseles/carrusel-{N}/_render/slide1.html`.

### 4d — Renderizar a PNG
```powershell
.\tools\render-slide.ps1 `
  -HtmlPath "carruseles/carrusel-{N}/_render/slide1.html" `
  -OutputPath "carruseles/carrusel-{N}/slide1.png" `
  -Width 1080 -Height 1080 -WaitMs 5000
```

Confirmar al usuario:
> "Slide 1 listo en `carruseles/carrusel-{N}/slide1.png`."

---

## Paso 5 — Generar Slides 2, 3, 4 (HTML→PNG, sin AI)

Para cada slide, leer el template, sustituir placeholders, escribir HTML temporal,
renderizar a PNG.

### Slide 2 — EL PUNTO / THE POINT

Template: `templates/carousel/slide2-punto.html`.

Sustituciones:
- `{{LANG}}` → `es` / `en`
- `{{LABEL_PUNTO}}` → `EL PUNTO` o `THE POINT`
- `{{CLAIM_HTML}}` → claim en el idioma del post (puedes usar `<br>` para saltos)
- `{{CLAIM_SIZE_CLASS}}` → vacío (130px), `size-md` (110px) o `size-sm` (92px) según largo:
    - ≤ 35 chars: vacío
    - 36–55 chars: `size-md`
    - ≥ 56 chars: `size-sm`
- `{{BRAND_MARK_HTML}}` → snippet del Paso 3
- `{{BRAND_LOGOS_ROW_HTML}}` → bloque opcional si hay marcas externas relevantes a este slide;
  si no, vacío:
  ```html
  <div class="brand-logos-row"><img src="file:///{p1}"><img src="file:///{p2}"></div>
  ```

Render:
```powershell
.\tools\render-slide.ps1 `
  -HtmlPath "carruseles/carrusel-{N}/_render/slide2.html" `
  -OutputPath "carruseles/carrusel-{N}/slide2.png"
```

### Slide 3 — POR QUÉ IMPORTA / WHY IT MATTERS

Template: `templates/carousel/slide3-importa.html`.

Sustituciones:
- `{{LANG}}` → `es` / `en`
- `{{LABEL_POR_QUE_IMPORTA}}` → `POR QUÉ IMPORTA` o `WHY IT MATTERS`
- `{{BRAND_MARK_HTML}}` → snippet del Paso 3
- `{{BULLET_1_HTML}}`, `{{BULLET_2_HTML}}`, `{{BULLET_3_HTML}}` → texto de cada bullet
  en el idioma del post. Si un bullet menciona una marca externa con logo disponible,
  embeber el logo inline:
  ```html
  Conecta con <span class="brand-inline"><img src="file:///{path}"> WhatsApp</span> en minutos.
  ```
- `{{FOOTER_BRANDS_HTML}}` → si las 3 marcas mencionadas no se inyectaron en los bullets,
  agregar fila de logos al pie:
  ```html
  <div class="footer-brands">
    <span class="label">INTEGRACIONES</span>
    <img src="file:///{p1}"><img src="file:///{p2}"><img src="file:///{p3}">
  </div>
  ```
  Label: `INTEGRACIONES` en español, `INTEGRATIONS` en inglés. Si no hay marcas: vacío.

### Slide 4 — SÍGUENOS / FOLLOW US

Template: `templates/carousel/slide4-sigueme.html`.

Sustituciones:
- `{{LANG}}` → `es` / `en`
- `{{LABEL_SIGUENOS}}` → `SÍGUENOS` o `FOLLOW US`
- `{{BRAND_MARK_HTML}}` → snippet del Paso 3
- `{{CTA_HEADLINE_HTML}}` → headline del CTA en el idioma del post
- `{{CTA_SIZE_CLASS}}` → vacío (120px), `size-md` (100px) o `size-sm` (84px) según largo
- `{{CTA_BODY_HTML}}` → 1–2 líneas explicando el siguiente paso
- `{{HANDLE}}` → handle de la plataforma (Instagram: `@claryon`; LinkedIn: `Claryon`)
- `{{CTA_ACTION}}` → acción concreta en MAYÚSCULAS (ej. `ESCRÍBENOS`, `AGENDA AHORA`,
  `BOOK A CALL`)

---

## Paso 6 — Mostrar los 4 prompts/composiciones para aprobación

Antes de ejecutar nada, mostrar al usuario:

```
Listo para generar el carrusel {N}:

Slide 1 — Cover (AI background + overlay HTML):
  Prompt AI: "{PROMPT_BACKGROUND_INGLES}"
  Headline overlay: "{HEADLINE}"

Slide 2 — {LABEL_PUNTO}:
  Claim: "{CLAIM}"

Slide 3 — {LABEL_POR_QUE_IMPORTA}:
  • {BULLET_1}
  • {BULLET_2}
  • {BULLET_3}
  Marcas: {LISTA_MARCAS o "ninguna"}

Slide 4 — {LABEL_SIGUENOS}:
  CTA: "{CTA_HEADLINE}"
  Body: "{CTA_BODY}"
  Handle: {HANDLE}  ·  Acción: {CTA_ACTION}

Idioma: {LANG}
Logo: {ok / fallback wordmark}

¿Procedemos?
```

Esperar confirmación.

---

## Paso 7 — Ejecutar generación

Orden de ejecución:
1. Slide 1 — generar AI background → composer HTML → render PNG.
2. Slide 2 — render HTML→PNG.
3. Slide 3 — render HTML→PNG.
4. Slide 4 — render HTML→PNG.

Después de cada slide, mensaje corto al usuario:
> "Slide [S] guardado en `carruseles/carrusel-{N}/`."

Si un slide falla, ofrecer reintento o ajuste de copy.

**Regla:** las imágenes generadas NO se muestran en el chat. Se revisan vía `index.html`.

---

## Paso 8 — Generar / actualizar index.html

Una vez guardados los 4 slides, crear o actualizar `index.html` en la raíz del proyecto.

**Si `index.html` ya existe:** leerlo, encontrar el primer `<hr class="divider">`,
e insertar la nueva sección de carrusel ANTES de esa línea.
Incrementar el `STORY_LABEL` según cuántas secciones ya existen.

**Si no existe:** escribir el archivo completo con el template de abajo.

### Template de sección de carrusel

Sustituir: `{N}`, `{TITULO}`, `{FECHA}`, `{STORY_LABEL}` (ej. `Carrusel 01`).

```html
<section class="story">
  <div class="story-meta">
    <div>
      <p class="story-label">{STORY_LABEL}</p>
      <p class="story-date">{FECHA}</p>
      <p class="story-title">{TITULO}</p>
    </div>
    <a class="download-all-btn" href="#" onclick="downloadAll({N}); return false;">
      <svg width="12" height="12" viewBox="0 0 24 24" fill="currentColor"><path d="M12 16l-6-6h4V4h4v6h4l-6 6zm-6 2h12v2H6z"/></svg>
      Descargar todo
    </a>
  </div>

  <div class="row">
    <div class="slide-wrap">
      <img src="carruseles/carrusel-{N}/slide1.png" alt="Slide 1 — Cover">
      <a class="dl-btn" href="carruseles/carrusel-{N}/slide1.png" download="carrusel-{N}-slide1.png">Descargar</a>
    </div>
    <div class="slide-wrap">
      <img src="carruseles/carrusel-{N}/slide2.png" alt="Slide 2 — El Punto">
      <a class="dl-btn" href="carruseles/carrusel-{N}/slide2.png" download="carrusel-{N}-slide2.png">Descargar</a>
    </div>
    <div class="slide-wrap">
      <img src="carruseles/carrusel-{N}/slide3.png" alt="Slide 3 — Por Qué Importa">
      <a class="dl-btn" href="carruseles/carrusel-{N}/slide3.png" download="carrusel-{N}-slide3.png">Descargar</a>
    </div>
    <div class="slide-wrap">
      <img src="carruseles/carrusel-{N}/slide4.png" alt="Slide 4 — Síguenos">
      <a class="dl-btn" href="carruseles/carrusel-{N}/slide4.png" download="carrusel-{N}-slide4.png">Descargar</a>
    </div>
  </div>
</section>

<hr class="divider">
```

### Template completo de index.html (para primera vez)

```html
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CLARYON — Contenido Generado</title>
<style>
  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
  body { background: #0a0a0a; color: #fff; font-family: -apple-system, BlinkMacSystemFont, 'Helvetica Neue', sans-serif; padding: 48px 40px 80px; }
  .page-title { font-size: 11px; font-weight: 700; letter-spacing: 3px; text-transform: uppercase; color: #693f8c; margin-bottom: 48px; }
  .story { margin-bottom: 64px; }
  .story-meta { display: flex; align-items: flex-start; justify-content: space-between; margin-bottom: 20px; }
  .story-label { font-size: 10px; font-weight: 600; letter-spacing: 2.5px; text-transform: uppercase; color: rgba(255,255,255,0.18); margin-bottom: 6px; }
  .story-date { font-size: 20px; font-weight: 700; color: #ffffff; margin-bottom: 4px; }
  .story-title { font-size: 13px; color: rgba(255,255,255,0.35); }
  .download-all-btn { display: flex; align-items: center; gap: 7px; background: rgba(105,63,140,0.15); border: 1px solid #693f8c; color: #bdb9d7; font-size: 10px; font-weight: 600; letter-spacing: 1.5px; text-transform: uppercase; padding: 9px 16px; border-radius: 7px; cursor: pointer; text-decoration: none; transition: background 0.15s, color 0.15s; flex-shrink: 0; }
  .download-all-btn:hover { background: rgba(105,63,140,0.35); color: #fff; }
  .row { display: grid; grid-template-columns: repeat(4, 1fr); gap: 10px; }
  @media (max-width: 800px) { .row { grid-template-columns: repeat(2, 1fr); } }
  .slide-wrap { position: relative; display: flex; flex-direction: column; gap: 8px; }
  .slide-wrap img { width: 100%; aspect-ratio: 1 / 1; object-fit: cover; border-radius: 12px; display: block; background: #131f3c; transition: transform 0.2s ease; }
  .slide-wrap img:hover { transform: scale(1.03); }
  .dl-btn { display: block; text-align: center; background: #131f3c; border: 1px solid rgba(105,63,140,0.4); color: #bdb9d7; font-size: 10px; font-weight: 600; letter-spacing: 1.5px; text-transform: uppercase; padding: 8px; border-radius: 6px; text-decoration: none; transition: background 0.15s, color 0.15s, border-color 0.15s; }
  .dl-btn:hover { background: #693f8c; border-color: #693f8c; color: #fff; }
  hr.divider { border: none; border-top: 1px solid rgba(255,255,255,0.05); margin: 0 0 56px; }
</style>
</head>
<body>

<p class="page-title">CLARYON — Contenido Generado</p>

{STORY_SECTIONS}

<script>
  function downloadAll(n) {
    [1, 2, 3, 4].forEach((s, i) => {
      setTimeout(() => {
        const a = document.createElement('a');
        a.href = `carruseles/carrusel-${n}/slide${s}.png`;
        a.download = `carrusel-${n}-slide${s}.png`;
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
      }, i * 300);
    });
  }
</script>
</body>
</html>
```

---

## Paso 9 — Abrir vista previa

Si hay servidor local en puerto 3456:
> "Refresca http://localhost:3456"

Si no:
> "Para revisar y descargar, ejecuta: `python -m http.server 3456`
> Luego abre http://localhost:3456 en Chrome."

---

## Paso 10 — Confirmar y permitir ajustes

```
Carrusel {N} listo:
✓ slide1.png — Cover
✓ slide2.png — {LABEL_PUNTO}
✓ slide3.png — {LABEL_POR_QUE_IMPORTA}
✓ slide4.png — {LABEL_SIGUENOS}
✓ index.html actualizado

Revisa en el navegador. ¿Algún slide necesita ajuste?
```

**Re-render de un solo slide:**
- Slide 2, 3 o 4: editar HTML de `_render/`, volver a correr `tools/render-slide.ps1`
  sobre ese slide. No requiere regenerar nada con AI.
- Slide 1: si el ajuste es solo del overlay (headline/logo/marcas), regenerar HTML y
  re-render. Si el ajuste es del background, re-generar con Higgsfield (paso 4b).

---

## Reglas duras

- **Sin brand.md cargado, no se ejecuta este skill.**
- **Sin idioma definido, no se construyen los templates.** El idioma se hereda del brief
  o del default de brand.md, nunca se infiere.
- **Cero AI en slides 2, 3, 4.** Esos slides son 100% HTML→PNG.
- **Cero texto en el prompt AI del Slide 1.** Cualquier texto en imagen viene del overlay HTML.
- **Marcas externas con logo desconocido pausan el flujo** hasta que el usuario decida.
- **Un solo idioma por carrusel.** No mezclar es/en en un mismo set de 4 slides.
