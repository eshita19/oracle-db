# Oracle-db

## Entity Relationship Model : 
   - It is used to display all the relationships.
   - Entity: Table, Attributes: Columns of Table, Relationship: Foreign References to other tables( 1:1, 1:*, *:1)
   - <img src="https://github.com/eshita19/oracle-db/blob/master/ER_Schema.png"> </img>
## Oracle Setup:
   - Cloud DB: https://livesql.oracle.com/
   - Docker: 
     - docker login
     - Run container: docker run -d -it --name <Oracle-DB> store/oracle/database-enterprise:12.2.0.1
     - User name / PWD: sys/Oradoc_db1
     - Oracle bash: docker exec -it <Oracle-DB> bash -c "source /home/oracle/.bashrc; sqlplus /nolog"
   
## Oracle comments: 
   - Multiline comments: `/*..*/`
   - Single line comments: `--`
   
## Types of SQL statements:
   - Data manipulation Language: SELECT, INSERT, UPDATE, DELETE, MERGE
   - Data definition language: CREATE, ALTER, DROP, RENAME, TRUNCATE, COMMENT
   - Data control language: GRANT, REVOKE
   - Transaction - COMMIT, ROLLBACK, SAVEPOINT
   
## Select statements:SELECT
   - <img src="https://github.com/eshita19/oracle-db/blob/master/operator_precedence.png"></img>
   - https://github.com/eshita19/oracle-db/blob/master/select.sql
   
##  Grouping functions: COUNT, AVG, SUM, MIN, MAX
   - <img src="https://github.com/eshita19/oracle-db/blob/master/group_funcs.png"></img>
   - https://github.com/eshita19/oracle-db/blob/master/multi-row-func.sql
   
## Multi Table joins: JOIN USING, JOIN ON
   - https://github.com/eshita19/oracle-db/blob/master/multi-table.sql
   
## Subqueries:   
   - Single row : Only one row output from subquery.
   - Multi row: Multiple rows retunred by subquery: (IN, ANY, ALL, EXISTS)
   - https://github.com/eshita19/oracle-db/blob/master/subqueries.sql
   
## DML:
   - https://github.com/eshita19/oracle-db/blob/master/dml.sql
   
   
   
   
   
   
   
   
   
  
