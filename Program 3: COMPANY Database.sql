#1. Table Creation:

CREATE TABLE DEPTS (DNAME VARCHAR(20),
DNO INT PRIMARY KEY, MGRSTATRDATE DATE);

CREATE TABLE EMP(SSN INT PRIMARY KEY,
FNAME VARCHAR(20),LNAME VARCHAR(20),
ADDRESS VARCHAR(20),
GENDER CHAR(1),
SALARY INT ,SUPERSSN REFERENCES EMP(SSN) ON DELETE CASCADE, DNO REFERENCES DEPTS(DNO) ON DELETE CASCADE);

INSERT INTO EMP (SSN , FNAME, LNAME, ADDRESS,GENDER,SALARY,SUPERSSN) VALUES(&SSN, '&FNAME','&LNAME','&ADRESS','&GENDER',&SALARY,&SUPERSSN);

#2. Altering of the DEPTS table:

ALTER TABLE DEPTS ADD MGRSSN REFERENCES EMP(SSN) ON DELETE SET NULL;

INSERT INTO DEPTS VALUES('&DNAME',&DNO,'&MGRSTRDATE',&MGRSSN);

#3. Updation:

UPDATE EMP SET DNO = 1 WHERE SSN=111
UPDATE EMP SET DNO = 2 WHERE SSN=222
UPDATE EMP SET DNO = 2 WHERE SSN=333
UPDATE EMP SET DNO = 2 WHERE SSN=444
UPDATE EMP SET DNO = 3 WHERE SSN=555
UPDATE EMP SET DNO = 4 WHERE SSN=666
UPDATE EMP SET DNO = 5 WHERE SSN=777

CREATE TABLE DEPTLOC (
DNO REFERENCES DEPTS(DNO),
DLOC VARCHAR(20));

INSERT INTO DEPTLOC VALUES(&DNO,'&DLOC');

CREATE TABLE PRJ (
PNO INT PRIMARY KEY,
PNAME VARCHAR(20),
PLOC VARCHAR(20),
DNO REFERENCES DEPTS(DNO));

INSERT INTO PRJ VALUES(&PNO,'&PNAME','&PLOC',&DNO);

 CREATE TABLE WORKS_ON (
 SSN REFERENCES EMP(SSN),
 PNO REFERENCES PRJ(PNO),
 HOURS INT);

INSERT INTO WORKS_ON VALUES(&SSN,&PNO,&HOURS);

#Queries:

