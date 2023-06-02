/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.csv' USING PigStorage(',') AS (id: int, firstname: chararray, lastname: chararray, date: chararray, color: chararray, number: int);

grouped = GROUP data BY SUBSTRING(date, 0, 4);
result = FOREACH grouped GENERATE group AS year, COUNT(data) AS count;

STORE result INTO 'output' USING PigStorage(',');
DUMP result;