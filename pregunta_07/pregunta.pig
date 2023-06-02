/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (col1: chararray, col2: bag{}, col3: map[]);

result = FOREACH data GENERATE col1, SIZE(col2) AS count2, SIZE(col3) AS count3;
result = ORDER result BY col1, count2, count3;

STORE result INTO 'output' USING PigStorage(',');
DUMP result;