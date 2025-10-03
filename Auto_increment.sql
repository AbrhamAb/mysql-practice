show databases;
create database mysql_practice;

use mysql_practice;

create table Employees ( id int auto_increment,
						 last_name varchar(100) not null,
                         first_name varchar(100) not null,
                         middle_name varchar(100),
                         age int not null,
                         current_status varchar(100) not null default 'employed',
                         primary key(id));
  
desc employees;
insert into Employees (last_name,first_name,age,current_status) values ("Abebaw","Abrham",23,"unemployed");

select * from employees;