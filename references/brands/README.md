# Brand Logos Library

Logos de marcas externas que pueden aparecer en carruseles, videos o imágenes.

## Cómo agregar una marca

Colocar el logo en formato PNG con fondo transparente.
Convención de nombres soportada (el skill busca en este orden y toma el primero que exista):

1. `{marca}-white.png` — versión blanca para fondos oscuros
2. `{marca}-on-dark.png` — variante optimizada para fondo oscuro
3. `{marca}-logo.png` — convención general (recomendado si no hay variantes claro/oscuro)
4. `{marca}.png` — fallback

Donde `{marca}` es el nombre en kebab-case (`whatsapp`, `hubspot`, `n8n`, `microsoft`, `mercado-libre`).

Tamaño recomendado: 512×512px o más, PNG transparente.

## Cómo lo usa el agente

Cuando el brief de carrusel menciona una marca externa, `carousel-generation.md`:

1. Normaliza el nombre a kebab-case.
2. Hace el lookup en el orden de arriba.
3. Si encuentra, embebe el PNG en el template HTML del slide correspondiente.
4. Si no, pausa y pregunta antes de continuar.

## Inventario actual

| Marca | Archivo |
|---|---|
| Claude | claude-logo.png |
| Excel | excel-logo.png |
| Instagram | instagram-logo.png |
| Microsoft | microsoft-logo.png |
| n8n | n8n-logo.png |
| WhatsApp | whatsapp-logo.png |
