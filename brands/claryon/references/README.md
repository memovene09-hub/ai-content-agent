# Claryon — Canonical References

Archivos PNG/JPG/MP4 que sirven como referencias visuales canónicas de la marca
para los motores de generación (Higgsfield principalmente).

## Convención de nombres

El archivo se llama igual que el `nombre` del element en `brands/claryon/elements.json`:

| Element (`nombre`) | Archivo esperado |
|---|---|
| claryon-logo | claryon-logo.png |
| claryon-iso | claryon-iso.png |
| claryon-paleta | claryon-paleta.png |

## Cuándo se usan

Las skills `generar-imagen` / `generar-video` / `generar-carrusel` priorizan
las imágenes que el usuario anexa en el chat (`user_uploads`). Solo si un rol
requerido NO está cubierto por el upload del usuario, suben este archivo a
Higgsfield (vía `media_upload` + `media_confirm`) como `canonical_fallback`.

## Distinción con `references/` (raíz del proyecto)

- `references/{client}-logo.png` (raíz) — uso por **templates HTML** de carrusel
  (overlays renderizados con Edge headless). Path embebido directo.
- `brands/{client}/references/{nombre}.png` — uso por **motores AI** vía
  upload a Higgsfield. El skill resuelve el path en runtime.

Ambos pueden coexistir; el archivo puede ser el mismo en ambos lugares si conviene.
