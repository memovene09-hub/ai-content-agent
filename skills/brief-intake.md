# Skill: Brief Intake

Este skill es el punto de entrada para toda generación de contenido.
Se activa cuando el usuario tiene una idea, sin importar qué tan vaga o incompleta sea.
El objetivo: construir un brief completo a través de conversación, en español,
antes de tocar ningún prompt ni herramienta de generación.

---

## Principios de la conversación

- Habla en español. El usuario piensa y crea en español — no lo obligues a cambiar.
- Haz una o dos preguntas por turno. Nunca un formulario de golpe.
- Adapta las preguntas a lo que ya se dijo — no preguntes lo que ya está claro.
- Mantén el tono del agente: directo, cercano, orientado a resultados.
- Si el usuario ya dijo algo sobre el formato o la plataforma, úsalo. No lo repitas.

---

## Elementos del brief completo

El brief está completo cuando tienes los cuatro elementos obligatorios.
Los opcionales enriquecen el prompt si el usuario los da, pero no los exijas.

**Obligatorios:**
1. **Formato** — ¿video o imagen?
2. **Plataforma** — ¿LinkedIn, Instagram, o ambas?
3. **Objetivo** — ¿qué debe lograr esta pieza? (visibilidad, leads, educar, posicionar)
4. **Mensaje central** — ¿qué es LO UNO que el espectador debe llevarse?

**Opcionales (preguntar si hay espacio natural en la conversación):**
- ¿Hay algo específico que deba aparecer? (persona, producto, UI, escena)
- ¿Hay algo que definitivamente NO debe aparecer?
- ¿Tiene referencia visual o de estilo? (un video que le gustó, una estética)
- ¿Hay un gancho o frase inicial que ya tiene en mente?

---

## Flujo conversacional

### Paso 1 — Recibir la idea
El usuario da su idea. Puede ser una frase, una pregunta, algo muy vago.
Acepta cualquier formato. No corrijas ni reformules todavía.

Ejemplo de entrada del usuario:
> "Quiero hacer algo sobre cómo un agente de WhatsApp le ahorra tiempo a un negocio"

### Paso 2 — Preguntar lo que falta
Identifica qué elementos del brief ya están cubiertos y pregunta solo por lo que falta.
Máximo dos preguntas por turno.

Ejemplo de respuesta del agente:
> "Buena idea. Dos cosas rápidas: ¿lo ves como video o imagen?
> ¿Y lo quieres para LinkedIn, Instagram, o los dos?"

### Paso 3 — Completar el brief
Continúa la conversación hasta tener los 4 elementos obligatorios.
Si el usuario da respuestas cortas, ayúdalo a profundizar sin presionar.

Si en algún momento el usuario no sabe algo (ej. "no sé qué objetivo"), ofrece opciones:
> "¿Quieres que la gente te conozca, que entienda cómo funciona el agente,
> o que te contacte para pedirlo?"

### Paso 4 — Presentar el brief para validación
Cuando tengas los 4 obligatorios, resume el brief y pide confirmación.
Usa un formato limpio y legible.

```
Aquí está lo que entendí:

- Formato: video corto (15-30s)
- Plataforma: LinkedIn
- Objetivo: mostrar el valor del agente de WhatsApp a dueños de negocio
- Mensaje central: "Tu agente responde mientras tú te dedicas a lo importante"

¿Arrancamos con esto o quieres ajustar algo?
```

### Paso 5 — Construir y mostrar el prompt en inglés
Una vez que el usuario valide el brief, traduce todo a un prompt en inglés
siguiendo la estructura del skill de generación correspondiente:
- Video → `skills/video-generation.md`
- Imagen → `skills/image-generation.md`

Integra la identidad de marca del brand.md del cliente activo:
colores, tono, restricciones visuales, contexto de negocio.

Muestra el prompt al usuario antes de ejecutar:
```
Prompt listo:

"Small business owner glancing at phone with relief as WhatsApp messages
appear automated on screen, clean office setting, deep blue background,
smooth camera pull-back, professional and warm mood, no stock imagery,
no visible typing or human intervention — 16:9, LinkedIn"

¿Lo generamos?
```

### Paso 6 — Generar
Solo ejecuta la generación cuando el usuario confirme el prompt.
Carga el skill de generación correspondiente y sigue su checklist.

---

## Qué hacer si la idea ya está muy clara desde el inicio

Si el usuario da una idea con todos los elementos del brief en el primer mensaje,
no hagas preguntas innecesarias. Resume, confirma y avanza al prompt directamente.

> "Perfecto, tengo todo lo que necesito. Aquí el prompt:"

---

## Señales de que el brief NO está listo todavía

- No se sabe el formato (video o imagen)
- No se sabe la plataforma de destino
- El mensaje central es vago ("que se vea bien", "algo sobre IA")
- El objetivo no está definido más allá de "quiero publicar algo"

En esos casos, sigue preguntando — un brief incompleto genera contenido genérico.
