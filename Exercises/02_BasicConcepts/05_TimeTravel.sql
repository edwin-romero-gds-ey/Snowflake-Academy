---> Keywords
/*
 AT|BEFORE
 timestamp => '2026-02-11 12:00:00' Specific time.
 offset => '20' Number of seconds.
 statement => '01c260be-0005-267c-0000-6fbd0001be6a' Query ID
*/

---> Check current session timezone
SHOW PARAMETERS LIKE 'TIMEZONE' IN SESSION;

---> Check the current status of the previously created tables.
select table_name, created, last_altered, last_ddl, retention_time
from information_schema.tables
where table_schema = 'TEST_SCHEMA';

---> Check the current records of the table
select * from test_tbl;

---> Modify the current session timezone.
-- Time travel is not affected by the account or the session time zone, 
-- it is restricted to use UTC timezone.
alter session set timezone = 'UTC';

---> Show the successful insert statements to collect the query IDs
SELECT
    query_id,
    query_text,
    execution_status,
    start_time,
    end_time,
    total_elapsed_time/1000 AS elapsed_seconds,
    user_name
FROM SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY
WHERE query_type = 'INSERT'
  AND database_name = 'TEST_DB'
  AND schema_name = 'TEST_SCHEMA'
  AND execution_status = 'SUCCESS'
  AND start_time >= DATEADD(day, -30, CURRENT_TIMESTAMP) -- last 30 days
ORDER BY start_time DESC;

---> Check all query types executed successfully.
select distinct query_type 
from SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY
where execution_status = 'SUCCESS';


---> Use time travel BEFORE with statement
select * from test_tbl 
BEFORE(statement => '01c2652c-0005-267c-0000-6fbd0001d03a');

---> Use time travel AT with statement
select * from test_tbl 
AT(statement => '01c2652c-0005-267c-0000-6fbd0001d03a');

---> Calculate the number of seconds for a given timestamp and current time.
select 
 datediff(
    second,
    to_timestamp('2026-02-13 17:40:32.454 -0600'),
    current_timestamp
 ) as seconds_diff;

---> Use time travel BEFORE with OFFSET
select * from test_tbl
BEFORE(OFFSET => -380);

---> Use time travel AT with OFFSET
select * from test_tbl
AT(OFFSET => -350);

---> Use time travel BEFORE with TIMESTAMP
select * from test_tbl
BEFORE(TIMESTAMP => '2026-02-13 23:40:32.454 +0000');

---> Use time travel AT with TIMESTAMP
select * from test_tbl
AT(TIMESTAMP => '2026-02-13 23:40:32.454 +0000');




