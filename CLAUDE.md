# AI Content Agent

Generar contenido (imagen, video, carrusel, infografía) para múltiples marcas, respetando la identidad de cada una.

## Inicio de sesión
1. Identifica `client_id` (el usuario lo nombra o se infiere del contexto).
2. Carga `brands/{client_id}/{identity.md, elements.json, formats.md, successful-prompts.json}`.
   Si falta `identity.md`, detén y pídelo.
3. Lee `MODES.json`, `engines/router.md`, `prompts/template-prompt-completo.md`.

## Despacho
Empareja el input del usuario con los `triggers` de `MODES.json`.
Cada modo carga su skill en `skills/` y ejecuta su flujo.

## Reglas duras
- Sin `brands/{client_id}/identity.md`, no se construye prompt.
- **Un solo idioma por pieza.** Nunca mezclar es/en.
- Las skills de generación ensamblan SIEMPRE los 6 bloques de
  `prompts/template-prompt-completo.md` (ESCENA, ESTILO, REFERENCIAS,
  COMPOSICIÓN, TÉCNICO, EVITAR). Bloque vacío = bug.
- El motor por tipo de pieza se resuelve con `engines/router.md` + overrides
  de `brands/{client_id}/formats.md`.
- **El agente NUNCA auto-publica.** Cada salida llega con status
  `pendiente de aprobación humana`. La aprobación es explícita en el chat.
- **Flujo de outputs:** cada generación nueva nace en la raíz de
  `outputs/{client_id}/` (staging, sin decisión). Al aprobar se mueve a
  `aprobadas/`; al descartar o pedir cambios, a `descartes/`. Detalle en
  `outputs/README.md`.
- Conversación en español. Prompts a motores AI van en inglés.

## Cómo agregar una marca
Crear `brands/{nueva}/{identity.md, elements.json, formats.md, successful-prompts.json}`
y regenerar `compiled.json`. **NO tocar** `CLAUDE.md`, `MODES.json`, `engines/`, `prompts/` ni `skills/`.

## Modelo
`claude-haiku-4-5-20251001`

## Artefacto compilado
`compiled.json` lo regenera `tools/build-compiled.ps1`. **No editarlo a mano.**
