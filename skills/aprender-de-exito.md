# Skill: aprender-de-exito

Captura un patrón que funcionó para reusarlo de referencia en futuras generaciones.
Agnóstico a marca.

## Trigger
El usuario dice: "guardar patrón [nombre]", "este funcionó", "recuerda este prompt", o similar.

## Flujo
1. Identificar `client_id` (de la sesión activa) y el nombre del patrón.
2. Preguntar uno a uno (no formulario):
   - ¿Propósito? (qué problema/contenido resuelve)
   - ¿Tipo de pieza? (imagen | video | carrusel | infografia | hero)
   - ¿Qué `elementos_usados` aplicaron? (nombres de `elements.json` o describir)
   - ¿Qué `constraints` fueron críticos? (lista de descriptores que hicieron que saliera bien — composición, encuadre, evitaciones, parámetros)
   - ¿`tone` / iluminación / composición notables?
   - ¿`tags` para indexar? (proponer desde el contexto, pedir validación)
3. Pre-llenar `id` (slug del nombre), `modelo` (último motor usado en la sesión), `formato` (referencia a `formats.md`), `aprobado_por: "humano"`, `fecha` (ISO de la sesión).
4. `prompt_plantilla`: tomar el prompt final que se usó (de la sesión activa), parametrizar lo variable con `{LLAVES}`.
5. Leer `brands/{client_id}/successful-prompts.json`, append al array `patrones_exitosos`, reescribir.
6. Confirmar: "Guardado: id=`{id}`, tags=`{tags}`. Se usará como referencia cuando un brief tenga estos tags."

## Reglas
- Solo captura cuando el usuario lo marca explícitamente.
- No infiere éxito por su cuenta. No guarda en automático.
- `generar-imagen` / `generar-video` / `generar-carrusel` consultan este archivo antes de construir cada prompt nuevo.
