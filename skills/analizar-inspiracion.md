# Skill: analizar-inspiracion

Analiza UNA imagen de inspiración y devuelve sus rasgos visuales en JSON.
Helper interno — lo llaman las skills de generación. No se gatilla por el usuario.

## Input
`imagen`: ruta local o URL de una imagen anexada (1 sola por llamada).

## Output (JSON)
Campos obligatorios:
- `composicion`: encuadre, regla compositiva, distribución
- `iluminacion`: tipo, dirección, temperatura, contraste
- `paleta`: array de 4–6 `{hex, rol}` (rol: fondo/sujeto/acento)
- `mood`: array de 3–5 adjetivos
- `sujeto`: qué es y cómo aparece
- `estilo`: descriptor cinematográfico (editorial / lifestyle / still life / etc.)
- `texturas`: array de superficies notables
- `notas`: detalles inusuales o señales de identidad

## Flujo
1. Cargar la imagen con la capacidad de visión del modelo.
2. Llenar cada campo describiendo lo que efectivamente está en la imagen — observación directa, no interpretación.
3. Para `paleta`: 4–6 colores dominantes en hex, asignar rol observado.
4. Devolver el JSON. NO generar prompts, NO decidir motor, NO hablar con el usuario.

## Reglas
- Una sola imagen por llamada. Si llegan más, devolver `{"error":"una sola imagen"}`.
- Si la imagen no es accesible, devolver `{"error":"<motivo>"}` sin inventar datos.
- El caller decide qué hacer con el output (típicamente embeber en bloque `ESTILO`).
