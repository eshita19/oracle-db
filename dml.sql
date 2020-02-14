------INSERT STMTS
INSERT INTO HR.DEPARTMENTS(DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
VALUES(71, 'ESH_DEPT', 100, 1700);

--NULL VALUES CAN BE TREATED AS VAR ARGS AND CAN BE OMITTED FROM THE VALUE ASGNMT OR YOU CAN EXPLICTLY INSERT NULLS
INSERT INTO HR.DEPARTMENTS VALUES(71, 'ESH_DEPT', 100, 1700);

-- WE CAN USE EXPRESSSIONS LIKE SYSDATE, TO_DATE() FUNCTIONS WHILE INSERTING VALUE

--USERS TO INPUT DATA USSING &
INSERT INTO HR.DEPARTMENTS(DEPARTMENT_ID, DEPARTMENT_NAME)
VALUES(&dept_id, &dept_name)

--INSERT USING SELECT
INSERT INTO HR.DEPARTMENTS(DEPARTMENT_ID, DEPARTMENT_NAME)
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM HR.DEPARTMENTS;

--INSERTING EXISTING VALUE: UNIQUE CONSTRAINT VIOLATED
--INSERTING FK VALUE NOT EXISTS IN PARENT TABLE: INTEGRITY CONSTRAINT VIOLATED
--INSERTING DATA OF DIFFERENT DATA TYPE, FOR EX: INSERTING STRING FOR NUMBER: INVALID NUMBER
-- INSERTING VALUE MORE THAN LENGTH OF COLUMN: VALUE TOO LARGE


-------UPDATE STATEMENTS
UPDATE HR.EMPLOYEES
SET SALARY=2400, DEPARTMENT_ID=10
WHERE EMPLOYEE_ID=10; 

-- FOR ALL ROWS IN EMPLOYEES TABLE
UPDATE HR.EMPLOYEES
SET SALARY=2400, DEPARTMENT_ID=10; 

--SET NULL VALUES
UPDATE HR.EMPLOYEES
SET DEPARTMENT_ID= NULL;

-- USING SUBQUERY
UPDATE HR.EMPLOYEES
SET SALARY=(SELECT SALARY FROM HR.EMPLOYEES WHERE EMPLOYEE_ID = 100)
WHERE EMPLOYEE_ID=10; 

--UPDATING MULTIPLE COLUMNS SUBQUERY METHOD 1
UPDATE HR.EMPLOYEES
SET (SALARY, DEPARTMENT_ID)=(SELECT SALARY,DEPARTMENT_ID FROM HR.EMPLOYEES WHERE EMPLOYEE_ID = 100)
WHERE EMPLOYEE_ID=10; 

--UPDATING MULTIPLE COLUMNS SUBQUERY METHOD 2
UPDATE HR.EMPLOYEES
SET SALARY = (SELECT SALARY FROM HR.EMPLOYEES WHERE EMPLOYEE_ID = 100),
DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM HR.EMPLOYEES WHERE EMPLOYEE_ID = 100)
WHERE EMPLOYEE_ID=10; 


-------------DELETE STATEMENTS
--DELETE 
DELETE FROM HR.EMPLOYEES
WHERE EMPLOYEE_ID =10;

-- DELETE ALL ROWS
DELETE FROM HR.EMPLOYEES;

--USING SUBQUERY
DELETE FROM HR.EMPLOYEES
WHERE EMPLOYEE_ID IN (SELECT EMPLOYEE_ID FROM HR.EMPLOYEES)

--DELETE RECORDS WHICH IS FOREIGN KEY TO OTHER TABLE: INTEGRITY CONSTRAINT VIOLATED

--TRUNCATE TABLE - ALTERNATIVE OF DELETE ALL ROW. NO ROLLBACK POSSIBLE, CLEARS ROW SPACE AS WELL, NOT DONE IN CASE OF DELETE
TRUNCATE TABLE HR.EMPLOYEES.


-------------MERGE INTO--------------------
/*
MERGE INTO target_table 
USING source_table 
ON search_condition
    WHEN MATCHED THEN
        UPDATE SET col1 = value1, col2 = value2,...
        WHERE <update_condition>
        [DELETE WHERE <delete_condition>]
    WHEN NOT MATCHED THEN
        INSERT (col1,col2,...)
        values(value1,value2,...)
        WHERE <insert_condition>;
*/        
MERGE INTO CUICREPORTDEFINITIONFIELD AS rdf USING CUICREPORTDEFINITION AS rd
ON rdf.parentrptdefid = rd.id AND rd.TYPE != 'SQUERY'
AND rdf.filterfield = 't'
WHEN MATCHED THEN DELETE;


----------------TRIGGERS---------------------------
/*
CREATE [OR REPLACE] TRIGGER trigger_name
{BEFORE | AFTER } triggering_event ON table_name
[FOR EACH ROW]
[FOLLOWS | PRECEDES another_trigger]
[ENABLE / DISABLE ]
[WHEN condition]
DECLARE
    declaration statements
BEGIN
    executable statements
EXCEPTION
    exception_handling statements
END;
*/

--ROW LEVEL TRIGGERS : EXECUTES ONCE FOR EACH ROW IN A TRANSACTION
CREATE OR REPLACE TRIGGER UPDATE_AUDIT
AFTER INSERT ON STUDENT 
FOR EACH ROW 
BEGIN
INSERT INTO STUD_AUDIT(NAME) VALUES(NEW.NAME);
END;

CREATE OR REPLACE TRIGGER customers_audit_trg
    AFTER 
    UPDATE OR DELETE 
    ON customers
    FOR EACH ROW    
DECLARE
   l_transaction VARCHAR2(10);
BEGIN
   -- determine the transaction type
   l_transaction := CASE  
         WHEN UPDATING THEN 'UPDATE'
         WHEN DELETING THEN 'DELETE'
   END;
 
   -- insert a row into the audit table   
   INSERT INTO audits (table_name, transaction_name, by_user, transaction_date)
   VALUES('CUSTOMERS', l_transaction, USER, SYSDATE);
END;

-- STATEMENT LEVEL TRIGGERS - EXECUTES ONCE FOR A TRANSACTION
CREATE OR REPLACE TRIGGER customers_credit_trg
    BEFORE UPDATE OF credit_limit  
    ON customers
DECLARE
    l_day_of_month NUMBER;
BEGIN
    -- determine the transaction type
    l_day_of_month := EXTRACT(DAY FROM sysdate);
 
    IF l_day_of_month BETWEEN 28 AND 31 THEN
        raise_application_error(-20100,'Cannot update customer credit from 28th to 31st');
    END IF;
END;


