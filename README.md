# AI Content Agent

Agente que genera contenido (videos, imágenes e ideas) para clientes,
manteniendo siempre la identidad de marca del cliente activo. Primer
cliente: Claryon. Diseñado para escalar a más clientes sin modificar el agente.

## Cómo usar

1. Abre una sesión de Claude Code en este directorio.
2. Indica el cliente activo: `"Cliente activo: claryon"`.
3. Pide lo que necesitas:
   - `"Genera un video de demo del agente de WhatsApp para LinkedIn"`
   - `"Quiero una imagen para un post sobre automatización"`
   - `"Dame 5 ideas de contenido para esta semana"`

El agente carga el brand.md del cliente, te muestra el prompt construido
para aprobación, y ejecuta la generación.

## Cómo agregar un cliente nuevo

1. Crea la carpeta `clients/{client-id}/`.
2. Crea `clients/{client-id}/brand.md` — usa `clients/claryon/brand.md` como plantilla.
3. En la próxima sesión, indica el nuevo cliente como activo.

No se modifica ningún otro archivo del agente.

## Skills disponibles

| Lo que pides                            | Skill que se activa        |
|-----------------------------------------|----------------------------|
| "genera un video", "quiero un video"    | `skills/video-generation.md`  |
| "genera una imagen", "quiero una imagen"| `skills/image-generation.md`  |
| "dame ideas", "qué contenido hago"      | `skills/content-ideas.md`     |

## Herramientas requeridas

- **Modelo**: claude-haiku-4-5-20251001
- **MCP**: Higgsfield — `generate_video`, `generate_image`, `media_upload`,
  `media_confirm`, `models_explore`
- **Acceso**: sesión activa en claude.ai con Higgsfield conectado
