set hive.fetch.task.conversion=more;

CREATE TEMPORARY MACRO SIGMOID (x DOUBLE) 1.0 / (1.0 + EXP(-x));
SELECT SIGMOID(2) FROM src LIMIT 1;
EXPLAIN SELECT SIGMOID(2) FROM src LIMIT 1;
EXPLAIN EXTENDED SELECT SIGMOID(2) FROM src LIMIT 1;
DROP TEMPORARY MACRO SIGMOID;

CREATE TEMPORARY MACRO FIXED_NUMBER() 1;
SELECT FIXED_NUMBER() + 1 FROM src LIMIT 1;
EXPLAIN SELECT FIXED_NUMBER() + 1 FROM src LIMIT 1;
EXPLAIN EXTENDED SELECT FIXED_NUMBER() + 1 FROM src LIMIT 1;
DROP TEMPORARY MACRO FIXED_NUMBER;

set macrotest=1;
CREATE TEMPORARY MACRO CONF_TEST() "${hiveconf:macrotest}";
SELECT CONF_TEST() FROM src LIMIT 1;
DROP TEMPORARY MACRO CONF_TEST;

CREATE TEMPORARY MACRO SIMPLE_ADD (x INT, y INT) x + y;
CREATE TEMPORARY MACRO SIMPLE_ADD (x INT, y INT) x + y;
SELECT SIMPLE_ADD(1, 9) FROM src LIMIT 1;
EXPLAIN SELECT SIMPLE_ADD(1, 9) FROM src LIMIT 1;
EXPLAIN EXTENDED SELECT SIMPLE_ADD(1, 9) FROM src LIMIT 1;
DROP TEMPORARY MACRO SIMPLE_ADD;
DROP TEMPORARY MACRO SIMPLE_ADD;

