# Outputs

Resultados de generación de imagen/video por marca.

## Estructura

```
outputs/{client_id}/
├── <archivos nuevos>   ← staging: aquí nace cada generación, sin decidir
├── descartes/          ← lo que decidimos NO usar (gitignored, solo local)
└── aprobadas/          ← lo que el usuario aprueba (trackeado en git)
```

## Convención

- **Toda generación nueva** se descarga a `outputs/{client_id}/` (raíz de la marca).
  No nace en `descartes/`: nace sin decisión.
- Cuando el usuario **aprueba** una pieza, se mueve a `outputs/{client_id}/aprobadas/`.
- Cuando el usuario pide cambios o descarta, se mueve a `outputs/{client_id}/descartes/`.
- La raíz `outputs/{client_id}/` y `descartes/` están gitignored: no entran al repo,
  pero quedan en tu disco. Solo `aprobadas/` se versiona.
- Higgsfield conserva en la nube el historial de TODAS las generaciones, así que
  un descarte nunca se pierde de verdad (ver `show_generations`).

## Naming

`{client_id}-{producto/tema}-{variante}.{ext}` — ej. `bites-vasito-futbol-1.png`.

Los carruseles tienen su propio flujo en `carruseles/carrusel-{N}/` + `index.html`.
