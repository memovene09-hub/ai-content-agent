# Claryon — Identity

## Negocio
Agencia de automatización e inteligencia artificial para MIPYMEs mexicanas.
Diseña e implementa agentes de IA y flujos automatizados (ventas, atención,
operaciones). Resultados rápidos, sin fricción técnica, acompañamiento cercano.
Audiencia: dueños de negocio, directores comerciales y gerentes de ops en
empresas de 10–200 empleados en México.

Founders detrás de la marca: Memo y Leo. **No aparecen** como personajes
visibles en contenido — la vocera visible es Valeria Cruz.

## Voz de marca
- Profesional y directo — sin rodeos, sin relleno corporativo.
- Cercano sin ser informal — habla de igual a igual con el dueño.
- Orientado a resultados: lo que el cliente gana, no la tecnología.
- Español neutro con naturalidad mexicana. No traducción literal del inglés.
- Autoridad sin pedantería: Valeria sabe de lo que habla y se nota.

## Identidad visual

### Paleta
- `#693f8c` — morado Claryon (acento principal)
- `#131f3c` — dark navy (fondo principal)
- `#bdb9d7` — gris lavanda (texto secundario)
- `#ffffff` — blanco (texto principal)
- `#000000` — negro (uso puntual)

### Iluminación y mood
- Iluminación cinematográfica, oscura, contenida.
- Acentos morados que rebotan en fondo o backlight.
- Mood profesional sereno, tecnología que da confianza.
- **No usar:** estética crema/editorial cálido, oficinas blancas genéricas,
  paletas neón, robots humanoides, jerga visual de IA (chips, neuronas).

### Composición
- Composiciones con negative space generoso para tipografía.
- Sujeto descentrado (regla de tercios) cuando hay headline overlay.
- En piezas tipográficas puras: claim grande, jerarquía clara, sin clutter.

### Tipografía
- Headlines / wordmark: **Fraunces** (Google Font, serif moderno bold).
- Body / labels / UI: **Inter** (Google Font, sans-serif).
- Templates HTML cargan ambas vía `@import` desde Google Fonts CDN.

### Logo
Archivo: `references/claryon-logo.png` (PNG transparente, blanco sobre fondo oscuro).
SVG vectorial opcional: `references/claryon-logo.svg`.
En piezas dark: logo blanco. En piezas claras: usar variante dark si existe.

## Idioma por defecto
Español (México). **Un solo idioma por pieza, nunca mezclar.**
Etiquetas internas localizables:

| Slot | es | en |
|------|-----|----|
| punto | EL PUNTO | THE POINT |
| importa | POR QUÉ IMPORTA | WHY IT MATTERS |
| siguenos | SÍGUENOS | FOLLOW US |

## Tipos de contenido prioritarios
- **Demos de agentes** — flujo automatizado funcionando, resultado tangible visible.
- **Casos de éxito** — antes/después de implementar automatización en una MIPYME.
- **Educación sobre IA** — conceptos simples anclados a problemas reales.
- **Voz experta de Valeria** — thought leadership desde la práctica.

## Plataformas objetivo
LinkedIn (principal, autoridad) e Instagram (visual, impacto rápido).

---

## Motor de generación

**Higgsfield Basic** es el motor principal de generación visual para esta marca.

- **Aplicable a:** demos de agentes, casos educativos, thought leadership,
  video corto de Memo o Leo explicando.
- **Output adaptable por plataforma:** LinkedIn carrusel, Instagram post, Instagram story, etc. La pieza se ajusta al formato destino sin perder identidad.
- **Flujo de trabajo:**
  1. Brief (schema definido abajo) + `identity.md`
  2. Skill ensambla los 6 bloques del template y los envía a Higgsfield
  3. Asset final → staging en `outputs/claryon/` → aprobación humana explícita

Si el brief especifica otro motor por excepción (ej. video pesado), se documenta en `formats.md` como override.

---

## Vocería visible: Memo + Leo

Memo (Guillermo Venegas) y Leo (Leonardo Rodriguez), co-founders de Claryon.
Mexicanos, fundadores de consultoría, visibles en contenido de educación,
demos y thought leadership. Personalizan la autoridad de la marca.

### Criterio de aparición
- **APARECEN:** educativo, demos de agentes, thought leadership, "detrás de Claryon"
- **NO APARECEN:** tipografía pura, infografía de datos, composiciones que compitan
  con copy denso

Regla: su presencia suma autoridad y humanización. Si distrae, no aparecen.

### Contextos típicos
Home office, frente a pantalla con agente o dashboard, explicando en video corto,
trabajando juntos en setup.

### Prompt base reusable
Variables: `{MEMO_O_LEO}`, `{SCENE}`, `{ACTION}`. Mantener consistencia visual
con paleta marca (dark navy #131f3c, morado #693f8c accent).

### Aparición

| Frecuencia | Tipos de contenido |
|---|---|
| **MAYORÍA** (aparecen por defecto) | thought leadership, demos de agentes, educativo, detrás de Claryon |
| **OPCIONAL** (solo si humaniza) | casos narrados |
| **NUNCA** | tipografía pura, infografía de datos |

---

## Sistema de briefs & iteración

### Schema de brief (input al agente)
Todo trabajo de generación parte de un brief con esta forma:

```json
{
  "tipo_contenido": "educativo | caso | demo | thought-leadership",
  "plataforma": "linkedin | instagram-post | instagram-story",
  "incluir_valeria": true,
  "copy": "texto exacto o estructura del mensaje",
  "visual_mood": "cinematográfico oscuro | datos clean | demo en acción",
  "paleta_override": "opcional — solo si se cambia el default navy+morado"
}
```

`incluir_valeria` respeta la tabla de aparición de arriba. `paleta_override` se usa con cautela y solo cuando la pieza lo justifica.

### Schema de `successful-prompts.json` (aprender de éxitos)
Cada pieza aprobada se registra para retroalimentar futuras generaciones:

```json
{
  "id": "unique-id",
  "tipo_contenido": "educativo | caso | demo | thought-leadership",
  "copy_estructura": "patrón del copy que funcionó",
  "valeria_contexto": "cómo apareció (o por qué no apareció)",
  "constraints_clave": ["restricciones que fueron decisivas"],
  "engagement_resultado": "métrica / observación cualitativa",
  "fecha_aprobacion": "YYYY-MM-DD"
}
```

---

## Aplicación por tipo

| Tipo | Visual core | Valeria | Mood / paleta |
|---|---|---|---|
| **Demos de agentes** | Valeria *working*, flujo del agente visible, resultado claro y tangible | Sí | Dark mood, cinematográfico |
| **Casos de éxito** | Before / after visual, datos cuantitativos del impacto | Opcional | Cinematográfico o datos clean |
| **Educativo** | Concepto → ejemplo real → CTA. Tipografía clara, jerarquía fuerte | Opcional | Datos clean, paleta marca |
| **Thought leadership** | Valeria pensando o explicando, claim grande, composición editorial | Sí | Cinematográfico oscuro |
