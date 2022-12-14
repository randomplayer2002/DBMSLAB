#1. Table Creation:

CREATE TABLE DEPTS (DNAME VARCHAR(20),
DNO INT PRIMARY KEY, MGRSTATRDATE DATE);

CREATE TABLE EMPLOYEE(SSN INT PRIMARY KEY,
FNAME VARCHAR(20),LNAME VARCHAR(20),
ADDRESS VARCHAR(20),
GENDER CHAR(1),
SALARY INT ,SUPERSSN REFERENCES EMPLOYEE(SSN) ON DELETE CASCADE, DNO REFERENCES DEPARTMENT(DNO) ON DELETE CASCADE);

INSERT INTO EMPLOYEE(SSN , FNAME, LNAME, ADDRESS,GENDER,SALARY,SUPERSSN) VALUES(&SSN, '&FNAME','&LNAME','&ADRESS','&GENDER',&SALARY,&SUPERSSN);

#2. Altering of the DEPARTMENT table:

ALTER TABLE DEPARTMENT ADD MGRSSN REFERENCES EMPLOYEE(SSN) ON DELETE SET NULL;

INSERT INTO DEPARTMENT VALUES('&DNAME',&DNO,'&MGRSTRDATE',&MGRSSN);

#3. Updation:

UPDATE EMPLOYEE SET DNO = 1 WHERE SSN=111
UPDATE EMPLOYEE SET DNO = 2 WHERE SSN=222
UPDATE EMPLOYEE SET DNO = 2 WHERE SSN=333
UPDATE EMPLOYEE SET DNO = 2 WHERE SSN=444
UPDATE EMPLOYEE SET DNO = 3 WHERE SSN=555
UPDATE EMPLOYEE SET DNO = 4 WHERE SSN=666
UPDATE EMPLOYEE SET DNO = 5 WHERE SSN=777

CREATE TABLE DLOCATION (
DNO REFERENCES DEPARTMENT(DNO),
DLOC VARCHAR(20));

INSERT INTO DLOCATION VALUES(&DNO,'&DLOC');

CREATE TABLE PROJECT (
PNO INT PRIMARY KEY,
PNAME VARCHAR(20),
PLOC VARCHAR(20),
DNO REFERENCES DEPARTMENT(DNO));

INSERT INTO PROJECT VALUES(&PNO,'&PNAME','&PLOC',&DNO);

 CREATE TABLE WORKS_ON (
 SSN REFERENCES EMPLOYEE(SSN),
 PNO REFERENCES PROJECT(PNO),
 HOURS INT);

INSERT INTO WORKS_ON VALUES(&SSN,&PNO,&HOURS);

#Queries:

SELECT DISTINCT P.NO FROM PROJECT P,DEPARTMENT D, EMPLOYEE E,
WHERE E.DNO=D.DNO AND D.DNO=P.DNO AND(E.LNAME = 'SCOOTT' OR D.MGRSSN IN(SELECT SSN FROM EMPLOYEE WHERE LNAME='SCOTT'));

