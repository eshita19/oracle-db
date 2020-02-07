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

## SET:
   - https://github.com/eshita19/oracle-db/blob/master/set.sql
   

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
    - The affected rows are locked. Other sessions cannot change data in current session. Any DML statements triggered for same session will hang and wait untill the other session has commited.
  - **COMMIT, ROLLBACK, SAVEPOINT scenarios**:
    - Multiple DMLs followed by DCL will result in autocommit, as DCL will do the autocommit. Hence DML stmts doesn't required autocommit.
    - If any DML stmt fails during transaction, only it's changes will be rollbacked. We need to explicitly use rollback for other previous statements.
    - Savepoint is like talking snapshots of the current state of transaction. Declaration `SAVEPOINT A`. We can revert to particular snapshot by calling `ROLLBACK TO SAVEPOINT A`.
  - **Locking the record using SELECT**:
    - `SELECT * FROM EMPLOYEE WHERE EMPLOYEE_ID = 100 FOR UPDATE`: Using `For UPDATE`, the record will be locked even with select statement. So no other sesssion can manipulate record. It will be unlocked only when the previous session calls commit/rollback.
    - We can specify `FOR UPDATE no wait` if we want current session to fail fast with "resource busy" error instead of hanging, if the record is locked by other seesion.
    
    
## DDL(Data definition Language) : CREATE, ALTER, DROP, RENAME, TRUNCATE)
   - Table naming convention: (A-Z, a-z, _, $, #), no reserved oracle keywords.
   - Table names are case insensitive.
   -  **Datatypes**:
      - varchar2(size), MAX- 4000 bytes: It occupies space equal to length of characters stored. Passing size is mandatory.
      - char(size), MAX- 2000: It always occupies space equal to size.
      - Number(p,s), Precision=1 to 38, scale= -84 to 127: Precision total number of decimal digits. Scale number of digits to the right of decimal point. ex: Number(5,3)- 500(not valid), 1.34(valid), 1.345678(valid - decimal values upto scale will be retained)
      - Date : Date and time values to nearest second.
      - Long: varchar data upto 2GB.
      - CLOB: Stores characters upto 4GB * DB Block size(number of cols we can define a table 100).
      - NCLOB: Handles unicode character.
      - RAW: Stores binary data upto 4000 bytes.
      - Long RAW: Stores binary data upto 2GB.
      - BLOB: Stores binary data upto 4 GB.
      - ROWID: Base64 string representing unique address of row in its table.
      - Timestamp: Date with fractional seconds.
      - Interval Year to Month: Stored as an interval of years and month. 1-2 : 1year 2months.
      - Interval Day to Second: days-hours-minutes-seconds.
      
      
      
  

    

   
   
   
   
   
   
   
   
   
  
