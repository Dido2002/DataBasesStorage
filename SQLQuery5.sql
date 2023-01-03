/* 1. Да се изведат идентификаторите на държавите, 
в които има клиенти или отдели на фирмата */
SELECT COUNTRY_ID FROM CUSTOMERS
UNION
SELECT COUNTRY_ID FROM DEPARTMENTS
ORDER BY COUNTRY_ID


/* 2. Да се изведат всички малки имена на клиенти 
и служители с евентуалните повторения, сортирайте в 
низходящ ред по име.*/
SELECT FNAME FROM CUSTOMERS
UNION ALL
SELECT FNAME FROM EMPLOYEES
ORDER BY FNAME DESC

/* 3. Да се изведат идентификаторите на държавите,
в които има едновременно клиенти и отдели на фирмата. */

SELECT COUNTRY_ID FROM CUSTOMERS
INTERSECT
SELECT COUNTRY_ID FROM DEPARTMENTS
ORDER BY COUNTRY_ID
/* 4. Да се изведат идентификаторите на държавите, 
в които има клиенти и в същото време няма отдели на фирмата. */
SELECT COUNTRY_ID FROM CUSTOMERS
EXCEPT
SELECT COUNTRY_ID FROM DEPARTMENTS

/* 5.Изведете имената на държавите и 
имената на регионите, в които се намират*/
SELECT COUNTRIES.NAME AS COUNTRY_NAME, 
		REGIONS.NAME AS REGION_NAME
FROM REGIONS JOIN COUNTRIES
ON COUNTRIES.REGION_ID=REGIONS.REGION_ID

/* 6. Изведете имената на държавите и 
имената на регионите, в които се намират, 
нека в резултата участват и регионите, 
в които няма държави.*/
SELECT COUNTRIES.NAME AS COUNTRY_NAME, 
REGIONS.NAME AS REGION_NAME
FROM REGIONS LEFT JOIN COUNTRIES
ON COUNTRIES.REGION_ID=REGIONS.REGION_ID

/* 7. Изведете имената на държавите и 
имената на регионите, в които се намират, 
нека в резултата участват държавите, които нямат региони*/
SELECT COUNTRIES.NAME AS COUNTRY_NAME, 
REGIONS.NAME AS REGION_NAME
FROM REGIONS RIGHT JOIN COUNTRIES
ON COUNTRIES.REGION_ID=REGIONS.REGION_ID

--
SELECT C.NAME AS COUNTRY_NAME, 
R.NAME AS REGION_NAME
FROM COUNTRIES C LEFT JOIN REGIONS R
ON C.REGION_ID=R.REGION_ID

/* 8.Изведете имената на държавите и 
имената на регионите, в които се намират, 
нека в резултата участват държавите,
които нямат регионите, в които няма държави*/
SELECT C.NAME AS COUNTRY_NAME, 
R.NAME AS REGION_NAME
FROM COUNTRIES C FULL JOIN REGIONS R
ON C.REGION_ID=R.REGION_ID
 
/* 9. Изведете имената на клиентите и 
броя поръчки, които са правили. 
Подредете резултата по брой поръчки низходящо*/
SELECT FNAME+' '+LNAME AS NAME, COUNT(ORDER_ID) AS BROY
FROM CUSTOMERS C JOIN ORDERS O
ON C.CUSTOMERS_ID=O.CUSTOMER_ID
GROUP BY FNAME+' '+LNAME
ORDER BY 2 DESC

/* 10. Изведете имената на клиентите и броя поръчки, 
нека в резултата участват и  клиентите, които не са 
правили поръчки до момента. Подредете по брой поръчки низходящо*/
SELECT FNAME+' '+LNAME AS NAME, COUNT(ORDER_ID) AS BROY
FROM CUSTOMERS C LEFT JOIN ORDERS O
ON C.CUSTOMERS_ID=O.CUSTOMER_ID
GROUP BY FNAME+' '+LNAME
ORDER BY 2 DESC

/* 11. Изведете имената на служителите и наименованието 
на длъжността им*/
SELECT FNAME+' '+LNAME AS NAME, JOB_TITLE 
FROM EMPLOYEES E JOIN JOBS J
ON E.JOB_ID=J.JOB_ID

/* 12. Изведете имената на клиентите и общата стойност 
на поръчките, които са направили*/
SELECT CONCAT(C.FNAME, ' ', C.LNAME) AS NAME, 
SUM(OI.UNIT_PRICE*OI.QUANTITY) AS TOTAL
FROM CUSTOMERS AS C JOIN ORDERS AS O
ON C.CUSTOMERS_ID=O.CUSTOMER_ID
JOIN ORDER_ITEMS AS OI 
ON OI.ORDER_ID=O.ORDER_ID
GROUP BY CONCAT(C.FNAME, ' ', C.LNAME)
ORDER BY TOTAL DESC
-- 
SELECT FNAME+' '+LNAME AS NAME, SUM(UNIT_PRICE*QUANTITY) AS SUMA
FROM CUSTOMERS C  JOIN ORDERS O
ON C.CUSTOMERS_ID=O.CUSTOMER_ID
JOIN ORDER_ITEMS OI
ON O.ORDER_ID=OI.ORDER_ID
GROUP BY FNAME+' '+LNAME
ORDER BY SUMA DESC


/* 11. Изведете номерата на отделите, 
броя служители в тях и съответната средна заплата*/
SELECT DEPARTMENT_ID, AVG(SALARY) AS SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID

/* 12. Изведете номерата на продуктите и 
общото количество, в което са били поръчани*/
SELECT PRODUCT_ID, SUM(QUANTITY) AS SUMA
FROM ORDER_ITEMS
GROUP BY PRODUCT_ID

/* 13. Изведете ид-тата на длъжностите и 
средната заплата за всяка от тях*/
SELECT JOB_ID, AVG(SALARY) AS SALARY
FROM EMPLOYEES
GROUP BY JOB_ID

/* 14. Изведете номерата на клиентите и броя поръчки, 
които са правили.
Подредете резултата по брой поръчки низходящо*/
SELECT CUSTOMER_ID, COUNT(ORDER_ID) AS ORDERS
FROM ORDERS
GROUP BY CUSTOMER_ID
ORDER BY 2 DESC