/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (col1: chararray, col2: bag{}, col3: map[]);

result = FOREACH data GENERATE FLATTEN(col3) AS key;
result = GROUP result BY key;
result = FOREACH result GENERATE group, COUNT(result);

STORE result INTO 'output' USING PigStorage(',');
DUMP result;