--CREATE TABLE with default value to isFEMALE
CREATE TABLE EMP_TEST
( EMP_ID NUMBER,
  PERF_FACTOR NUMBER(3,2),
  BIRTH_DATE DATE,
  NAME VARCHAR2(30),
  ISFEMALE CHAR(1) DEFAULT 'Y');
  
-- USER_TABLES : Query to get info of table you own
-- ALL_TABLES: USER_TABLES + tables you have been given access to.


----CONSTRAINTS: UNIQUE, NULL, CHECK, PRIMARY, FOREIGN
-- CHECK AND FOREIGN KEY CONSTRAINT CAN INSERT NULL VALUES
-- PRIMARY KEY BY DEFAULT NOT NULL.
-- INDEXES ARE CREATED FOR PRIMARY KEY AND UNIQUE CONSTRAINT.

-- COLUMN LEVEL CONSTRAINTS
 CREATE TABLE STUD
 ( STUD_ID VARCHAR(20) CONSTRAINT STUD_PK PRIMARY KEY,
   NUMBER MARKS CONSTRAINT STUD_MARKS_CHECK CHECK(MARKS >20),
   NAME VARCHAR(20) NOT NULL,
   ROLL_NUM VARCHAR(20) UNIQUE
   DEPT_ID VARCHAR(30) CONSTRAINT STUD_FK REFERENCES DEPARTMENT(DEPT_ID));                                                                
 -- TABLE LEVEL CONSTRAINTS : CAN MAKE PRIMARY KEY AND UNIQUE CONSTRAINT COMPOSITE                                                             
 CREATE TABLE STUD
 ( STUD_ID VARCHAR(20),
   NUMBER MARKS,
   NAME VARCHAR(20) NOT NULL, -- NOT NULL HAS TO BE INLINE
   ROLL_NUM VARCHAR(20) 
   DEPT_ID VARCHAR(30),
   CONSTRAINT STUD_PK PRIMARY KEY(STUD_ID, NAME), 
   CONSTRAINT STUD_MARKS_CHECK CHECK(MARKS >20),
   CONSTRAINT STUD_UNIQUE UNIQUE(ROLL_NUM),
   CONSTRAINT STUD_FK (DEPT_ID) REFERENCES DEPARTMENT(DEPT_ID)
 );
                                                                
                                                                
 -- Check constraints
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME="STUD";  

/* ON DELETE CASCADE/NULL
-- DELETING ENTRY FROM TABLE WHOSE COLUMN IN REFERRED IN CHILD TABLE RESULTS IN "INTEGRITY CONSTRAINT" VIOLATION
-- CONSTRAINT STUD_FK (DEPT_ID) REFERENCES DEPARTMENT(DEPT_ID) ON DELETE CASCADE": CAUSES ROWS TO BE DELETED IN BOTH PARENT AND CHILD TABLE.
-- CONSTRAINT STUD_FK (DEPT_ID) REFERENCES DEPARTMENT(DEPT_ID) ON DELETE NULL: SETS THE COLUMN VALUE TO NULL WHOSE FOREGIN KEY HAS BEEN DELETED FROM PARENT TABLE.
*/

-- CREATE TABLE FROM SELECT
-- ONLY NOT NULL CONSTRAINT WILL BE COPIED FROM PARENT TABLE
CREATE TABLE STUD_COPY
AS
SELECT * FROM STUD
WHERE STUD_ID = '1';

CREATE TABLE STUD_COPY(ID, NAME DEFAULT 'A')
AS
SELECT ID, NAME FROM STUD


-- ALTER TABLE: ADD, DROP, MODIFY COLUMN, RENAME COLUMN, SET UNUSED, READ ONLY/READ WRITE, DROP TABLE, RENAME TABLE
--ADD
ALTER TABLE STUD_COPY
ADD (LNAME VARCHAR(20) DEFAULT 'A' NOT NULL,  CREATED_DATE DATE DEFAULT SYSDATE, CREATED_BY VARCHAR2(100) DEFAULT USER);
--ADD CONSTRAINT
ALTER  TABLE STUD_COPY
ADD CONSTRAINT STUD_PRIMARY_KEY PRIMARY KEY(LNAME) DEFERRABLE INITIALLY DEFERRED;-- CONSTRAINT CHECK DEFEERED TILL DML COMMIT
ALTER TABLE STUD_COPY
ADD CONSTRAINT STUD_FK FOREIGN KEY(LNAME)  REFERENCES  STUD(NAME);
-- MODIFY : DATA TYPE, SIZE AND DEFAULT VALUE
ALTER TABLE STUD_COPY
MODIFY (LNAME CLOB(100) DEFAULT 'B' NOT NULL);
--MODIFY CONSTRAINT
ALTER TABLE STUD_COPY
MODIFY LNAME REFERENCES STUD(NAME); 

ALTER TABLE STUD_COPY
RENAME COLUMN LNAME TO LAST_NAME;



--DROP
ALTER TABLE STUD_COPY
DROP (LNAME, CREATED_DATE);
  ALTER TABLE STUD_COPY 
  DROP COLUMN LNAME;
    ALTER TABLE STUD_COPY
    DROP CONSTRAINT STUD_PRIMARY_KEY CASCADE;

--SET UNUSED: FOR COLUMN HAVING LARGE NUMBER OF DATA. IT MAKES COLUMN UNAVAILABLE FOR DML OPS
ALTER TABLE STUD_COPY
SET UNUSED (LNAME);
  ALTER TABLE STUD_COPY
  DROP UNUSED COLUMNS; --DROPS UNUSED COLUMNS
    SELECT * FROM USER_UNUSED_COL_TABS;

--READ ONLY/ READ WRITE
ALTER TABLE STUD_COPY READ ONLY; -- DML, DDL(WHICH CHANGE EXISTING TABLE DATA LIKE DROP, MODIFY) OPERATIONS NOT ALLOWED
ALTER TABLE STUD_COPY READ WRITE; -- DML ALLOWED NOW

ALTER TABLE STUD_COPY
DISABLE CONSTRAINT EMP2_FK;

--DROP TABLE
DROP TABLE STUD_COPY; -- DELETE STUD_COPY TABLE AND MOVE IT TO RECYCLE BIN
DROP TABLE STUD_COPY PURGE; -- DELETE STUD_COPY TABLE FROM RECYCLE BIN AS WELL, LIKE SHIFT+DELETE

--RENAME DB OBJECT : TABLE, VIEW, PROCEDURE
RENAME STUD_COPY TO STUD_COPY_BKP;
ALTER TABLE STUD_COPY
RENAME CONSTRAINT STUD_PRIMARY_KEY TO STUD_PRIMARY_KEY_2;















                                                                
                                                                

                                                                
