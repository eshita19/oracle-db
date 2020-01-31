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
   

## Database Transactions:
  - A database transaction symbolizes a unit of work performed within a database management system against a database, and treated in a coherent and reliable way independent of other transactions.
  - Transactions using : DML, DDL and DCL stmts.
  - Database transactions must be atomic, consistent, isolated and durable--summarized as the ACID acronym.
  - **Explicit transaction control statements**:
    - COMMIT: commit ends transaction by making all pending changes permanent.
    - SAVEPOINT name: marks a savepoint within current transaction.
    - ROLLBACK: ends the current transaction by discarding all pending changes.
    - ROLLBACK TO SAVEPOINT name: rollbacks the current transaction to specified savepoint, discarding any pending changes after the savepoint.
  - Auto commit occurs - DDL, DCL, normal exit from SQL developer
  - Auto Rollback of pending transactions - Abnormal termination of sql developer or system failure.
  - **State of data before COMMIT or ROLLBACK**:
    - Previous state of data can be recovered.
    - Current session can review the changes made in current transaction by issuing select statements.
    - Other session cannot view the results of DML stmts issues in this session.
    - The affected rows are locked. Other sessions cannot change data in current session.
  - **COMMIT ROLLBACK scenarios**:
    - Multiple DMLs followed by DCL will result in autocommit, as DCL will do the autocommit. Hence DML stmts doesn't required autocommit.
    - If any DML stmt fails during transaction, only it's changes will be rollbacked. We need to explicitly use rollback for other previous statements.
    
    
    

   
   
   
   
   
   
   
   
   
  
