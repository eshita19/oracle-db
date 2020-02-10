# Oracle-db

## Tips:
  - Distinct used only once and in the begining.
  - char datatype can be created without specifying size. It will take default 1. For varchar we need to specify.
  - Null comes last in order asc. In order to move it first use "Nulls First" with order by.
  - We can use expressions(salary*100), alias, columns not in select in order by clause.
  - select replace('eshita','ita') from dual; --Since the 3rd arg is not specified, it will replace by ''
  - select trim('ta' from 'eshitaaa') from dual; -- Can specify ony on character for trim
  - `SELECT AVG(DECODE(DEPARTMENT_ID, 90, SALARY, NULL)) FROM EMPLOYEES; ` == `SELECT AVG(SALARY) FROM HR.EMPLOYEES WHERE DEPARTMEENT_ID =90;`
  - `Long` column cannot be assigned any constraint except `Not null`. We cannot use Long in `order by` and `group by`.
  - We can use expressions for Group by clause. For date expression should match the one in select.
  - The alternate value for NVL should be of same datatype.
  - Implicit conversion from character to date only happens if day, year in numeric and month in char format.
  - Create copy of table without copying data: `CREATE TABLE EMP_COPY AS SELECT * FROM EMP WHERE 1=2`.

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
    
    , 
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
   - **Constraints**:
     - Primary key: Specify a column or combination of column whose values should be unique per row.
     - Foreign Key: Dependency on other table.
     - Not Null: Column value cannot be null.
     - Unique: Column value should be unique per row.
     - Check: specify condition which should be true for row update.


## Data Dictionary:
  - User data stored in tables.
  - Oracle stores metadata  of these tables in Data dictionary.
  - We have read-only access to Data dictionary. 
  - It has:
     - Definitions of all schema objects(table, views, indexes, synonyms, sequences, procedures, functions, packages, triggers and so on.
     - Table constraints.
     - Oracle users info.
  - Structure: It consists of base tables and views from base tables. sys user is owner. We can access info from the views.
  - View naming convention: USER_:Created by you, All_: Created by you + accessible views, DBA_: DBA views, V$: performance tables.
  - All the dictionary views stored in table `DICTIONARY` => `SELECT * FROM DICTIONARY WHERE TABLE_NAME LIKE '%USER_TAB%';
     
     
  
   
      
      
      
      
  

    

   
   
   
   
   
   
   
   
   
  
