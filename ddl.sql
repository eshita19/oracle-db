--CREATE TABLE with default value to isFEMALE
CREATE TABLE EMP_TEST
( EMP_ID NUMBER,
  PERF_FACTOR NUMBER(3,2),
  BIRTH_DATE DATE,
  NAME VARCHAR2(30),
  ISFEMALE CHAR(1) DEFAULT 'Y');
  
-- USER_TABLES : Query to get info of table you own
-- ALL_TABLES: USER_TABLES + tables you have been given access to.


----COLUMN LEVEL CONSTRAINTS: UNIQUE, NULL, CHECK, PRIMARY, FOREIGN
-- CHECK AND FOREIGN KEY CONSTRAINT CAN INSERT NULL VLAUES
 CREATE TABLE STUD
 ( STUD_ID VARCHAR(20) CONSTRAINT STUD_PK PRIMARY KEY,
   NUMBER MARKS CONSTRAINT STUD_MARKS_CHECK CHECK(MARKS >20),
   NAME VARCHAR(20) NOT NULL,
   ROLL_NUM VARCHAR(20) UNIQUE
   DEPT_ID VARCHAR(30) CONSTRAINT STUD_FK REFERENCES DEPARTMENT(DEPT_ID));
                                                                
-- Check constraints
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME="STUD"; 
                                                                
 CREATE TABLE STUD
 ( STUD_ID VARCHAR(20),
   NUMBER MARKS,
   NAME VARCHAR(20) NOT NULL, -- NOT NULL HAS TO BE INLINE
   ROLL_NUM VARCHAR(20) 
   DEPT_ID VARCHAR(30),
   CONSTRAINT STUD_PK PRIMARY KEY(STUD_ID, NAME), -- CANNOT ADD COMPOSITE KEY IN METHOD1 
   CONSTRAINT STUD_MARKS_CHECK CHECK(MARKS >20),
   CONSTRAINT STUD_UNIQUE UNIQUE(ROLL_NUM),
   CONSTRAINT STUD_FK (DEPT_ID) REFERENCES DEPARTMENT(DEPT_ID)
 );                                                                
                                                                
                                                                

                                                                