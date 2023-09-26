/* Employee Table*/
CREATE TABLE employee (
  empno INT PRIMARY KEY,
  empname VARCHAR(255),
  emptype VARCHAR(255),
  salary INT
);

/* Doctor Table*/
CREATE TABLE doctor (
  id INT PRIMARY KEY,
  empno INT,
  qualification VARCHAR(255),
  specialization VARCHAR(255),
  inpatientfee INT,
  outpatientfee INT,
  FOREIGN KEY (empno) REFERENCES employee(empno)
);

/* Employee Table Value Insertion*/
INSERT INTO employee (empno, empname, emptype, salary)
VALUES (1, 'John Smith', 'doctor', 100000),
       (2, 'Jane Smith', 'attendant', 50000),
       (3, 'Bob Johnson', 'admin', 75000);

/* Doctor Table Value Insertion*/
INSERT INTO doctor (id, qualification, specialization, inpatientfee, outpatientfee)
VALUES (1, 'MD', 'cardiology', 500, 200),
       (2, 'MD', 'nephrology', 400, 300),
       (3, 'PhD', 'surgery', 600, 500);

/* QUERIES*/
SELECT specialization, outpatientfee
FROM doctor
WHERE outpatientfee < 500;

SELECT id, qualification
FROM doctor
WHERE (specialization = 'cardiology' OR specialization = 'nephrology') AND inpatientfee BETWEEN 400 AND 600;

SELECT empno, empname, emptype
FROM employee
WHERE empname LIKE '_a%' AND salary <= 90000;
