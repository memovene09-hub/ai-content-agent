# Skill: Content Ideas

Carga este skill cuando el usuario pida ideas de contenido.
Requiere brand.md cargado antes de continuar.

## Información a recopilar antes de generar

Pregunta al usuario lo que no esté claro:

- **Plataforma**: LinkedIn, Instagram, o ambas
- **Objetivo**: visibilidad, educación, generación de leads, posicionamiento
- **Contexto opcional**: evento próximo, temporada, campaña activa, tema específico

Si el usuario no da contexto adicional, genera ideas basadas en los
tipos de contenido prioritarios del brand.md del cliente activo.

## Formato de salida

Genera exactamente **5 ideas**, cada una con esta estructura:

```
### Idea N: [Título corto]
- **Formato**: video / imagen / carrusel
- **Plataforma**: LinkedIn / Instagram / ambas
- **Objetivo**: [qué busca lograr este contenido]
- **Ángulo**: [perspectiva o enfoque que diferencia esta pieza]
- **Gancho inicial**: [primera línea o frame que captura atención]
```

## Reglas de generación

- Cada idea debe anclarse en al menos un tipo de contenido prioritario del brand.md.
- Varía los formatos — no generes 5 videos ni 5 imágenes. Mezcla.
- Varía los ángulos — educativo, narrativo, demostrativo, opinión, caso real.
- El gancho debe ser concreto y funcionar sin contexto previo.
- Si el cliente tiene `[PENDIENTE]` en restricciones visuales, genera ideas
  que no dependan de esos elementos para definir su formato.

## Al terminar las 5 ideas

Pregunta al usuario:
> "¿Quieres desarrollar alguna de estas ideas en video o imagen ahora?"

Si responde que sí, carga el skill correspondiente (`video-generation.md` o
`image-generation.md`) y continúa desde ahí con la idea elegida como punto
de partida.

## Ejemplo de salida

```
### Idea 1: El agente que responde mientras duermes
- **Formato**: video corto (15-30s)
- **Plataforma**: LinkedIn
- **Objetivo**: educación + visibilidad
- **Ángulo**: mostrar el resultado concreto de un agente de WhatsApp en acción
  — mensajes respondidos a las 3am sin intervención humana
- **Gancho inicial**: "Tus clientes te escriben a las 3am. ¿Alguien responde?"

### Idea 2: Antes y después de automatizar ventas
- **Formato**: carrusel
- **Plataforma**: LinkedIn
- **Objetivo**: generación de leads, demostración de valor
- **Ángulo**: comparativa visual: proceso manual vs proceso automatizado
  con Claryon, slide a slide
- **Gancho inicial**: "Así se veía el proceso de ventas de [empresa] antes de Claryon."
```
