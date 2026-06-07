# References

Assets visuales usados por las skills de generación.

---

## Logo principal del cliente activo

Cada cliente declara la ruta de su logo en `clients/{cliente}/brand.md`
bajo `## Identidad visual → Logo path`.

Para Claryon, colocar el archivo en:
- `references/claryon-logo.png` — versión sobre fondo oscuro (texto blanco o morado claro), transparente
- `references/claryon-logo-dark.png` — opcional, versión para fondo claro

Recomendado: PNG transparente, 1024px de ancho mínimo, vector original guardado en `references/claryon-logo.svg` si está disponible.

**Estado actual:** archivo en disco. ✓

Mientras el logo no exista, el skill de carrusel renderiza el wordmark
"CLARYON" en texto plano usando la tipografía declarada en brand.md
(layout idéntico, solo cambia el render del logo).

---

## brands/

Librería de logos de marcas externas que se mencionan en posts
(WhatsApp, HubSpot, Shopify, etc.). Ver `brands/README.md`.

---

## slide-style.png (legacy, no usado en el flujo HTML→PNG)

Antiguamente usado como style reference para Higgsfield cuando los slides
2-4 se generaban vía AI. Con el flujo nuevo HTML→PNG, los slides tipográficos
no pasan por Higgsfield y este archivo deja de ser necesario para esos slides.

Solo se mantiene si en algún momento se vuelve a un flujo AI para Slide 1.
