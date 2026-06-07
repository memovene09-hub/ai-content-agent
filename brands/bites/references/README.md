# Bites — Canonical References

Archivos PNG/JPG/MP4 que sirven como referencias visuales canónicas de Bites
para los motores de generación.

## Convención de nombres

Un element puede tener uno o más archivos de referencia:

- **Archivo primario:** `{nombre}.{ext}` (ej. `bites-vasito.jpeg`)
- **Variantes adicionales:** `{nombre}-{descriptor}.{ext}` (ej. `bites-carrito-frente.jpeg`)

El skill toma todos los archivos cuyo nombre empieza con `{nombre}` y elige
cuál subir según el contexto del brief (ej. si pide vista frontal, prefiere `*-frente`).

## Inventario actual

| Element (`nombre`) | Archivos |
|---|---|
| bites-logo | bites-logo.jpeg ✓ |
| bites-vasito | bites-vasito.jpeg ✓ |
| bites-minipancakes | bites-minipancakes.jpeg ✓ |
| bites-carrito | bites-carrito-frente.jpeg, bites-carrito-frente2.jpeg, bites-carrito-arriba.jpeg ✓ |
| bites-estilo | _usa cualquiera de las de arriba como ref de mood_ |

## Cuándo se usan

Las skills priorizan los uploads ad-hoc del usuario (`user_uploads`). Solo si un
rol requerido no está cubierto por el upload, el skill sube el archivo canónico
a Higgsfield (`media_upload` + `media_confirm`) como `canonical_fallback`.
