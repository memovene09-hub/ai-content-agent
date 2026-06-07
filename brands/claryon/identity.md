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

### Cuándo aparece
**Sí:** thought leadership, demos donde "se muestra trabajando", casos de éxito narrados, contenido educativo donde explica.
**No:** tipografía pura, anuncios de producto sin narrador, comparativas técnicas, infografías puras.

Default LinkedIn: aparece. Default Instagram visual rápido: opcional.
