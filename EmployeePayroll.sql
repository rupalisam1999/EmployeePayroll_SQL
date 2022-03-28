--UC-1=Creat a database

CREATE DATABASE payroll_service;
 USE payroll_service;
 Select * FROM employee_payroll;

 --UC2

CREATE TABLE employee_payroll
(
id       INT  IDENTITY (1,1) PRIMARY KEY,
name     VARCHAR(150) NOT NULL,
salary   BIGINT ,
start    Date NOT NULL,

);
SELECT *from employee_payroll;

--UC3 = Insert values in employeepayroll

INSERT INTO employee_payroll VALUES('Rupali',2000,'2022-3-28') 
INSERT INTO employee_payroll VALUES('Deepali',4000,'2022-3-26') 
INSERT INTO employee_payroll VALUES('Seema',6000,'2022-3-29') 

SELECT *from employee_payroll;

--UC4 = Retriving employee data
SELECT *from employee_payroll;

--UC5 = Retrieve A particular employee salary data 

Select salary FROM employee_payroll WHERE name = 'Rupali';

SELECT *from employee_payroll
     WHERE start BETWEEN CAST ('2022-3-28' as date) AND GETDATE();



 
 
 