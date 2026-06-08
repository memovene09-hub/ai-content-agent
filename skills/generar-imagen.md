# Skill: generar-imagen

Genera una pieza estática para la marca activa. Flujo adaptativo:
prioriza referencias que el usuario anexe (ad-hoc), llena gaps con canónicas.
Agnóstico a marca.

## Input
`client_id`, `tipo_pieza` (post|hero|infografia), brief en español, `idioma`,
`documents[]` opcional (anexos type `image/*`).

## Flujo
1. Cargar `brands/{client_id}/{identity.md, elements.json, formats.md, successful-prompts.json}`.
2. Resolver `aspect_ratio` + motor con `engines/router.md` + overrides de `formats.md`. Si motor = `canva-brief` → ensamblar brief markdown, entregar con status `pendiente de aprobación humana`. Fin.
3. Análisis de inspiración: para cada imagen marcada como inspiración/estilo (anexa al chat, o de `brands/{client_id}/references/inspo/` si el brief la nombra), llamar `analizar-inspiracion` y embeber su JSON en `ESTILO`. Si se quiere usar como referencia real de generación, subirla a `medias[]`.
4. Determinar roles de referencia que la pieza necesita (matching de tags del brief contra `elements.json`).
5. Construir `medias[]` priorizando ad-hoc sobre canónicas:
   - **user_uploads** — para cada imagen en `documents[]`: `media_upload` (bytes) → `media_confirm` → UUID. Inferir rol por contexto (sujeto / packshot / estilo).
   - **canonical_fallback** — solo para roles NO cubiertos por user_uploads. Si el element tiene `higgsfield_id` válido, usarlo directo; si está PENDIENTE, buscar archivos `brands/{client_id}/references/identidad/{nombre}*` (primario + variantes), elegir según contexto, subir y obtener UUID.
   - No duplicar roles: si Memo sube todo, omitir el fallback.
6. Buscar patrones en `successful-prompts.json` cuyos tags casen con el brief; embeber `constraints` en `ESTILO`/`EVITAR` con nota `based on successful patterns:`.
7. Ensamblar prompt con `prompts/template-prompt-completo.md` (6 bloques completos). `REFERENCIAS` lista `<<<UUID>>>` por cada media.
8. Mostrar prompt + `medias[]` + params al usuario. Esperar aprobación explícita.
9. Llamar `generate_image` con prompt + `medias[]`. Descargar a `outputs/{client_id}/` (raíz de la marca, NO a `_descartes/`). Entregar con status `pendiente de aprobación humana`.
10. Cuando el usuario decide: si aprueba, mover a `outputs/{client_id}/aprobadas/`; si pide cambios o descarta, mover a `outputs/{client_id}/_descartes/`. La raíz es staging, no archivo final. Ver `outputs/README.md`.

## Reglas
- Sin `identity.md`, no se construye prompt.
- Un solo idioma por pieza. NUNCA auto-publicar.
- NO agregar elementos no pedidos ni ausentes de las referencias. NO alterar forma/proporción de productos reales.
- Sin preguntas redundantes en clasificación: si no hay señal de inspiración, todos los `documents[]` son `assets`.
