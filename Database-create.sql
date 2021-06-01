
USE company;

CREATE TABLE employee (
	Fname VARCHAR(15),
	Minit VARCHAR(1),
	Lname VARCHAR(15),
	Ssn INT PRIMARY KEY,
	Bdate DATE,
	Address VARCHAR(20),
	Sex VARCHAR(1),
	Salary INT,
	Super_ssn INT,
	Dno INT,
	FOREIGN KEY(Super_ssn) REFERENCES employee(Ssn)
);

CREATE TABLE department (
	Dname VARCHAR(20),
	Dnumber INT PRIMARY KEY,
	Mgr_ssn INT,
	Mgr_start_date DATE,
	FOREIGN KEY(mgr_ssn) REFERENCES employee(Ssn)
);

-- ALTERING THE employee table to set foreign key attribute
ALTER TABLE employee ADD FOREIGN KEY(Dno)
REFERENCES department(Dnumber);

CREATE TABLE dept_locations (
	Dnumber INT,
	Dlocation VARCHAR(20),
	PRIMARY KEY(Dnumber, Dlocation),
	FOREIGN KEY(Dnumber) REFERENCES department(Dnumber)
);

CREATE TABLE project (
	Pname VARCHAR(20),
	Pnumber INT PRIMARY KEY,
	Plocation VARCHAR(20),
	Dnum INT,
	FOREIGN KEY(Dnum) REFERENCES department(Dnumber)
);

CREATE TABLE works_on (
	Essn INT,
	Pno INT,
	Hours FLOAT,
	PRIMARY KEY(Essn, Pno),
	FOREIGN KEY(Essn) REFERENCES employee(Ssn)
	ON DELETE CASCADE,
	FOREIGN KEY(Pno) REFERENCES project(Pnumber)
);

CREATE TABLE dependent (
	Essn INT,
	Dependent_name VARCHAR(20),
	Sex VARCHAR(1),
	Bdate DATE,
	Relationship VARCHAR(15),
	PRIMARY KEY(Essn, Dependent_name),
	FOREIGN KEY(Essn) REFERENCES employee(Ssn)
);


