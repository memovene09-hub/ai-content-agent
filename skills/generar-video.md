# Skill: generar-video

Genera un video corto (reel / story / demo) para la marca activa.
Agnóstico a marca.

## Input
`client_id`, `tipo_pieza` (reel | story | demo), brief en español, `idioma` (default es), duración objetivo, `documents[]` opcional (anexos `image/*`).

## Flujo
1. Cargar `brands/{client_id}/{identity.md, elements.json, formats.md, successful-prompts.json}`.
2. Resolver `aspect_ratio`, `duration`, `resolution`, motor con `engines/router.md` + overrides en `formats.md`. Default: `seedance_2_0`, 9:16, 720p, 4–15s, `mode=fast`.
3. Carga de referencias adaptativa (mismo patrón que `generar-imagen`): si hay imagen de inspiración, llamar `analizar-inspiracion` y embeber su JSON en `ESTILO`; construir `medias[]` con `user_uploads` (de `documents[]`, prioridad) + `canonical_fallback` (roles no cubiertos, de `elements.json` / `brands/{client_id}/references/`).
4. Buscar patrones en `successful-prompts.json` por tags; embeber constraints validados en `ESTILO` / `EVITAR`.
5. Ensamblar prompt con `prompts/template-prompt-completo.md`. En `ESCENA` describir acción + cámara + ritmo. En `TÉCNICO` agregar movimiento de cámara y duración. `REFERENCIAS` lista `<<<UUID>>>` por media.
6. Mostrar prompt + `medias[]` + params al usuario y esperar aprobación.
7. Llamar `generate_video` con prompt + `medias[]`. Polling hasta `completed`. Descargar a disco. Entregar paths con status `pendiente de aprobación humana`.
8. NUNCA auto-publicar.

## Reglas
- Si la duración pedida sale del rango del motor, advertir y pedir confirmación.
- Un solo idioma por pieza (incluye voz en off / subtítulos si aplica).
- Sin `identity.md` cargado, no se construye prompt.
