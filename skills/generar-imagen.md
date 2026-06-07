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
3. Análisis de inspiración: para cada imagen anexa que el contexto marque como inspiración/estilo (palabras como "como esta", "este look", "que se vea así"), llamar `analizar-inspiracion` y embeber su JSON en el bloque `ESTILO`.
4. Determinar roles de referencia que la pieza necesita (matching de tags del brief contra `elements.json`).
5. Construir `medias[]` priorizando ad-hoc sobre canónicas:
   - **user_uploads** — para cada imagen en `documents[]`: `media_upload` (bytes) → `media_confirm` → UUID. Inferir rol por contexto (sujeto / packshot / estilo).
   - **canonical_fallback** — solo para los roles requeridos NO cubiertos por user_uploads. Si el element tiene `higgsfield_id` válido, usarlo directo; si está PENDIENTE, subir el archivo `brands/{client_id}/references/{nombre}.png` y obtener UUID.
   - No duplicar roles: si Memo sube todo, omitir el fallback.
6. Buscar patrones en `successful-prompts.json` cuyos tags casen con el brief; embeber `constraints` en `ESTILO`/`EVITAR` con nota `based on successful patterns:`.
7. Ensamblar prompt con `prompts/template-prompt-completo.md` (6 bloques completos). `REFERENCIAS` lista `<<<UUID>>>` por cada media.
8. Mostrar prompt + `medias[]` + params al usuario. Esperar aprobación explícita.
9. Llamar `generate_image` con prompt + `medias[]`. Descargar a disco. Entregar con status `pendiente de aprobación humana`.

## Reglas
- Sin `identity.md`, no se construye prompt.
- Un solo idioma por pieza. NUNCA auto-publicar.
- Sin preguntas redundantes en clasificación: si no hay señal de inspiración, todos los `documents[]` son `assets`.
