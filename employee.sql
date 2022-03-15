create database lab5;
use lab5;

CREATE TABLE IF NOT EXISTS Employee (
    name varchar(100),
    e_id int not null auto_increment,
    address varchar(100),
	gender char(1),
	Salary int,
    mgr_id int,
    PRIMARY KEY (e_id)
);

CREATE TABLE IF NOT EXISTS Department (
    name varchar(100),
    d_id INT NOT NULL auto_increment,
    PRIMARY KEY (d_id)
);

CREATE TABLE IF NOT EXISTS Emp_Dep (
    e_id int,
    d_id int,
    PRIMARY KEY (e_id,d_id),
    FOREIGN KEY (d_id) references Department(d_id),
	FOREIGN KEY (e_id) references employee(e_id)
);

INSERT INTO Department VALUES ('Information Technology','1'),('HR','2'),('Finance','3'),('Accounting','4'),
('Security','6'),('Support','7'),('Contract Staff','8'),('Sales','9'),('Management','10');


INSERT INTO Employee VALUES 
('Sara','1','Dubai, Al Karama, Street 12, Building5, Apartment502','F',15000,14),
('Abdulla','2','Sharjah, Al Nahda 3, Street 2, Building 7, Apartment901','M',23000,14),
('Zara','3','Sharjah, Al Khan, Street 6,Villa 10 ','F',6000,Null),
('Asma','4','Sharjah, Al Qasimi, Steet 35, villa 8','F',3000,20),
('Farhad','5','Sharjah, Al Taawon, Steert 4, Building 7, apartment 808','M',3500,14),
('Farhad','6','Sharjah,Al Nahda 2, Street 8, Building 3, Apartment1202','M',7500,8),
('Mike','7','Dubai, Rashediah, street10, villa 5','M',3000,20),
('Richard','8','Dubai, Qusais, Street 8, Building 9, apartment 101','M',9000,Null),
('Rajith','9','Dubai, Al Nahda 3, Street 34, Building 6, apartment 202','M',15000,17),
('Asma','10','Dubai, Jabal Ali, Street 7, building 9, apartment101','F',0,3),
('Fadhel','11','Dubai, Springs 2, Street 8, villa 305','M',7000,16),
('Karishma','12','Dubai, Gardens, Building 8, apartment 404','F',6000,14),
('Ruchita','13','Abu Dhabi, Muroor, street 3, villa 9','F',22000,14),
('Zara','14','Abu Dhabi, Madinat Zayed, Steet 8, villa 10','F',20000,Null),
('Salem','15','Abu Dhabi, Al Karama, street 8, building 10, apartment 1404','M',700,8),
('Miguel','16','Abu Dhabi, Khalidiya, Steert 7, Building 7, apartment 101','M',9000,Null),
('Joseph','17','Abu Dhabi, Al Raha, Villa 90','M',25000,null),
('Khoshi','18','Ajman, Al Hamidiya','F',6000,8),
('Amir','19','Ajman, Al Naseem','M',7000,8),
('Renessa','20','Fujeirah','F',3500,Null);

INSERT INTO Emp_Dep VALUES (1,3),(2,10),(3,9),(4,6),(5,2),(6,8),(7,6),(8,8),(10,9),(11,4),(12,7),(13,10),(14,10),(15,8),(16,4),(18,8),(19,8),(20,6);

/*T5: Select employess and department they are working in, for employees 
whoes name starting with R or K ending with vovels */

select e.name,d.name from department d join Emp_Dep ed using(d_id) join employee e using(e_id) where e.name regexp '^K|^R.*[AEIOUaeiou]$';

/* T6:  for all Employees list their dept order by dept id (LEFT JOIN)*/

select e.name, ed.d_id from department d LEFT JOIN Emp_Dep ed using(d_id) LEFT JOIN employee e using (e_id) ORDER BY ed.d_id;

/* T7: for all departments list thier Employee ids order by employee (RIGHT JOIN)*/



/*T8: list all department and employess who do not have employee or location assigned to 
(use union between LUJ and RUJ)*/


/*T9: select departments whoes employees' average salary is more than all managers average salary*/

SELECT d.name from department d 

/*T11: LIST al employee along with their manager name (SELF-JOIN)*/


/*T12: count number of employees each manager is managing (SELF-JOIN) */


/*T13: find the average number of employees managed by managers*/


/*T14.1: add column location to department*/
alter table department add location varchar(100);
/*T14.2 update department location and set it to department manager location */

/*T15: delete from employee and emp_department all data of employees with no salary
(deletes from both tables in join)
DELETE table1,table 2
FROM table1 JOIN table1 ON key_maching
WHERE condition
SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS=0;
*/
 