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

--UC6 = Ability to add gender in to employee payroll

Alter table employee_payroll add Gender char(1);
 SELECT * from employee_payroll;

 UPDATE employee_payroll SET Gender = 'F' WHERE name = 'Rupali';
 UPDATE employee_payroll SET Gender = 'F' WHERE name = 'Deepali' or name = 'Seema';
 SELECT * from employee_payroll;
 
 --UC7 = Find avg, sum, min,max salary by gender 

 SELECT AVG(salary) FROM employee_payroll WHERE Gender = 'F' Group By Gender;
 SELECT AVG(salary) FROM employee_payroll WHERE Gender = 'M' Group By Gender;

 SELECT SUM(salary) FROM employee_payroll WHERE Gender = 'F' Group By Gender;
 SELECT SUM(salary) FROM employee_payroll WHERE name = 'Rupali' AND name = 'Deepali';
 
SELECT MIN(salary) FROM employee_payroll WHERE Gender = 'F' Group By Gender;
 SELECT Max(salary) FROM employee_payroll WHERE Gender = 'F' Group By Gender;
 SELECT * from employee_payroll;
 
 --UC8 = Extend employee payroll data to insert employee phone address

 use payroll_service;
 select * from employee_payroll;

 alter table employee_payroll add PhoneNo bigint;
select * from employee_payroll;
update employee_payroll set PhoneNo = 9322775475 where id = 1;
alter table employee_payroll add Address varchar(100) not null default 'Hydrabad';
alter table employee_payroll add Department varchar(250) not null default 'Mechanical';
select * from employee_payroll;
 
 --UC9 = Extend employee payroll table by adding basicpay, deduction,incometax, taxablepay,netpay.

Alter table employee_payroll
add basic_pay float, Deduction float, Taxable_Pay float, Income_Tax float, Net_Pay float;
select *from employee_payroll;

Update employee_payroll set Deduction = 1000 where Gender = 'F';
Update employee_payroll set Deduction = 1000 where Gender = 'F';
Update employee_payroll set basic_pay = 5000 where Gender = 'F';
Update employee_payroll set basic_pay = 8000 where Gender = 'F';
update employee_payroll set Net_Pay = (basic_Pay - Deduction)
update employee_payroll set Taxable_Pay = 0, Income_Tax = 0
select * from employee_payroll; Update employee_payroll set Deduction = 2000 where Gender = 'F';


