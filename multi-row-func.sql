
--MAX AND MIN FUNCTIONS

--NUMERIC COLUMN
SELECT MAX(SALARY), MIN(SALARY)
FROM HR.EMPLOYEES;

--VARCHAR COLUMN
SELECT MAX(FIRST_NAME), MIN(LAST_NAME)
FROM HR.EMPLOYEES;

-- DATE COLUMN
SELECT MAX(HIRE_DATE), MIN(HIRE_DATE)
FROM HR.EMPLOYEES;


-- COUNT FUNCTION

-- COUNT ALL ROWS INCLUDING NULL
SELECT COUNT(*)
FROM HR.EMPLOYEES;

--SAME AS COUNT ALL ROWS
SELECT COUNT(1)
FROM HR.EMPLOYEES;

-- COUNT DISTINCT NOT NULL COLUMN VALUES
SELECT COUNT(DISTINCT DEPARTMENT_ID)
FROM HR.EMPLOYEES;

-- USE NVL TO CONVERT NULL VALS TO 0
SELECT COUNT(NVL(COMMISSION_PCT, 0)) 
FROM HR.EMPLOYEES;

-- COUNT NUMBER OF EMPLOYEES IN A DEPARTMENT
SELECT COUNT(EMPLOYEE_ID)
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID= 101;

                 
                 -- GROUP BY

--GROUP BY UNIQUE COMBINATION OF DEPT AND JOB ID.
SELECT MIN(SALARY), DEPARTMENT_ID, JOB_ID
FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
ORDER BY 1,2;

--CANNOT USE ALIAS IN GROUPBY
SELECT MIN(SALARY), DEPARTMENT_ID AS DEPT
FROM HR.EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
GROUP BY DEPARTMENT_ID
ORDER BY DEPT;

-- CANNOT USE WHERE TO RESTRICT GROUP FUNCTION USE HAVING FOR IT 
SELECT MIN(SALARY), DEPARTMENT_ID AS DEPT
FROM HR.EMPLOYEES
WHERE COMMISSION_PCT IS  NULL
GROUP BY DEPARTMENT_ID
HAVING MIN(SALARY) > 2100
ORDER BY MIN(SALARY);

