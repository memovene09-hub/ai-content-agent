# Bites — References

Dos subcarpetas según el tipo de imagen:

```
references/
├── identidad/   ← imágenes FIJAS de marca: logo, productos, sets (canónicas)
└── inspo/       ← imágenes de INSPIRACIÓN: vibra, composición, fondos puntuales
```

## identidad/ — imágenes fijas (canónicas)

Lo que define visualmente a Bites y se reutiliza siempre. Cada element de
`elements.json` apunta aquí. Convención de nombres: `{nombre}.{ext}` primario,
`{nombre}-{descriptor}.{ext}` variantes.

| Element (`nombre`) | Archivos en identidad/ |
|---|---|
| bites-logo | bites-logo.jpeg ✓ |
| bites-vasito | bites-vasito.jpeg ✓ |
| bites-minipancakes | bites-minipancakes.jpeg ✓ |
| bites-carrito | bites-carrito-frente.jpeg, bites-carrito-frente2.jpeg, bites-carrito-arriba.jpeg ✓ |
| bites-estilo | usa cualquiera de identidad/ como ref de mood |

## inspo/ — imágenes de inspiración

Referencias de estilo/composición/fondo, no necesariamente de la marca.
Se pasan por nombre en el brief (ej. "usa el fondo inspo-fondofutbol").

| Archivo | Uso |
|---|---|
| inspo-fondofutbol.jpeg | Fondo de estadio de fútbol (composición/escenario) |
| inspo-mundial.jpeg | Referencia de composición/ángulo (lata poppi en estadio) |

## Cómo se usan

`generar-*` prioriza los uploads ad-hoc del chat (`user_uploads`). Para gaps usa
las canónicas de `identidad/` (`canonical_fallback`). Las de `inspo/` se usan como
referencia de estilo/composición cuando el brief las menciona. Higgsfield conserva
el historial completo de generaciones en la nube.
