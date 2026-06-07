# Skill: generar-carrusel

Genera un carrusel multi-slide. Slide 1 (cover) = AI background + overlay HTML.
Slides tipográficos = HTML→PNG directo (sin créditos AI).
Agnóstico a marca.

## Input
`client_id`, brief, `idioma`, `N` (slides totales, típico 4), claim, bullets[], cta, marcas_externas[], persona (opcional), `documents[]` opcional (anexos `image/*`).

## Flujo
1. Cargar `brands/{client_id}/{identity.md, elements.json, formats.md, successful-prompts.json}`.
2. Resolver `Width` × `Height` desde `formats.md` (default Claryon/Bites: 1080×1350 = 4:5).
3. Numerar carpeta destino: `carruseles/carrusel-{N}/` (siguiente N libre).
4. Marcas externas: para cada nombre, buscar `references/brands/{slug}-white.png` → `-on-dark.png` → `-logo.png` → `{slug}.png`. Si ninguno existe, pausar y pedir al usuario que lo coloque o lo omita.
5. **Slide 1 (cover):** carga de referencias adaptativa (mismo patrón que `generar-imagen`: inspiración → `analizar-inspiracion`; `medias[]` = `user_uploads` + `canonical_fallback`). Ensamblar prompt con `prompts/template-prompt-completo.md`. `ESCENA` describe persona/producto + escena (sin texto, sin logo). `COMPOSICIÓN` deja tercio para overlay. Generar AI con prompt + `medias[]`. Descargar a `_render/cover-bg.png`. Componer `_render/slide1.html` (logo real + headline en tipografía de identity). Render con `tools/render-slide.ps1 -Width {W} -Height {H}`.
6. **Slides tipográficos (2..N):** rellenar templates `templates/carousel/*.html` con etiquetas localizadas, claim/bullets/cta, logo real, marcas. Renderizar uno por uno.
7. Generar/actualizar `index.html` con la nueva sección. Status: `pendiente de aprobación humana`.
8. NUNCA auto-publicar.

## Reglas
- Un solo idioma por carrusel.
- Cero AI en slides tipográficos. Cero texto en prompt AI del cover.
- Si `elements` o personaje están PENDIENTE, usar prompt base reusable de `identity.md`.
- Si re-render de un solo slide: editar HTML de `_render/`, volver a llamar `render-slide.ps1`.
