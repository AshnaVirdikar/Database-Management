SET global max_connections =1000;

set @@global.max_connections =1;

SET SESSION max_connections = 1000;
set @@global.max_connections =1;
set session sql_mode= 'STRICT_TRANS_TABLES, NO_ZERO_DATE, NO_AUTO_CREATE_USER, NO_ENGINE_SUBSTITUTION';