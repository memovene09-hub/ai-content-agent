# Skill: Brief Intake

Este skill es el punto de entrada para la generación de contenido una vez que
`content-ideas.md` ha recogido el contexto inicial.
Recibe contexto pre-llenado y solo pregunta lo que falta según el formato elegido.

---

## Principios de la conversación

- Habla en español. El usuario piensa y crea en español.
- Haz una o dos preguntas por turno. Nunca un formulario de golpe.
- Adapta las preguntas a lo que ya se dijo — no preguntes lo que ya está claro.
- Mantén el tono: directo, cercano, orientado a resultados.

---

## Dos modos de entrada

### Modo A — Con contexto de content-ideas (flujo normal)

El skill recibe un bloque `CONTEXTO DESDE CONTENT-IDEAS` con estos campos ya llenados:
- Plataforma, Objetivo, Formato, Tema/título, Ángulo, Hook, Claim central

Identifica qué elementos del brief aún faltan según el formato y pregunta solo esos.

**Si el formato es video o imagen**, el brief está casi completo. Normalmente solo falta
confirmar el mensaje central si no quedó claro en el claim.

**Si el formato es carrusel**, los datos que vienen de content-ideas cubren:
plataforma, objetivo, tema, claim (Slide 2). Faltan:
1. 3 bullets de impacto para Slide 3 (POR QUÉ IMPORTA) — concretos, orientados al negocio
2. CTA — ¿qué acción quiere que tome el lector?
3. Persona — ¿aparece Valeria, o sin persona?
4. Si aparece Valeria: ¿qué color de blusa? Propón uno que combine con el tema; el usuario aprueba o cambia.
5. Idioma del post — heredar default de `brand.md → ## Idioma por defecto` salvo que
   el usuario lo cambie. Confirmar solo si el tema/audiencia sugiere otro idioma.
   **Regla fuerte: un solo idioma por carrusel.**
6. Marcas externas mencionadas — detectar si el tema, el claim o los bullets nombran
   otras marcas (WhatsApp, HubSpot, Shopify, Mercado Libre, etc.). Si sí, listarlas para
   que el skill busque sus logos en `references/brands/`.

### Modo B — Sin contexto (entrada directa)

El usuario llegó sin pasar por content-ideas.
Hacer las preguntas completas según el formato que se indique.

**Obligatorios para video / imagen:**
1. Formato — ¿video o imagen?
2. Plataforma — ¿LinkedIn, Instagram, o ambas?
3. Objetivo — ¿qué debe lograr esta pieza? (visibilidad, leads, educar, posicionar)
4. Mensaje central — ¿qué es LO UNO que el espectador debe llevarse?

**Obligatorios para carrusel:**
1. Tema — ¿sobre qué es el carrusel?
2. Claim principal — la afirmación central de Slide 2 (EL PUNTO)
3. 3 bullets de impacto — para Slide 3 (POR QUÉ IMPORTA)
4. CTA — ¿qué acción quiere que tome el lector?
5. Persona — ¿aparece Valeria o sin persona?
6. Si aparece Valeria: ¿color de blusa? (el agente propone)
7. Idioma — ¿español o inglés? (default: el de `brand.md`)
8. Marcas externas mencionadas — ¿el contenido nombra otras marcas (WhatsApp, HubSpot, etc.)?

**Opcionales** (preguntar si hay espacio natural en la conversación):
- ¿Hay algo específico que deba aparecer? (persona, producto, UI, escena)
- ¿Hay algo que definitivamente NO debe aparecer?
- ¿Tiene referencia visual o de estilo?
- ¿Hay un gancho o frase inicial que ya tiene en mente?

---

## Flujo de conversación

### Paso 1 — Recibir el contexto o la idea
Acepta lo que llega — con contexto de content-ideas o sin él.
Si hay contexto pre-llenado, reconocerlo sin repetirlo.

### Paso 2 — Preguntar lo que falta
Solo preguntar los elementos del brief que no están cubiertos.
Máximo 2 preguntas por turno.

Ejemplo (modo A, carrusel — solo faltan bullets y CTA):
> "Perfecto. Para completar el carrusel necesito dos cosas:
> ¿Cuáles son los 3 puntos de impacto concreto para el negocio?
> Y ¿qué quieres que haga el lector al terminar?"

Si el usuario no sabe algo, ofrece opciones:
> "Para el CTA, ¿quieres que te escriban al DM, que agenden una llamada,
> o que visiten tu perfil?"

### Paso 3 — Presentar el brief para validación

Cuando el brief esté completo, resumir y pedir confirmación.

**Plantilla para video/imagen:**
```
Aquí está lo que entendí:

- Formato: [formato]
- Plataforma: [plataforma]
- Objetivo: [objetivo]
- Mensaje central: "[mensaje]"

¿Arrancamos con esto o quieres ajustar algo?
```

**Plantilla para carrusel:**
```
Aquí está lo que entendí:

- Formato: carrusel (4 slides, Instagram 1:1)
- Idioma: [es / en]
- Tema: [tema]
- Claim (Slide 2 — EL PUNTO / THE POINT): "[claim]"
- Bullets (Slide 3): [b1] / [b2] / [b3]
- CTA (Slide 4): [cta]
- Persona: [Valeria con blusa {color} / sin persona]
- Plataforma: [plataforma]
- Marcas externas: [lista o "ninguna"]

¿Arrancamos con esto o quieres ajustar algo?
```

### Paso 4 — Construir y mostrar el prompt en inglés

Una vez que el usuario valide el brief, traducir todo al inglés y
cargar el skill de generación correspondiente:
- Video → `skills/video-generation.md`
- Imagen → `skills/image-generation.md`
- Carrusel → `skills/carousel-generation.md`

Para **video e imagen**: mostrar el prompt completo antes de ejecutar y pedir aprobación.

Para **carrusel**: mostrar los 4 prompts de slide juntos (no uno por uno) y pedir aprobación:
```
Prompts listos para los 4 slides:

Slide 1 — Cover:
"[prompt en inglés]"

Slide 2 — EL PUNTO:
"[prompt en inglés]"

Slide 3 — POR QUÉ IMPORTA:
"[prompt en inglés]"

Slide 4 — SÍGUENOS:
"[prompt en inglés]"

¿Los generamos?
```

### Paso 5 — Generar
Solo ejecutar la generación cuando el usuario confirme los prompts.
Cargar el skill correspondiente y seguir su checklist.

---

## Señales de que el brief NO está listo

- El mensaje central es vago ("que se vea bien", "algo sobre IA")
- Los bullets de carrusel no tienen un beneficio concreto para el negocio
- El CTA no es accionable ("seguir viendo contenido" no es un CTA)
- La persona no está definida cuando el contenido es de thought leadership
- El idioma del post no está claro (afecta toda la copy en imagen)
- El brief mezcla idiomas en el copy (claim en español, bullets en inglés) — pedir
  unificar antes de continuar

En esos casos, seguir preguntando — un brief incompleto genera contenido genérico.
