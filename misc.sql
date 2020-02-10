-- SUBSTITUTION VARIABLES - ACTS AS PLACEHOLDERS FOR COLUMN NAME, WHERE CONDITION AND ORDER BY CLAUSE
SELECT ID, &COL_NAME
FROM STUD
WHERE &CONDITION AND ID='&ID' -- USE SINGLE QUOTES FOR VARCHAR, DATE
ORDER BY &ORDERBYCOL;

-- DEFIINE COMMAND - CREATE A VARIABLE IN CURRENT SESSION AND ASSIGN IT A VALUE
DEFINE EMPLOYEE_ID =1234;
SELECT * FROM EMPLOYEE
WHERE EMPLOYEE_ID =&EMPLOYEE_ID;
UNDEFINE EMPLOYEE_ID;

--ACCEPT: PASS CUSTOM PROMPT AS WELL
ACCEPT EMPLOYEE_ID PROMTP "PLEASE ENTER EMPOYEE ID";
SELECT * FROM EMPLOYEE
WHERE EMPLOYEE_ID =&EMPLOYEE_ID;
UNDEFINE EMPLOYEE_ID;

-- DEFINE AND ASSIGN AT SAME TIME USING &&
SELECT * 
FROM STUD
WHERE STUD_ID = &&ID;
UNDEFINE ID;


--SEQUENCES
CREATE SEQUENCE DEPT_S;
--DICTIONARY TABLE FOR SEQUENCES
SELECT * FROM USER_SEQUENCES; 
--GET NEXT VAL FROM SEQUEENCE
SELECT DEPT_S.NEXTVAL FROM DUAL; 
--INSERT
INSERT INTO DEPT(ID, NAME)VALAUES(DEPT_S.NEXTVAL , 'GROCERY');
--GET CURRENT VAL OF SEQUENCE
SELECT DEPT_S.CURRVAL FROM DUAL;
--DROP SEQUENCE
DROP DEPT_S FROM DUAL;
--START WITH INCREMENT BY
CREATE SEQUENCE DEPT_S START WITH 10 INCREMENT BY 10;
--ALTER SEQUENCE
ALTER SEQUENCE DEPT_S INCREMENT BY 1;


--SYNONYMNS
CREATE SYNONYM E1 FOR HR.EMPLOYEES;
SELECT * FROM E1; 



