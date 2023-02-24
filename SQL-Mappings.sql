create database employees;

use employees;

SET FOREIGN_KEY_CHECKS=0;

create table employeeDetails(
id int primary key not null,
firstName varchar(255),
lastName varchar(255),
bloodGroup varchar(10),
fk_deptId int,
foreign key(fk_deptId) references department(id)
);

insert into employeeDetails values(101, 'Akshay',' Kalia','AB+ve',302);
insert into employeeDetails values(102, 'Shashi',' Kumar','B+ve',303);
insert into employeeDetails values(103, 'Miteanjay',' Kumar','O-ve',302);
insert into employeeDetails values(104, 'Guna', 'Varma','AB-ve',301);
insert into employeeDetails values(105, 'Somiya', 'Parmar','AB-ve',301);
insert into employeeDetails values(106, 'Arjun', 'Himanshu','AB-ve',302);

select * from employeedetails;

create table bankDetails(
id int primary key not null,
accountNo varchar(255),
IFSCcode varchar(255),
branch varchar(255),
fk_employeeId int,
FOREIGN  key(fk_employeeId) references employeedetails(id)
);

insert into bankDetails values(201, '1234567890','SNIN0000977','Gurgaon',101);
insert into bankDetails values(202, '4567896554','SNIN0000977','Gurgaon',102);
insert into bankDetails values(203, '4398709672','SNIN0000977','Delhi',103);
insert into bankDetails values(204, '6587432190','SNIN0000977','Gurgaon',104);
insert into bankDetails values(205, '9067785423','SBIN6759065','Gurgaon',105);
insert into bankDetails values(206, '5687423789','KTKB0000977','Gurgaon',106);

select * from bankDetails;

create table department(
id int primary key not null,
dept_name varchar(255),
location varchar(255)
);

insert into department values(301, 'sales','Delhi');
insert into department values(302, 'IT','Delhi');
insert into department values(303, 'HR','Gurgaon');

select * from department;

create table projects(
id int primary key not null,
proj_name varchar(255)
);

insert into projects values(401, 'xnet');
insert into projects values(402, 'fuso');
insert into projects values(403, 'JIRA');

select * from projects;

create table project_employee(
id int primary key not null,
project_id int,
empl_id int,
foreign key(project_id) references projects(id),
foreign key(empl_id) references employeeDetails(id)
);

insert into project_employee values(1,401,102);
insert into project_employee values(2,401,103);
insert into project_employee values(3,401,101);
insert into project_employee values(4,402,102);
insert into project_employee values(5,403,102);
insert into project_employee values(6,403,101);
insert into project_employee values(7,402,103);
insert into project_employee values(8,403,105);
insert into project_employee values(9,403,104);
insert into project_employee values(10,401,105);
insert into project_employee values(11,401,106);

select * from project_employee;

select employeedetails.id,employeedetails.firstName, projects.proj_name from employeedetails
JOIN project_employee on employeedetails.id=project_employee.empl_id
join projects on project_employee.project_id=projects.id;

select department.location, employeedetails.firstName from department, employeedetails
where employeedetails.fk_deptId = department.id;

select employeedetails.firstName, bankdetails.accountNo from bankdetails, employeedetails
where employeedetails.id=bankdetails.fk_employeeId;