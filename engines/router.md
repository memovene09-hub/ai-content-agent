# Engines Router

Matriz **tipo de pieza → motor + params**. Agnóstica a marca por defecto.
Las marcas declaran overrides en su `brands/{client}/formats.md` si lo necesitan.

**Regla de escalabilidad:** agregar una marca nueva NO requiere editar este archivo.

---

## Matriz por defecto

| Tipo de pieza | Motor | Aspect ratio | Resolución / duración | Notas |
|---|---|---|---|---|
| imagen / foto / post | `nano_banana_2` | hereda de formats.md | 1k | Default económico (1.5 créditos). Subir a 2k o `nano_banana_pro` solo para piezas finales/clave. |
| hero / banner | `nano_banana_2` | 16:9 | 1k | Portadas, headers, thumbnails. Subir a 2k para uso impreso/grande. |
| video / reel | `seedance_2_0` | hereda de formats.md | 720p, 4–15s, `mode=fast` | Default para video corto |
| carrusel (cover) | `nano_banana_2` | hereda de formats.md | 1k | Slide 1 con persona/escena; demás slides son HTML→PNG sin motor AI |
| carrusel (slides tipográficos) | `tools/render-slide.ps1` | hereda de formats.md | local | HTML + Edge headless, sin créditos AI |
| infografía | `canva-brief` | n/a | n/a | NO genera raster. Devuelve brief estructurado en markdown para operador humano en Canva. |
| character / soul training | `soul_2` | n/a | 5–20 referencias | Solo cuando se entrena un Soul Character reusable |

### Tabla de costos (imagen, preflight con `get_cost`)

| Motor | 1k | 2k | Cuándo usar |
|---|---|---|---|
| `nano_banana_2` | **1.5 cr** | 2 cr | Default. Pruebas y la mayoría de las piezas. |
| `nano_banana_pro` | 2 cr | — | Solo cuando se necesita texto nítido/diagramas o calidad máxima. |

**Regla de ahorro:** por defecto `nano_banana_2 @ 1k`. Subir resolución o cambiar a `pro`
es una decisión explícita por pieza, confirmada con el usuario.

---

## Resolución del motor (orden de precedencia)

1. **Override por marca** — si `brands/{client_id}/formats.md` declara un motor distinto para este tipo, ese gana.
2. **Default de la matriz** — el de la tabla de arriba.
3. **Brief explícito** — el usuario puede pedir un motor distinto en el brief; el skill lo respeta solo si confirma con el usuario.

---

## Params por motor

### nano_banana_2 (default de imagen)
```
model: "nano_banana_2"
aspect_ratio: "<de formats.md>"   # 4:5, 9:16, 1:1, 16:9, 21:9, etc.
resolution: "1k"        # default económico; admite 1k/2k/4k
medias: [ ... ]         # referencias (user_uploads + canonical_fallback)
```

### nano_banana_pro (opt-in, calidad máxima / texto-diagramas)
```
model: "nano_banana_pro"
aspect_ratio: "<de formats.md>"
resolution: "1k"        # admite 1k/2k/4k
```

### seedance_2_0
```
model: "seedance_2_0"
aspect_ratio: "<de formats.md>"
duration: 8             # 4–15s, ajustar al brief
mode: "fast"            # fast / standard
resolution: "720p"
```

### canva-brief (no es un motor de Higgsfield)
No emite request a Higgsfield. El skill ensambla un documento markdown
con: layout sugerido, jerarquía visual, paleta exacta, texto/datos, assets
a reutilizar de `brands/{client}/elements.json`. El operador humano lo
toma y arma la pieza en Canva.

### tools/render-slide.ps1 (renderer local)
```
HtmlPath: "<carruseles/{N}/_render/slide{S}.html>"
OutputPath: "<carruseles/{N}/slide{S}.png>"
Width: <de formats.md>
Height: <de formats.md>
```

---

## Cómo el agente usa el router

1. El skill `generar-*` recibe `client_id` + `tipo_pieza` del brief.
2. Lee `brands/{client_id}/formats.md` para resolver aspect_ratio y overrides.
3. Consulta esta matriz para resolver el motor + params base.
4. Aplica overrides de marca si existen.
5. Ensambla el prompt con `prompts/template-prompt-completo.md` (excepto Canva).
6. Llama al motor. Devuelve resultado con status `pendiente de aprobación`.
