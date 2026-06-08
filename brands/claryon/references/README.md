# Claryon — References

Dos subcarpetas según el tipo de imagen:

```
references/
├── identidad/   ← imágenes FIJAS de marca: logo, iso, paleta, personaje (canónicas)
└── inspo/       ← imágenes de INSPIRACIÓN: vibra, composición, escenas puntuales
```

## identidad/ — imágenes fijas (canónicas)

Lo que define visualmente a Claryon y se reutiliza siempre. Cada element de
`elements.json` apunta aquí. Convención: `{nombre}.{ext}` primario,
`{nombre}-{descriptor}.{ext}` variantes.

| Element (`nombre`) | Archivo esperado |
|---|---|
| claryon-logo | identidad/claryon-logo.png |
| claryon-iso | identidad/claryon-iso.png |
| claryon-paleta | identidad/claryon-paleta.png |

> Pendiente colocar archivos. Nota: el logo para overlays HTML de carrusel vive
> aparte en `references/claryon-logo.png` (raíz); estos son para uploads a Higgsfield.

## inspo/ — imágenes de inspiración

Referencias de estilo/composición/escena. Se pasan por nombre en el brief.
_Vacío por ahora._

## Cómo se usan

`generar-*` prioriza uploads ad-hoc del chat. Para gaps usa las canónicas de
`identidad/`. Las de `inspo/` se usan como referencia de estilo/composición
cuando el brief las menciona.
