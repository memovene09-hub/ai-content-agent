# Bites — Canonical References

Archivos PNG/JPG/MP4 que sirven como referencias visuales canónicas de Bites
para los motores de generación.

## Convención de nombres

Un element puede tener uno o más archivos de referencia. La regla:

- **Archivo primario:** `{nombre}.{ext}` (ej. `bites-vasito.png`)
- **Variantes adicionales:** `{nombre}-{descriptor}.{ext}` (ej. `bites-carrito-frente.jpeg`, `bites-carrito-arriba.jpeg`)

El skill `generar-imagen` toma todos los archivos cuyo nombre empieza con `{nombre}`
y elige cuál sube según el contexto del brief (ej. si el brief pide vista frontal,
prefiere `*-frente`).

## Inventario actual

| Element (`nombre`) | Archivos |
|---|---|
| bites-logo | _pendiente_ |
| bites-vasito | _pendiente_ |
| bites-carrito | bites-carrito-arriba.jpeg, bites-carrito-frente.jpeg, bites-carrito-frente2.jpeg |
| bites-minipancakes | bites-minipancakes.jpeg |
| bites-estilo-noche | _pendiente_ |

## Cuándo se usan

Las skills priorizan los uploads ad-hoc del usuario. Solo si un rol requerido
no está cubierto, el skill sube este archivo a Higgsfield como fallback.
