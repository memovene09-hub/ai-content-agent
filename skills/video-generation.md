# Skill: Video Generation

Carga este skill cuando el usuario pida generar un video.
Requiere brand.md cargado antes de continuar.

## Estructura del prompt

```
[Sujeto] + [Acción] + [Ambiente] + [Estilo visual] + [Mood]
```

Escribe siempre en inglés — Higgsfield responde mejor a prompts en inglés.

**Ejemplo:**
> "Small business owner reviewing automated WhatsApp messages on a laptop,
> modern clean office, deep blue and white palette, slow push-in camera,
> professional and approachable mood, no stock photo aesthetic"

## Cómo inyectar identidad de marca

1. **Colores** — menciona los colores del brand.md como descriptores de ambiente.
   - Si [PENDIENTE]: usar "clean, professional color palette" como placeholder.
2. **Tono** — traduce el tono de comunicación a descriptores cinematográficos.
   - Profesional/directo → "clean composition, confident framing"
   - Cercano → "warm lighting, natural setting"
3. **Restricciones** — incluye negaciones explícitas de lo que NO debe aparecer.
   - "no humanoid robots, no neon colors, no generic stock imagery"
4. **Contexto de negocio** — ancla la escena al sector y audiencia del cliente.
   - "Mexican SMB context, real business environment"

## Parámetros por tipo de contenido

| Tipo                | Aspect ratio | Duración   | Estilo                        |
|---------------------|-------------|------------|-------------------------------|
| LinkedIn            | 16:9        | 15–30s     | Profesional, corporativo moderno |
| Instagram Reels     | 9:16        | 15–30s     | Dinámico, ritmo rápido        |
| Demo de producto    | 16:9        | 30–60s     | Limpio, con texto superpuesto |
| Thought leadership  | 16:9 o 1:1  | 30–60s     | Sobrio, autoridad visual      |

## Modelos de Higgsfield recomendados

Ejecuta `models_explore` antes de elegir — los modelos se actualizan.
Criterio general:
- Escenas realistas con personas → modelos de video fotorrealista
- Motion graphics / UI en pantalla → modelos de animación limpia
- Clips atmosféricos / b-roll → modelos cinematográficos

## Checklist pre-generación

- [ ] ¿El objetivo del video está claro (qué acción busca generar)?
- [ ] ¿El prompt tiene sujeto + acción + ambiente + estilo + mood?
- [ ] ¿Están presentes los colores / tono de marca?
- [ ] ¿Están las negaciones de lo que NO debe aparecer?
- [ ] ¿La plataforma de destino está definida?
- [ ] ¿El aspect ratio corresponde a la plataforma?
- [ ] ¿El usuario aprobó el prompt antes de ejecutar?

## Prompts: bien construido vs genérico

**Genérico (evitar):**
> "Make a video about AI for businesses"

**Bien construido:**
> "Close-up of a smartphone screen showing a WhatsApp Business automation
> flow, messages appearing one by one with smooth animation, dark background
> with subtle blue accent lighting, minimal and modern aesthetic, no people
> visible, professional mood, 16:9"
