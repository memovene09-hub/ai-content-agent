# Plantilla — Prompt Completo

**El agente DEBE ensamblar siempre estos 6 bloques antes de llamar al motor.**
Esto asegura resultados buenos a la primera. Cualquier bloque vacío es un bug.

El prompt final se construye en **inglés** (los motores responden mejor). Solo
el brief del usuario llega en español y se traduce al armar `ESCENA`.

---

## Bloques

### 1. ESCENA
Brief del usuario reescrito como descripción visual concreta y observable.
- Sujeto y acción explícitos
- Verbos en presente
- Sin abstracciones ("comunica autoridad" ❌ → "calm focused expression" ✓)
- 1–3 oraciones

### 2. ESTILO
Extracto literal de `brands/{client_id}/identity.md`: paleta exacta (hex),
descriptores de iluminación, mood y estética. Si la marca tiene un
"prompt base reusable" en identity.md (como Valeria en Claryon), pegarlo aquí.

### 3. REFERENCIAS
Los higgsfield_id de los elements seleccionados de `brands/{client}/elements.json`,
en formato `<<<higgsfield_id>>>`. El skill elige qué elements aplican según el tipo
de pieza y los tags relevantes al brief. Si todos están PENDIENTE, dejar el bloque
explícitamente vacío con la nota `[no references registered yet]` — NO inventar IDs.

### 4. COMPOSICIÓN
Aspect ratio + reglas de encuadre del `brands/{client}/formats.md` para el tipo
elegido. Incluir explícitamente "1080x1350, 4:5 vertical" (o el que corresponda)
y reglas como "subject in right third, left third negative space for overlay".

### 5. TÉCNICO
Tipo de toma (close-up / medium / wide), tipo de luz (natural / cinematic /
practical), nitidez (sharp focus / soft focus), grano si aplica, profundidad.

### 6. EVITAR
Negaciones explícitas:
- `no deformed or readable text, no fake logos, no extra fingers`
- `no AI artifacts, no oversaturated colors`
- `no stock photo aesthetic`
- + las restricciones específicas de la marca (de identity.md → "Qué NO debe aparecer")

---

## Params del motor (fuera del prompt)

Después del prompt textual, el skill arma los params del motor según `engines/router.md`:

```
{
  "model": "<motor>",
  "aspect_ratio": "<de formats.md>",
  "resolution": "<de router.md>",
  ...
}
```

---

## Esqueleto de salida (el skill construye esto)

```
ESCENA: <scene>

ESTILO: <style block from identity.md>

REFERENCIAS: <<<id1>>> <<<id2>>>

COMPOSICIÓN: <composition rules from formats.md>

TÉCNICO: <camera/lighting/focus>

EVITAR: <negations>
```

Junto con los params del motor.

---

## Excepción: tipo `infografia` (Canva)

Si el router resuelve `canva-brief`, NO se aplica esta plantilla. El skill
arma directamente un documento markdown con layout + jerarquía + paleta + texto +
assets de `elements.json`. Salida = brief, no prompt para motor AI.
