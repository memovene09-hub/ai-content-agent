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

- **Aplicable a:** demos de agentes, casos educativos, thought leadership.
- **Output adaptable por plataforma:** LinkedIn carrusel, Instagram post, Instagram story, etc. La pieza se ajusta al formato destino sin perder identidad.
- **Flujo de trabajo:**
  1. Brief (schema definido abajo) + `identity.md`
  2. Skill ensambla los 6 bloques del template y los envía a Higgsfield
  3. Asset final → staging en `outputs/claryon/` → aprobación humana explícita

Si el brief especifica otro motor por excepción (ej. video pesado), se documenta en `formats.md` como override.

---

## Personaje visible: Valeria Cruz

Mexicana, ~30 años. Ingeniera en sistemas reconvertida a IA aplicada.
Curiosa, paciente con el cliente, obsesionada con que la tecnología sirva al negocio.

### Físico — LOCK (no cambia)
| Rasgo | Valor |
|---|---|
| Etnia / piel | Latinoamericana mexicana, tono claro-medio cálido (light wheat) |
| Edad aparente | 28–32 |
| Complexión | Media, delgada-atlética |
| Cabello | Castaño oscuro, ondulado natural, largo hasta los hombros |
| Ojos | Café oscuro, almendrados |
| Lentes (firma visual) | Monturas redondas tipo "round" delgadas, metal dorado/bronce mate |
| Pecas | Suaves en el puente de la nariz |
| Maquillaje | Mínimo natural |
| Joyería | Stud pequeño en cada oreja |
| Manos | Uñas cortas naturales |

### Wardrobe — FLEX (cambia por pieza)
Blusa / top / suéter es el elemento variable. El agente propone el color
según el tema (ej. velocidad → blanco; crecimiento → terracota; confianza → navy).

Paleta permitida: blanco, crema, terracota, mostaza apagado, verde bosque, vino,
lila polvo, azul cobalto, gris carbón, negro.
Texturas válidas: seda, knit, oxford, jersey, satinado.
Evitar: neón puro, estampados gritones, slogans, logos visibles.

### Demeanor
Mirada concentrada en pantalla, sonrisa ligera al explicar, manos activas,
postura erguida y relajada. Autoridad sin rigidez.

### Contextos típicos
Home office moderno (escritorio madera oscura), café con laptop, co-working
minimalista, frente a pantalla con agente conversacional o dashboard.

### Prompt base reusable
Variables: `{BLOUSE}`, `{SCENE}`, `{ACTION}`. El resto es lock.

```
A Latin American Mexican woman, late 20s, light wheat skin tone with subtle freckles across the nose bridge,
shoulder-length wavy dark brown hair, dark almond-shaped brown eyes,
thin round gold-metal wireframe glasses, slim athletic build, natural minimal makeup,
calm focused expression with a slight smile. Wearing {BLOUSE}.
{SCENE}. {ACTION}.
Cinematic editorial lighting, dark navy (#131f3c) and warm purple (#693f8c) accents,
modern professional aesthetic, photorealistic, NOT a stock photo.
```

### Higgsfield Soul Character
Estado: PENDIENTE. Cuando haya 5–10 generaciones aprobadas de Valeria,
se entrena un Soul Character. Mientras tanto el prompt base garantiza ~85% de consistencia.

### Valeria — aparición

| Frecuencia | Tipos de contenido |
|---|---|
| **MAYORÍA** (aparece por defecto) | thought leadership, demos de agentes, casos narrados |
| **OPCIONAL** (solo si humaniza sin meter ruido) | educativo / infografía |
| **NUNCA** | tipografía pura, comparativas técnicas |

**Regla de decisión:** antes de incluirla, evalúa si su presencia *suma* (humaniza, da autoridad, narra) o *distrae* (compite con datos, sobrecarga la composición). Si distrae, usa solo gráficos / tipografía.

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
