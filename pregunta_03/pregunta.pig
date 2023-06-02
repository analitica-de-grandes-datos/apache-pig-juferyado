/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' USING PigStorage('\t') AS (letter: chararray, day: chararray, number: int);

ordered = ORDER data BY number ASC;
limited = LIMIT ordered 5;
result = FOREACH limited GENERATE number AS numer;

STORE result INTO 'output' USING PigStorage(',');
DUMP result;