# Skill: Image Generation

Carga este skill cuando el usuario pida generar una imagen.
Requiere brand.md cargado antes de continuar.

## Estructura del prompt

```
[Sujeto] + [Composición] + [Estilo visual] + [Paleta de color] + [Mood]
```

Escribe siempre en inglés.

**Ejemplo:**
> "Flat lay of a laptop showing a CRM dashboard with automated leads,
> centered composition, minimal design, deep blue and white color palette,
> clean and professional mood, no people, no clutter"

## Cómo inyectar identidad de marca

1. **Paleta** — usa los colores del brand.md o "clean professional palette" si [PENDIENTE].
2. **Composición** — elige la que mejor comunica el mensaje:
   - Centrada: claridad, foco en producto/UI
   - Regla de tercios: narrativa, contexto
   - Close-up: detalle, impacto
3. **Estilo** — traduce el brand a palabras visuales.
   - Moderno/limpio → "minimal, flat design, lots of white space"
   - Serio pero accesible → "warm neutral tones, grounded composition"
4. **Restricciones** — agrega negaciones explícitas del brand.md.

## Casos de uso y parámetros

| Caso de uso           | Aspect ratio | Resolución sugerida | Notas                         |
|-----------------------|-------------|---------------------|-------------------------------|
| Post LinkedIn         | 1:1 o 4:5   | 1080×1080+          | Texto visible, imagen simple  |
| Carrusel LinkedIn     | 1:1         | 1080×1080           | Consistencia entre slides     |
| Instagram post        | 1:1 o 4:5   | 1080×1080+          | Más visual, menos texto       |
| Thumbnail de video    | 16:9        | 1280×720+           | Contraste alto, texto grande  |
| Portada de campaña    | Variable    | 1920×1080+          | Alta calidad, uso general     |

## Consistencia visual entre imágenes de campaña

Cuando generes múltiples imágenes para la misma campaña:
- Mantén la misma paleta en todos los prompts
- Usa el mismo descriptor de estilo ("minimal", "dark background", etc.)
- Especifica el mismo mood en cada imagen
- Si hay personaje recurrente, describe sus características igual en cada prompt

## Modelos de Higgsfield recomendados

Ejecuta `models_explore` para ver opciones actuales.
Criterio general:
- Fotografía realista → modelos fotorrealistas
- Ilustración / flat design → modelos de arte digital
- UI / pantallas / datos → modelos de render limpio

## Checklist pre-generación

- [ ] ¿El objetivo de la imagen está claro (qué debe comunicar)?
- [ ] ¿El prompt tiene sujeto + composición + estilo + paleta + mood?
- [ ] ¿Están los colores / tono de marca del brand.md?
- [ ] ¿Están las negaciones de lo que NO debe aparecer?
- [ ] ¿El aspect ratio corresponde al caso de uso?
- [ ] ¿El usuario aprobó el prompt antes de ejecutar?
