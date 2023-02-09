#Creation of tables:

CREATE TABLE FLIGHTS(
  Flno int primary key, 
  Source varchar(20), 
  Destination varchar(20),
  Distance int,
  DepartTime varchar(10),
  ArrivalTime varchar(10),
  Price int);


CREATE TABLE AIRCRAFT(
  Aid int primary key,
  Aname varchar(20),
  CRUSINGRANGE int);


CREATE TABLE EMPLOYEES(
  Eid int primary key,
  Ename varchar(20), 
  Salary int);
  
  
  CREATE TABLE CERTIFIED(
    Eid references Employees(Eid),
    Aid references AirCraft(Aid));



#Queries:

SELECT Aname FROM AIRCRAFT A, EMPLOYEES E, CERTIFIED C where A.Aid = C.Aid and E.Eid = C.Eid and
E.Salary > 80000;


SELECT E.Eid, MAX(CrusingRange) FROM EMPLOYEES E, CERTIFIED C, AIRCRAFT A where E.Eid=C.Eid and
A.Aid = C.Aid GROUP BY E.Eid HAVING COUNT(*) > 3;


SELECT A.Aname ,AVG(Salary) FROM EMPLOYEES E, CERTIFIED C , AIRCRAFT A where C.Eid = E.Eid and A.Aid
= C.Aid and A.CrusingRange > 1000 GROUP BY A.Aname;


(SELECT Ename FROM EMPLOYEES E, CERTIFIED C WHERE C.Aid in
(SELECT A.Aid FROM AIRCRAFT A, CERTIFIED C WHERE A.Aid not in
(SELECT Aid FROM AIRCRAFT WHERE Aname = 'boeing' OR CrusingRange=3000)
GROUP BY A.Aid
) AND E.Eid = C.Eid)
MINUS
(SELECT Ename FROM Employees E, CERTIFIED C WHERE C.Aid in (
SELECT A.Aid FROM AIRCRAFT A, CERTIFIED C WHERE A.Aid in
(SELECT Aid FROM AIRCRAFT WHERE Aname = 'boeing')
GROUP BY A.Aid) AND E.Eid = C.Eid);

--- ALTERNATIVE-----

SELECT DISTINCT E.ENAME FROM EMPLOYEES E WHERE E.EID IN(
  SELECT C.EID FROM CERTIFIED C WHERE EXISTS(
    SELECT A.AID FROM AIRCRAFT A WHERE A.AID = C.AID
    AND A.CRUSINGRANGE > 1500) AND
  NOTEXISTS(SELECT A1.AID FROM AIRCRAFT A1 WHERE A1.AID = C.AID AND A1.ANMAE ='BOEING'));


SELECT Eid, Ename, Salary FROM EMPLOYEES WHERE salary > (SELECT AVG(salary) FROM  EMPLOYEES) AND Eid
NOT IN ( SELECT Eid FROM CERTIFIED);
