#Table Creation:

CREATE TABLE SALESMANS(
  SALESMAN_ID INT PRIMARY KEY,
  NAME VARCHAR(20),
  CITY VARCHAR(20),
  COMMISSION CHAR(4));

CREATE TABLE CUSTOMER(
  CUSTOMER_ID INT PRIMARY KEY,
  CUST_NAME VARCHAR(20),
  CITY VARCHAR(20),
  GRADE INT,
  SALESMAN_ID REFERENCES SALESMANS(SALESMAN_ID) ON DELETE SET NULL);

CREATE TABLE ORDERS(
  ORD_NO INT PRIMARY KEY,
  PURCHASE_AMT NUMBER,
  ORD_DATE DATE,
  CUSTOMER_ID REFERENCES CUSTOMER(CUSTOMER_ID) ON DELETE CASCADE,
  SALESMAN_ID REFERENCES SALESMANS(SALESMAN_ID) ON DELETE CASCADE);

#Queries:

 SELECT COUNT(CUSTOMER_ID) FROM CUSTOMER WHERE GRADE > (SELECT AVG(GRADE)
 FROM  CUSTOMER WHERE CITY = 'BANGALORE');


 SELECT SALESMAN_ID ,NAME FROM SALESMANS S 
 WHERE (SELECT COUNT(*) FROM CUSTOMER WHERE SALESMAN_ID =S.SALESMAN_ID)>1;


 SELECT S.SALESMAN_ID,NAME,CUST_NAME FROM
 SALESMANS S ,CUSTOMER C WHERE S.CITY=C.CITY
 AND S.SALESMAN_ID = C.SALESMAN_ID
 UNION
 SELECT S.SALESMAN_ID,NAME,'NO MATCH' FROM SALESMANS S, CUSTOMER 
 WHERE NOT S.CITY;


 CREATE VIEW SALESMAN_ORDER AS SELECT B.ORD_DATE, A.SALESMAN_ID,NAME FROM SALESMANS A , ORDERS B
 WHERE A.SALESMAN_ID =B.SALESMAN_ID
 AND B.PURCHASE_AMT= (SELECT MAX (PURCHASE_AMT) FROM ORDERS C 
 WHERE C.ORD_DATE = B.ORD_DATE);
 SELECT *FROM SALESMAN_ORDER;
 

 DELETE FROM SALESMANS WHERE SALESMAN_ID =1000;
 SELECT *FROM SALESMANS;
