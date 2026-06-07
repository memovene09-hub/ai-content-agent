# Skill: Content Ideas — Inicializador Universal

Este skill es el **punto de entrada para toda sesión de generación de contenido**.
Siempre corre primero, sin importar si el usuario pide ideas, un video, una imagen o un carrusel.
Su función: recoger contexto de plataforma/objetivo, anclar las ideas a brand.md,
y pasar una propuesta estructurada a brief-intake.md para que solo pregunte lo que falta.

---

## Principios

- Habla en español. Tono directo, breve, orientado a la acción.
- Máximo 2 preguntas por turno — nunca un formulario de golpe.
- Si el usuario ya dio plataforma, formato u objetivo en su primer mensaje, no re-preguntar.
- Las ideas deben estar ancladas a los tipos de contenido prioritarios de `brand.md`.

---

## Paso 1 — Recoger contexto

Antes de generar ideas, necesitas tres datos. Pregunta solo los que falten.

**Preguntas de contexto:**
1. ¿Para qué plataforma? (LinkedIn / Instagram / ambas)
2. ¿Qué quieres lograr con este contenido?
   Opciones: visibilidad, leads, educar, posicionar
3. ¿Hay algún tema o contexto específico que quieras cubrir?
   (Puede ser vago — si no hay nada en mente, "no" está bien)

Ejemplo si el usuario llega sin contexto:
> "Antes de las ideas, dos cosas rápidas: ¿para qué plataforma es el contenido?
> ¿Y qué quieres lograr — que te conozcan, que te contacten, que aprendan algo?"

Si el usuario llega con idea específica (ej. "quiero un carrusel sobre agentes de WhatsApp para Instagram"):
- Plataforma = Instagram, Formato = carrusel, Tema = agentes de WhatsApp
- Saltar las preguntas ya respondidas
- Ir directo al Paso 4 (brief-intake)

---

## Paso 2 — Generar 5 ideas

Genera exactamente 5 ideas ancladas a `brand.md → ## Tipos de contenido prioritarios`.
Mezcla formatos: no todas videos, no todas imágenes.
Varía ángulos: educativo, narrativo, demostración, opinión, caso real.

**Formato de cada idea:**
```
─── Idea [N] ──────────────────────────────────────
Título:    [título concreto en español — no genérico]
Formato:   [video / imagen / carrusel]
Plataforma:[LinkedIn / Instagram]
Objetivo:  [visibilidad / leads / educar / posicionar]
Ángulo:    [qué lo hace distinto a un post genérico]
Hook:      [primera línea o frase de apertura]
Claim:     [la afirmación central — usable como Slide 2 si es carrusel]
────────────────────────────────────────────────────
```

Al terminar las 5 ideas:
> "¿Alguna de estas te convence? Di el número y la desarrollamos.
> Si tienes otra idea en mente, cuéntame y la estructuro igual."

---

## Paso 3 — Generar ideas.html

Después de presentar las 5 ideas, produce el HTML de propuestas
y pide al usuario guardarlo como `ideas.html` en la raíz del proyecto.

Si ya existe `ideas.html`: añadir la nueva sesión al INICIO, antes de las anteriores.

**Template completo de ideas.html (para primera vez):**

