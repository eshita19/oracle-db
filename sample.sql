------------SELECT STATMENTS-------------------

-- 1. Select all columns and rows
select * from HR.EMPLOYEES;

--2. Select Specific elements
SELECT EMPLOYEE_ID, FIRST_NAME FROM HR.EMPLOYEES;

--3. Arithmetic operations (+,-,*,/)
SELECT employee_id, (salary*100)/2 from HR.EMPLOYEES;

--4. Null is a value which is unknown, unassigned. It is not equivalent to empty
-- Arithmetic operations on a null value results in null value
select last_name, commission_pct, commission_pct+10 from HR.EMPLOYEES

--5. Alias
select last_name as lname, last_name lastname, last_name " lastttt name" from HR.Employees;

-- 6. Concatenation ||, q'( ) for quotes
select first_name || ' ' || last_name  AS FIRST_LAST from HR.EMPLOYEES;
SELECT FIRST_NAME || q'(WORKS IN DEPARTM'''' ENT )' || DEPARTMENT_ID FROM HR.EMPLOYEES;

--7. Distinct - Unique value OF A COLUMN OR COMBINATION OF COLUMNS
SELECT DISTINCT DEPARTMENT_ID FROM HR.EMPLOYEES;
SELECT DISTINCT DEPARTMENT_ID, JOB_ID FROM HR.EMPLOYEES;

-- 8. DESCRIBE OR DESC - DISPLAYES STRUCTURE OF THE TABLE
DESC HR.EMPLOYEES;
DESCRIBE HR.EMPLOYEES;


------------ RESTRICTING AND SORTING DATA----------

-- 9. LIMITING THE ROWS THAT ARE SELECTED USING WHERE.
-- COMPARISON OPERATORS( =, >, >=, <, <=, <>, BETWEEN .. AND..(INCLUSIVE), IN(SET), LIKE, IS NULL
-- CHARACTER AND DATE VALUES ARE ENCLOSED IN SINGLE QUOTATIONS. 
-- DATA IN WHERE CLAUSE IS CASE SENSITIVE.
-- DATE STRING SHOULD BE IN PROPER FORMAT
SELECT *
FROM HR.EMPLOYEES
WHERE EMPLOYEE_ID=100;

SELECT *
FROM HR.EMPLOYEES
WHERE HIRE_DATE= '17-JUN-03';
