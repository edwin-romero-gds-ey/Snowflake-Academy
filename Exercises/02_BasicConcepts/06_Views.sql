/*
    * Non-Materialized View
        Typical View, No storage data
    * Materialized View
        Behaves like a table
        Serverless
        Faster
        Restricted/Limited -- e.g. It cannot contain joined tables.
    * Secure View
        Extra layer of security
        Can be implemented in Non-Materialized and Materialized views.
 */


---> Create a Non-Materialized View
create or replace view test_view as 
select first_name, last_name, active, rate
from test_tbl;

---> Validate records 
select * from test_view;

---> Create a Materialized View with simple transformation.
create or replace materialized view test_mv as 
select id, concat(last_name, ', ', first_name) as name, rate
from test_tbl
where active = True;

select * from test_mv;

---> Create a Secure Materialized View with simple transformation.
create or replace secure materialized view test_mv_secure as 
select id, concat(last_name, ', ', first_name) as name, rate, branch_location
from test_tbl
where active = True;

---> Check Views status
show views;


---> Create & Grant privileges to another user to display secure view restrictions.
use role accountadmin;

-- 1. Create the role
CREATE or replace ROLE analyst_role;

-- 2. Create the user (if not already created)
CREATE or replace USER my_new_user
  PASSWORD = 'StrongPassword123'
  DEFAULT_ROLE = analyst_role
  MUST_CHANGE_PASSWORD = TRUE;

-- 3. Grant the role to the user
GRANT ROLE analyst_role TO USER my_new_user;

-- 4. Grant privileges to the role (NOT the user)
GRANT USAGE ON DATABASE test_db TO ROLE analyst_role;
grant usage on schema test_schema to role analyst_role;
grant usage on warehouse wh_test to role analyst_role;
grant select on view test_db.test_schema.test_mv to role analyst_role;
grant select on view test_db.test_schema.test_mv_secure to role analyst_role;

---> Execute this in snowsight as the recently created user.
---> Review DDL statement for the existing views
select get_ddl('view', 'test_mv');
select get_ddl('view', 'test_db.test_schema.test_mv_secure');



