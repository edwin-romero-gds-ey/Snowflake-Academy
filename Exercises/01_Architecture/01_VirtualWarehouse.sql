---> Switch role to accountadmin to perform all activities
use role accountadmin;

---> Modify the time zone for the account. Recommended
alter account set timezone = 'America/Mexico_City';

---> Create a Virtual Warehouse using default values.
CREATE OR REPLACE WAREHOUSE WH_Default;

---> Create a multi-cluster warehouse (max clusters = 3)
CREATE OR REPLACE WAREHOUSE WH_TEST MAX_CLUSTER_COUNT = 3;

---> Create a Virtual Warehouse using provide a high-performance ML version
CREATE OR REPLACE WAREHOUSE WH_CUSTOM
with 
    COMMENT = 'Custom warehouse with snowpark-optimized'
    WAREHOUSE_SIZE = 'XSMALL'
    MIN_CLUSTER_COUNT = 1
    MAX_CLUSTER_COUNT = 3
    WAREHOUSE_TYPE = 'SNOWPARK-OPTIMIZED'
    AUTO_SUSPEND = 180
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE
    SCALING_POLICY = 'ECONOMY';

---> Visualize all warehouses available
SHOW WAREHOUSES;

---> Switch to an specific warehouse
USE WAREHOUSE WH_TEST;

---> Set warehouse size to xsmall
ALTER WAREHOUSE WH_DEFAULT SET warehouse_size=XSMALL;
ALTER WAREHOUSE WH_CUSTOM SET warehouse_size=MEDIUM;

---> Drop warehouse
DROP WAREHOUSE WH_DEFAULT;

---> Set the auto_suspend and auto_resume parameters
ALTER WAREHOUSE WH_TEST SET AUTO_SUSPEND = 180 AUTO_RESUME = TRUE; 

---> Suspend/Stop a cluster
ALTER WAREHOUSE WH_TEST SUSPEND;

---> Resume a Warehouse
ALTER WAREHOUSE WH_TEST RESUME;


/*

CREATE [ OR REPLACE ] WAREHOUSE [ IF NOT EXISTS ] <name>
        [ [ WITH ] objectProperties ]
        [ objectParams ]

objectProperties ::=
  WAREHOUSE_TYPE = STANDARD | SNOWPARK-OPTIMIZED
  WAREHOUSE_SIZE = XSMALL | SMALL | MEDIUM | LARGE | XLARGE | XXLARGE | XXXLARGE | X4LARGE | X5LARGE | X6LARGE
  MAX_CLUSTER_COUNT = <num>
  MIN_CLUSTER_COUNT = <num>
  SCALING_POLICY = STANDARD | ECONOMY
  AUTO_SUSPEND = <num> | NULL
  AUTO_RESUME = TRUE | FALSE
  INITIALLY_SUSPENDED = TRUE | FALSE
  RESOURCE_MONITOR = <monitor_name>
  COMMENT = '<string_literal>'
  ENABLE_QUERY_ACCELERATION = TRUE | FALSE
  QUERY_ACCELERATION_MAX_SCALE_FACTOR = <num> 0--100

objectParams ::=
  MAX_CONCURRENCY_LEVEL = <num>
  STATEMENT_QUEUED_TIMEOUT_IN_SECONDS = <num>
  STATEMENT_TIMEOUT_IN_SECONDS = <num>
  [ [ WITH ] TAG ( <tag_name> = '<tag_value>' [ , <tag_name> = '<tag_value>' , ... ] ) ]
 
 */


