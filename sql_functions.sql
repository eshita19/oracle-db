
--SINGLE ROW FUNCTIONS : RETURN ONE RESULT PER ROW
/*
TYPES: CHARACTER(LOWER, UPPER, INITCAP, CONCAT, SUBSTR, LENGTH, INSTR, LPAD, RPAD, TRIM, REPLACE),
         NUMBER(ROUNF, TRUNC, MOD),
         DATE(MONTHS_BETWEEN, ADD_MONTHS, NEXT_DAY, LAST_DAY, ROUND, TRUNC),
         CONVERSION(TO_DATE, TO_CHAR),
         GENERAL(NVL, NVL2, NULLIF, COAELSCE, DECODE, CASE)
*/

-- CHARACTER CASE CONVERSION FUNCTIONS : LOWER, UPPER, INITCAP
SELECT FIRST_NAME, LOWER(FIRST_NAME), UPPER(FIRST_NAME), INITCAP(FIRST_NAME)
FROM HR.EMPLOYEES 
WHERE UPPER(FIRST_NAME) = UPPER('David')
ORDER BY UPPER(FIRST_NAME);


-- OTHER CHARACTER FUNCTIONS: CONCAT, SUBSTR, INSTR, LPAD, RPAD, LENGTH, TRIM, REPLACE
SELECT CONCAT(FIRST_NAME, LAST_NAME) AS FL, (FIRST_NAME || LAST_NAME || FIRST_NAME) AS MULTI_CONCAT_FLF,
       SUBSTR(FIRST_NAME, 0, 3) AS FL_SHORT, INSTR(FIRST_NAME, 'e') AS INDEXOOFCHAR, 
       LPAD(FIRST_NAME, 15, '#') FLPADDEDWITHHASH, RPAD(FIRST_NAME, 10, '@') AS FLPADDEDWITHAT, LENGTH(FIRST_NAME) AS FLLENGTH,
       TRIM(FIRST_NAME) AS FLWITHOUTSPACE, REPLACE(FIRST_NAME, 'E', 'EE') AS EREPLACEDWITHEEE
FROM HR.EMPLOYEES;

SELECT TRIM('ESHITA.   ') || 'MATHUR' FROM DUAL;
SELECT 'MRS' || TRIM(LEADING ' ' FROM '     ESHIITA.  ') || 'MATHUR' FROM DUAL
SELECT 'MRS' || TRIM(TRAILING ' ' FROM '     ESHIITA.  ') || 'MATHUR' FROM DUAL

--NUMBER FUNCTIONS: ROUND, TRUNC,
--ROUNDS OF 1 DECIMAL PLACES: 10.6
SELECT ROUND(10.59, 1) FROM DUAL; 
--TRUNCATESS NUMBER:10.12
SELECT TRUNC(10.1234, 2) FROM DUAL;
--MOD: RETURNS REMAINDER OF DIVISION: 1
SELECT MOD(10,3) FROM DUAL;

/*
DATE FUNCTIONS - ORACLE DATABASE STORES DATE IN NUMERIC INTERNALLY.
BUT DEFAULT DATE FORMAT IS DDF-MM-RR (RR 50-99: 19TH CENTURY, 00-49: 20TH CENTURY)

DATE + NUMBER = DATE (ADD NUMBER OF DAYS TO DATE)
DATE - NUMBER = DATE (SUBTRACT NUMBER OF DAYS FROM DATE)
DATE + NUMEBER/24 = DATE ( ADD HOURS TO DATE)
DATE - DATE = NUMBER OF DAYS
*/
-- ADD DAYS
SELECT SYSDATE+3 FROM DUAL;
--SUBTRACT DAYS
SELECT SYSDATE-3 FROM DUAL;
-- ADD ONE HOUR
SELECT SYSDATE + 1/24 FROM DUAL;
-- NUMBER OF DAYS BETWEEN TWO DATES: 3 DAYS
SELECT (SYSDATE+3) - SYSDATE FROM DUAL;
--MOINTHS BETWEEN TWO DATES: 1 MONTH
SELECT ROUND(MONTHS_BETWEEN(SYSDATE+30, SYSDATE)) FROM DUAL;
-- ADD MONTHS TO DATE: BOTH POSTIVIE AND NEGATIVE MONTHS VAL ALLOWED
SELECT ADD_MONTHS(SYSDATE, 4) FROM DUAL;
-- GET THE NEXT DAY WHICH IS THE GIVEN DAY(IN STRING OR NUMERIC(1 TO 7) REPRESENTATION
SELECT NEXT_DAY(SYSDATE, 'FRIDAY') FROM DUAL;
--PICK LAST DAY OF MONTH
SELECT LAST_DAY(SYSDATE) FROM DUAL;                      
--ROUND: FOMAT MODEL: MONTH(1st to 15th: Current month 1st, 16th to 31st: Next month 1st), Year(1st to 6th:Jan Current year, 7th to 12th : Jan next year)
-- ROUND(17-JUN-03) => 01-JUL-03
SELECT EMPLOYEE_ID,HIRE_DATE, ROUND(HIRE_DATE, 'MONTH') FROM HR.EMPLOYEES;
--TRUNC: ROUNDS OF TO 1ST DATE OF MONTH ALWAYS
-- TRUNC(05-JUN-03) => 01-JUN-03
SELECT EMPLOYEE_ID,HIRE_DATE, TRUNC(HIRE_DATE, 'MONTH') FROM HR.EMPLOYEES;




