create database lab4;
USE lab4;

create table author(
a_name char(50),
gender char(1), 
age int,
nationality char(50),
PRIMARY KEY (a_name)
);

create table book(
isbn int,
title char(50), 
ver_no int,
publisher char(50),
PRIMARY KEY (isbn)
);

create table writtenBy(
isbn int,
a_name char(50), 
yr_published int,
price int,
no_copy int,
PRIMARY KEY (isbn,a_name),
foreign key (isbn) references book(isbn),
foreign key (a_name) references author(a_name)
);

insert into author values ('Cloudia','F',42,'French');
insert into author values ('Joseph','M',33,'Italian');
insert into author values ('Joslin','F',31,'Australian');
insert into author values ('Luis','M',78,'British');
insert into author values ('Farhad','M',52,'British');

insert into book values (101,'Databases',1,'Possum');
insert into book values (202,'SQL Primer',2,'Hall');
insert into book values (303,'Databases',1,'West');
insert into book values (404,'Informatics',4,'Hall');
insert into book values (505,'Learning Python',1,'Possum');
insert into book values (606,'Advanced PlSQL',2,'Hall');
insert into book values (707,'Mongo DB',1,'West');


insert into writtenby values (101,'Cloudia',1983,100,1000);
insert into writtenby values (202,'Joseph',2000,200,1200);
insert into writtenby values (303,'Luis',2002,150,900);
insert into writtenby values (505,'Farhad',2016,300,1500);
insert into writtenby values (606,'Joseph',2020,200,1000);
insert into writtenby values (404,'Luis',2019,250,800);

-- Task 1 --

select count(title) as books,sum(no_copy) as Number_of_copies, publisher from book as b, writtenBy as w where w.isbn=b.isbn group by publisher;
select * from book;

-- Task 2 --

select a_name,price*no_copy as income from writtenBy order by a_name;

-- Task 3 --

select distinct A,income from (select a_name as A,sum(price*no_copy) as income from writtenBy group by a_name) as table1, writtenBy;

-- Task 4 --

select publisher from book,writtenby where book.isbn=writtenby.isbn and no_copy > (select avg(no_copy) as average_copies from writtenby) group by publisher;

-- Task 5 --

select author.a_name as Author_Name, author.age as Age from (select max(sq2.age) as  second_eldest_age from (select age from (select MAX(age) as MAGE from author ) as sq1, author where age<MAGE) as sq2,author ) as fsq,author where author.age=second_eldest_age;

-- Task 6 --

select count(if(no_copy>1000,1,null)) as 'No of Books with greater than 1000 Copies', count(if(no_copy<1000,1,null)) as 'No of Books with less than 1000 Copies' from writtenBy;