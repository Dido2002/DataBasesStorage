/*1*/
select FNAME+' '+LNAME AS NAME, SUM(UNIT_PRICE*QUANTITY) AS SUMA
FROM CUSTOMERS C JOIN ORDERS O
ON C.CUSTOMERS_ID = O.CUSTOMER_ID
JOIN ORDER_ITEMS OI
ON OI.ORDER_ID =O.ORDER_ID
GROUP BY FNAME+' '+LNAME
HAVING SUM(UNIT_PRICE*QUANTITY)>10000
ORDER BY SUMA DESC

/*2*/

SELECT NAME, COUNT(EMPLOYEE_ID) AS BROY
FROM DEPARTMENTS D JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY NAME
HAVING COUNT(EMPLOYEE_ID)>5

/*3*/

SELECT NAME,COUNT(EMPLOYEE_ID)AS BROY
FROM DEPARTMENTS D JOIN EMPLOYEES E 
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID 
WHERE COUNTRY_ID = 'US' OR COUNTRY_ID='IT'
GROUP BY NAME
HAVING COUNT(EMPLOYEE_ID)>5

/*4*/

SELECT  NAME,SUM(QUANTITY) AS SUMA
FROM PRODUCTS P JOIN ORDER_ITEMS OI
ON P.PRODUCT_ID = OI.PRODUCT_ID
JOIN ORDERS O 
ON OI.ORDER_ID = O.ORDER_ID
GROUP BY NAME
HAVING SUM(QUANTITY)>500
ORDER BY SUMA DESC


/*5*/

SELECT E.FNAME +' '+E.LNAME AS NAME, M.FNAME+' '+M.LNAME AS MANAGER 
FROM EMPLOYEES E JOIN EMPLOYEES M
ON E.MANAGER_ID=M.EMPLOYEE_ID

/*6*/
SELECT E.FNAME +' '+E.LNAME AS NAME, M.FNAME+' '+M.LNAME AS MANAGER 
FROM EMPLOYEES E LEFT JOIN EMPLOYEES M
ON E.MANAGER_ID=M.EMPLOYEE_ID

/*7*/
SELECT E.FNAME+' '+E.LNAME AS EMPLOYEES, E.SALARY, R.SALARY
FROM EMPLOYEES E JOIN EMPLOYEES R
ON E.SALARY>R.SALARY
WHERE R.FNAME = '?????' AND R.LNAME='??????'

/*8*/
SELECT FNAME+' '+LNAME AS EMPLOYEES, SALARY
FROM EMPLOYEES 
WHERE SALARY>ANY(SELECT SALARY FROM EMPLOYEES
WHERE DEPARTMENT_ID=90)


/*9*/
SELECT FNAME+' '+LNAME AS EMPLOYEES, SALARY
FROM EMPLOYEES 
WHERE SALARY>ALL(SELECT SALARY FROM EMPLOYEES
WHERE DEPARTMENT_ID=100)

/*10*/

SELECT ORDER_ID,ORDER_DATE
FROM ORDERS
WHERE ORDER_DATE > '2008-04-12'

/*11*/
SELECT FNAME+' '+LNAME AS NAME, CONVERT(VARCHAR,HIRE_DATE,109)
FROM EMPLOYEES 
