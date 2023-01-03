/* 1. �� �� ������� ���������������� �� ���������, 
� ����� ��� ������� ��� ������ �� ������� */
SELECT COUNTRY_ID FROM CUSTOMERS
UNION
SELECT COUNTRY_ID FROM DEPARTMENTS
ORDER BY COUNTRY_ID


/* 2. �� �� ������� ������ ����� ����� �� ������� 
� ��������� � ������������ ����������, ���������� � 
�������� ��� �� ���.*/
SELECT FNAME FROM CUSTOMERS
UNION ALL
SELECT FNAME FROM EMPLOYEES
ORDER BY FNAME DESC

/* 3. �� �� ������� ���������������� �� ���������,
� ����� ��� ������������ ������� � ������ �� �������. */

SELECT COUNTRY_ID FROM CUSTOMERS
INTERSECT
SELECT COUNTRY_ID FROM DEPARTMENTS
ORDER BY COUNTRY_ID
/* 4. �� �� ������� ���������������� �� ���������, 
� ����� ��� ������� � � ������ ����� ���� ������ �� �������. */
SELECT COUNTRY_ID FROM CUSTOMERS
EXCEPT
SELECT COUNTRY_ID FROM DEPARTMENTS

/* 5.�������� ������� �� ��������� � 
������� �� ���������, � ����� �� �������*/
SELECT COUNTRIES.NAME AS COUNTRY_NAME, 
		REGIONS.NAME AS REGION_NAME
FROM REGIONS JOIN COUNTRIES
ON COUNTRIES.REGION_ID=REGIONS.REGION_ID

/* 6. �������� ������� �� ��������� � 
������� �� ���������, � ����� �� �������, 
���� � ��������� �������� � ���������, 
� ����� ���� �������.*/
SELECT COUNTRIES.NAME AS COUNTRY_NAME, 
REGIONS.NAME AS REGION_NAME
FROM REGIONS LEFT JOIN COUNTRIES
ON COUNTRIES.REGION_ID=REGIONS.REGION_ID

/* 7. �������� ������� �� ��������� � 
������� �� ���������, � ����� �� �������, 
���� � ��������� �������� ���������, ����� ����� �������*/
SELECT COUNTRIES.NAME AS COUNTRY_NAME, 
REGIONS.NAME AS REGION_NAME
FROM REGIONS RIGHT JOIN COUNTRIES
ON COUNTRIES.REGION_ID=REGIONS.REGION_ID

--
SELECT C.NAME AS COUNTRY_NAME, 
R.NAME AS REGION_NAME
FROM COUNTRIES C LEFT JOIN REGIONS R
ON C.REGION_ID=R.REGION_ID

/* 8.�������� ������� �� ��������� � 
������� �� ���������, � ����� �� �������, 
���� � ��������� �������� ���������,
����� ����� ���������, � ����� ���� �������*/
SELECT C.NAME AS COUNTRY_NAME, 
R.NAME AS REGION_NAME
FROM COUNTRIES C FULL JOIN REGIONS R
ON C.REGION_ID=R.REGION_ID
 
/* 9. �������� ������� �� ��������� � 
���� �������, ����� �� �������. 
��������� ��������� �� ���� ������� ���������*/
SELECT FNAME+' '+LNAME AS NAME, COUNT(ORDER_ID) AS BROY
FROM CUSTOMERS C JOIN ORDERS O
ON C.CUSTOMERS_ID=O.CUSTOMER_ID
GROUP BY FNAME+' '+LNAME
ORDER BY 2 DESC

/* 10. �������� ������� �� ��������� � ���� �������, 
���� � ��������� �������� �  ���������, ����� �� �� 
������� ������� �� �������. ��������� �� ���� ������� ���������*/
SELECT FNAME+' '+LNAME AS NAME, COUNT(ORDER_ID) AS BROY
FROM CUSTOMERS C LEFT JOIN ORDERS O
ON C.CUSTOMERS_ID=O.CUSTOMER_ID
GROUP BY FNAME+' '+LNAME
ORDER BY 2 DESC

/* 11. �������� ������� �� ����������� � �������������� 
�� ���������� ��*/
SELECT FNAME+' '+LNAME AS NAME, JOB_TITLE 
FROM EMPLOYEES E JOIN JOBS J
ON E.JOB_ID=J.JOB_ID

/* 12. �������� ������� �� ��������� � ������ �������� 
�� ���������, ����� �� ���������*/
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


/* 11. �������� �������� �� ��������, 
���� ��������� � ��� � ����������� ������ �������*/
SELECT DEPARTMENT_ID, AVG(SALARY) AS SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID

/* 12. �������� �������� �� ���������� � 
������ ����������, � ����� �� ���� ��������*/
SELECT PRODUCT_ID, SUM(QUANTITY) AS SUMA
FROM ORDER_ITEMS
GROUP BY PRODUCT_ID

/* 13. �������� ��-���� �� ����������� � 
�������� ������� �� ����� �� ���*/
SELECT JOB_ID, AVG(SALARY) AS SALARY
FROM EMPLOYEES
GROUP BY JOB_ID

/* 14. �������� �������� �� ��������� � ���� �������, 
����� �� �������.
��������� ��������� �� ���� ������� ���������*/
SELECT CUSTOMER_ID, COUNT(ORDER_ID) AS ORDERS
FROM ORDERS
GROUP BY CUSTOMER_ID
ORDER BY 2 DESC