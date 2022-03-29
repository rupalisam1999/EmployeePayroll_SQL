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


-- UC10 - Adding another Value for Terissa in Sales&Marketing Department.

insert into employee_payroll 
values('Terissa',400000.00,'2022-3-28','F',8156782910,'pune','Sales',2000,1000,200,18000,8000),
('Terissa',400000.00,'2022-3-27','F',8156782910,'pune','Marketing',2000,1000,200,18000,6000);
select * from employee_payroll;


--UC11

create table Department
(
department_id int not null primary key,
department_name varchar(20) not null
)
insert into Department values(101,'Sales'),(102,'Marketing');
select * from Department;

create table payroll
(
payroll_Id int not null primary key,
basic_pay money not null,
deductions money not null,
taxable_pay money not null,
net_pay money not null,
income_tax money not null
)
insert into payroll values(201,500000,3000,2000,22000,300),
(202,600000,4000,3000,32000,400),
(203,700000,5000,4000,42000,500);
select * from payroll;

create table company
(
company_id int not null primary key,
company_name varchar(20) not null
)
insert into company values
(301,'Nokia'),
(302,'Samsung');
select * from company;

create table employee
(
employee_id int not null primary key,
employee_name varchar(70) not null,
gender char(1) not null,
address varchar(100) not null,
phone_number bigint not null,
start_date datetime not null,
company_id int not null,
payroll_id int not null,
basic_pay money not null,
foreign key(company_id) references company(company_id),
foreign key(payroll_id) references payroll(payroll_Id)
)
insert into employee values
(1,'Rupali','F','latur',3939390910,'2020-10-2',301,201,300000),
(2,'Akash','M','pune',3939690910,'2019-10-2',302,202,40000),
(3,'Deepali','F','amrvati',3959390910,'2020-10-2',301,203,600000);
select * from employee;

create table EmployeeDepartment
(
employee_Department_id int not null,
employee_id int not null,
department_id int not null,
foreign key(employee_id) references employee(employee_id),
foreign key(department_id)references Department(department_id)
)
insert into EmployeeDepartment values
(401,1,101),
(402,2,102),
(401,1,102),
(402,2,101);
select * from EmployeeDepartment;


