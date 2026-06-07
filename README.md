# AI Content Agent

Agente multi-marca que genera contenido (imágenes, videos, carruseles, infografías)
respetando la identidad de cada marca activa. Marcas iniciales: **Claryon** y **Bites**.

## Cómo usar

1. Abre una sesión de Claude Code en este directorio.
2. Indica la marca activa: `"Cliente activo: claryon"` o `"Cliente activo: bites"`.
3. Pide lo que necesitas. Triggers en `MODES.json`:
   - `"genera una imagen / hero / infografía de…"` → `generar-imagen`
   - `"genera un video / reel de…"` → `generar-video`
   - `"genera un carrusel de…"` → `generar-carrusel`
   - `"guardar patrón [nombre]"` → `aprender-de-exito`

El agente carga `brands/{marca}/`, ensambla el prompt con los 6 bloques de
`prompts/template-prompt-completo.md`, elige motor con `engines/router.md`,
ejecuta, y entrega con status `pendiente de aprobación humana`.

## Arquitectura

```
CLAUDE.md                 ≤35 líneas — boot del agente
MODES.json                modos + triggers + approval_gate
compiled.json             artefacto compilado (NO editar a mano)
tools/build-compiled.ps1  regenera compiled.json desde fuentes

brands/{marca}/
  identity.md             ADN visual + voz + personajes
  elements.json           manifest de Higgsfield elements
  formats.md              specs por red social
  successful-prompts.json patrones validados aprendidos en el tiempo

engines/router.md         motor por tipo de pieza (agnóstico a marca)
prompts/template-prompt-completo.md   plantilla obligatoria de 6 bloques

skills/                   todas ≤30 líneas, agnósticas a marca
  generar-imagen.md
  generar-video.md
  generar-carrusel.md
  aprender-de-exito.md

templates/carousel/       HTML→PNG para slides tipográficos
tools/render-slide.ps1    Edge headless render
references/               logos del cliente y de marcas externas
carruseles/               outputs históricos
```

## Cómo agregar una marca

1. Crea `brands/{nueva-marca}/{identity.md, elements.json, formats.md, successful-prompts.json}`.
2. Coloca su logo en `references/{nueva-marca}-logo.png`.
3. Regenera: `.\tools\build-compiled.ps1`.

**No se modifica** `CLAUDE.md`, `MODES.json`, `engines/`, `prompts/` ni las `skills/`.

## Reglas no negociables

- Sin `brands/{marca}/identity.md`, no se construye prompt.
- Un solo idioma por pieza. Nunca mezclar.
- El agente NUNCA auto-publica. Aprobación humana explícita en el chat.
- Prompts a motores AI siempre en inglés. Conversación con el usuario en español.

## Modelo

`claude-haiku-4-5-20251001`
