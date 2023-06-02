/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Obtenga los apellidos que empiecen por las letras entre la 'd' y la 'k'. La 
salida esperada es la siguiente:

  (Hamilton)
  (Holcomb)
  (Garrett)
  (Fry)
  (Kinney)
  (Klein)
  (Diaz)
  (Guy)
  (Estes)
  (Jarvis)
  (Knight)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.csv' USING PigStorage(',') AS (id: int, name: chararray, lastname: chararray, date: chararray, color: chararray, number: int);

result = FILTER data BY (SUBSTRING(lastname, 0, 1) >= 'D' and SUBSTRING(lastname, 0, 1) <= 'K');
result = FOREACH result GENERATE lastname;

STORE result INTO 'output' USING PigStorage(',');
DUMP result;