```html
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CLARYON — Propuestas de Contenido</title>
<style>
  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
  body { background: #0d0d0d; color: #fff; font-family: -apple-system, BlinkMacSystemFont, 'Helvetica Neue', sans-serif; padding: 40px; }
  .page-title { font-size: 11px; font-weight: 700; letter-spacing: 3px; text-transform: uppercase; color: #693f8c; margin-bottom: 4px; }
  .session-date { font-size: 22px; font-weight: 700; color: #ffffff; margin-bottom: 8px; }
  .session-meta { font-size: 12px; color: #bdb9d7; margin-bottom: 32px; }
  .grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 16px; margin-bottom: 48px; }
  @media (max-width: 900px) { .grid { grid-template-columns: repeat(2, 1fr); } }
  @media (max-width: 600px) { .grid { grid-template-columns: 1fr; } }
  .card { background: #131f3c; border: 1px solid #693f8c; border-radius: 10px; padding: 20px; display: flex; flex-direction: column; gap: 10px; }
  .badge { display: inline-block; background: #693f8c; color: #fff; font-size: 9px; font-weight: 700; letter-spacing: 2px; text-transform: uppercase; padding: 3px 8px; border-radius: 4px; width: fit-content; }
  .card-title { font-size: 15px; font-weight: 700; color: #ffffff; line-height: 1.3; }
  .card-meta { font-size: 11px; color: #693f8c; letter-spacing: 0.5px; }
  .card-angle { font-size: 12px; color: #bdb9d7; line-height: 1.5; }
  .card-hook { font-size: 12px; color: #ffffff; font-style: italic; line-height: 1.5; border-left: 2px solid #693f8c; padding-left: 10px; margin-top: 4px; }
  hr.divider { border: none; border-top: 1px solid rgba(255,255,255,0.05); margin: 0 0 40px; }
</style>
</head>
<body>

<p class="page-title">CLARYON — Propuestas de Contenido</p>

<!-- NUEVA SESIÓN: {FECHA} -->
<p class="session-date">{FECHA}</p>
<p class="session-meta">Plataforma: {PLATAFORMA} &middot; Objetivo: {OBJETIVO}</p>
<div class="grid">

  <div class="card">
    <span class="badge">{FORMATO_1}</span>
    <p class="card-title">{TITULO_1}</p>
    <p class="card-meta">{PLATAFORMA_1} &middot; {OBJETIVO_1}</p>
    <p class="card-angle">{ANGULO_1}</p>
    <p class="card-hook">"{HOOK_1}"</p>
  </div>

  <div class="card">
    <span class="badge">{FORMATO_2}</span>
    <p class="card-title">{TITULO_2}</p>
    <p class="card-meta">{PLATAFORMA_2} &middot; {OBJETIVO_2}</p>
    <p class="card-angle">{ANGULO_2}</p>
    <p class="card-hook">"{HOOK_2}"</p>
  </div>

  <div class="card">
    <span class="badge">{FORMATO_3}</span>
    <p class="card-title">{TITULO_3}</p>
    <p class="card-meta">{PLATAFORMA_3} &middot; {OBJETIVO_3}</p>
    <p class="card-angle">{ANGULO_3}</p>
    <p class="card-hook">"{HOOK_3}"</p>
  </div>

  <div class="card">
    <span class="badge">{FORMATO_4}</span>
    <p class="card-title">{TITULO_4}</p>
    <p class="card-meta">{PLATAFORMA_4} &middot; {OBJETIVO_4}</p>
    <p class="card-angle">{ANGULO_4}</p>
    <p class="card-hook">"{HOOK_4}"</p>
  </div>

  <div class="card">
    <span class="badge">{FORMATO_5}</span>
    <p class="card-title">{TITULO_5}</p>
    <p class="card-meta">{PLATAFORMA_5} &middot; {OBJETIVO_5}</p>
    <p class="card-angle">{ANGULO_5}</p>
    <p class="card-hook">"{HOOK_5}"</p>
  </div>

</div>
<hr class="divider">

</body>
</html>
```

---

## Paso 4 — Pasar contexto a brief-intake

Cuando el usuario elige una idea (o propone la suya), pasar a `brief-intake.md`
con el siguiente bloque de contexto pre-llenado. No re-preguntar lo que ya está aquí.

```
CONTEXTO DESDE CONTENT-IDEAS:
- Plataforma: [plataforma]
- Objetivo: [objetivo]
- Formato: [formato de la idea elegida]
- Tema/título: [título de la idea]
- Ángulo: [ángulo de la idea]
- Hook: [hook de la idea]
- Claim central: [claim — precompletado para carrusel Slide 2]
- Idioma: [es / en — heredar default de brand.md salvo que el contexto indique otro]
- Marcas externas detectadas: [lista de marcas mencionadas en título/ángulo/hook/claim,
  o "ninguna"]
```

`brief-intake.md` recibe este contexto y solo pregunta lo que falta según el formato.

**Detección de marcas externas:** al generar las 5 ideas, si una idea menciona
explícitamente productos o plataformas de terceros (WhatsApp, HubSpot, Shopify,
Mercado Libre, Stripe, Slack, Notion, etc.), incluirlas en la lista.
El skill de generación buscará sus logos en `references/brands/`.
