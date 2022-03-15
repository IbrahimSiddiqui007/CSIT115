create database lab3;
use lab3;

create table Doctors (
Doctor_id int primary key,
D_Name varchar(50),
Date_joined date,
Gender char(1),
Speciality varchar(50),
Office_Phone_Number char(9) check(Office_Phone_Number is null or Office_Phone_Number regexp '04[0-9]{7}'),
Work_email_address varchar(50) check(Work_email_address Regexp '[a-z][a-z][0-9][0-9][0-9]@hosp.ae')
);

create table patients (
Patient_id int primary key,
Patient_name varchar(50),
Registration_date date,
Gender char(1),
Dob date,
Phone_number char(10) check (Phone_number is null or Phone_number regexp '05[0-9]{8}'),
Email_address varchar(50) check(Email_address like '%@%.%')
);


create table Appointments (
Patient_id int,
Doctor_id int,
Appointment_date_time datetime,
Status enum('confirmed','waiting'),
constraint fk_patient foreign key(Patient_id) references Patients(Patient_id),
constraint fk_doctors foreign key(Doctor_id) references Doctors(Doctor_id)
);

drop table patients;
drop table doctors;
drop table Appointments;

insert into patients values(1,'Saira','2020-06-06','F','2000-10-10','0567758464','saira@gmail.com');
insert into patients values(2,'Sana','2021-08-06','F','1998-10-10','0567758484','sana@gmail.com');
insert into patients values(3,'Saad','2021-07-06','M','1991-01-10','0507758464','saad@uowd.ae');
insert into patients values(4,'Said','2021-08-16','M','2005-10-10','0567758464','dd@uow.au');
insert into patients values(5,'Alina','2021-12-18','F','2002-10-10','0587758464','alina@gmail.com');

insert into doctors values(1,'Nadia','2020-09-11','F','Pediatry','043458464','nd955@hosp.ae');
insert into doctors values(2,'Hania','2005-06-06','F','Orthopedy','043459464','hn991@hosp.ae');
insert into doctors values(3,'Jacob','2020-06-06','M','General','042458464','jc000@hosp.ae');
insert into doctors values(4,'Rayan','2018-06-01','M','General','043125844','rd122@hosp.ae');
insert into doctors values(5,'Jack','2006-06-06','M','Ophthalmology','043459464','jk899@hosp.ae');

insert into appointments values(3,5,'2022-01-26 12:20:00','confirmed');
insert into appointments values(1,1,'2022-01-12 13:30:00','confirmed');
insert into appointments values(2,4,'2022-01-22 17:20:00','confirmed');
insert into appointments values(2,5,'2022-03-02 09:20:00','waiting');
insert into appointments values(1,1,'2022-02-28 17:00:00','confirmed');
insert into appointments values(3,2,'2022-03-01 12:20:00','waiting');
insert into appointments values(4,3,'2022-01-21 16:30:00','confirmed');
insert into appointments values(2,5,'2022-01-10 15:20:00','confirmed');


SELECT * FROM appointments WHERE Appointment_date_time > NOW();
select * from Doctors where Date_joined = (select min(Date_joined) from Doctors);
select * from patients where year(registration_date)=2021 and month(registration_date)=08;
select Patient_name,D_Name from patients,Doctors;
SELECT patient_name FROM patients WHERE month(registration_date)>=07 AND month(registration_date)<=9 AND year(registration_date)=2021;
select distinct D_name,date_format(a.Appointment_date_time, '%m/%d/%Y') as usa_date from Doctors as d, Appointments as a where Speciality!='general';

