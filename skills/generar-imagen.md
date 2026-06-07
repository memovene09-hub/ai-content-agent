# Skill: generar-imagen

Genera una pieza estática para la marca activa, respetando identidad y formato.
Agnóstico a marca — carga la marca desde `client_id`.

## Input
`client_id`, `tipo_pieza` (post | hero | infografia), brief del usuario en español, `idioma` (default es).

## Flujo
1. Cargar `brands/{client_id}/{identity.md, elements.json, formats.md, successful-prompts.json}`.
2. Resolver `aspect_ratio` y motor con `engines/router.md` + overrides en `formats.md`.
3. Si motor = `canva-brief` → ensamblar brief markdown (layout, jerarquía, paleta, texto, assets) y entregar con status `pendiente de aprobación humana`. NO llamar AI.
4. Si motor AI:
   - Seleccionar elements de `elements.json` cuyos tags casan con el brief (los marcados PENDIENTE se notan, no se incluyen como id).
   - Buscar en `successful-prompts.json` patrones con tags similares; si hay match, extraer `constraints` validados y embeberlos en bloques `ESTILO` / `EVITAR` con la nota `based on successful patterns:`.
   - Ensamblar prompt con `prompts/template-prompt-completo.md` (6 bloques completos).
   - Mostrar prompt + params al usuario y esperar aprobación explícita.
   - Llamar `generate_image`. Descargar a disco. Entregar paths con status `pendiente de aprobación humana`.
5. NUNCA auto-publicar. El gate es humano.

## Reglas
- Sin `identity.md` cargado, no se construye prompt.
- Un solo idioma por pieza.
- Texto en imagen siempre va en `{idioma}` declarado.
- Cualquier bloque de la plantilla vacío = bug, regenerar.
