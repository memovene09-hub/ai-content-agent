# Outputs

Resultados de generación de imagen/video por marca.

## Estructura

```
outputs/{client_id}/
├── _descartes/   ← cada generación nace aquí (gitignored, solo disco local)
└── aprobadas/    ← solo lo que el usuario aprueba (trackeado en git)
```

## Convención

- **Toda generación nueva** se descarga a `outputs/{client_id}/_descartes/`.
- Cuando el usuario **aprueba** una pieza, se mueve a `outputs/{client_id}/aprobadas/`.
- `_descartes/` está en `.gitignore`: no entra al repo, pero queda en tu disco.
- Higgsfield conserva en la nube el historial de TODAS las generaciones, así que
  un descarte nunca se pierde de verdad (ver `show_generations`).

## Naming

`{client_id}-{producto/tema}-{variante}.{ext}` — ej. `bites-vasito-futbol-1.png`.

Los carruseles tienen su propio flujo en `carruseles/carrusel-{N}/` + `index.html`.
