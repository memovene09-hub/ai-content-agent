# Claryon — Formats

Specs por red social. Cada formato declara: aspect ratio, dimensiones,
duración (si aplica), reglas de encuadre y notas de uso.

## Post Instagram / LinkedIn

| Campo | Valor |
|---|---|
| aspect_ratio | 4:5 |
| dimensiones | 1080 × 1350 |
| usos | Post estático, hero de campaña |
| encuadre | Sujeto en tercio derecho, headline overlay tercio izquierdo |

## Historia (Instagram Stories)

| Campo | Valor |
|---|---|
| aspect_ratio | 9:16 |
| dimensiones | 1080 × 1920 |
| usos | Historia efímera, teasers |
| encuadre | Texto en tercio superior, CTA en tercio inferior |

## Reel (Instagram Reels)

| Campo | Valor |
|---|---|
| aspect_ratio | 9:16 |
| dimensiones | 1080 × 1920 |
| resolución | 720p |
| duración | 4–15s |
| usos | Demos breves, hooks |
| motor | seedance_2_0 (mode=fast) — ver engines/router.md |

## Carrusel

| Campo | Valor |
|---|---|
| aspect_ratio | 4:5 |
| dimensiones | 1080 × 1350 |
| slides | N (típicamente 4–8) |
| estructura | Cover → claim → bullets/casos → CTA |
| render | Slide 1 cover = AI + overlay HTML. Slides tipográficos = HTML→PNG directo. |

## Infografía (Claryon-only, output = brief para Canva)

| Campo | Valor |
|---|---|
| salida | Documento estructurado en texto, NO raster generado |
| destino | Operador humano en Canva |
| motor | Canva (no AI gen) — ver engines/router.md |
| contenido | Layout sugerido, jerarquía, texto, datos, paleta y assets a usar |

El skill `generar-imagen` con tipo `infografia` y `client_id=claryon` devuelve
un brief en markdown listo para pegar en Canva, no una imagen.

## Hero (banner web, portada de campaña)

| Campo | Valor |
|---|---|
| aspect_ratio | 16:9 o 21:9 |
| dimensiones | 1920 × 1080 (mínimo) |
| usos | LinkedIn header, web hero, thumbnail |
| motor | nano_banana_pro |

## Overrides de motor por marca

Defaults vienen de `engines/router.md` (por tipo de pieza, brand-agnóstico).
Claryon no requiere overrides; usa los defaults del router.
