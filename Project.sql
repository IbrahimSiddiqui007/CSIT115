create database Project_system;
use Project_system;

create table SpecialFood(
SFName varchar(50) unique Primary Key,
Amnt varchar(30),
foreign key (SFName) references MedInformation(MSFName)
);

create table medicines(
MName varchar(50) unique Primary key,
PDosage varchar(30),
foreign key (MName) references MedInformation(MSFName)
);


create table MedInformation(
CName varchar(100),
PName varchar(100),
MSFName varchar(50) unique,
FDosage varchar(50),
Diagnosis varchar(200),
SInstructions varchar(100),
Price int,
Primary key (CName, PName, MSFName),
Foreign key (CName) references Pets(CName),
foreign key (PName) references pets(PName)
);

create table Pets(
CName varchar(100),
PName varchar(100),
CTPrimary int unique,
PColor varchar(50),
PSex enum("Male","Female"),
DOB date,
LWeight int,
Breed varchar(50),
Spcs varchar(100),
primary key (PName, CTPrimary),
foreign key (CName) references Customer(CName),
foreign key (CTPrimary) references Customer(CTPrimary)
);


create table Customer(
CName varchar(100),
CAddress varchar(100),
CTPrimary int unique,
SPrimary int unique,
primary key (CName, CTPrimary)
);

create table Appointment(
CName varchar(100),
PName varchar(100),
TPrimary int unique,
AppTime date,
AppDate date,
Pvisit varchar(50),
Fee int,
primary key (CName, TPrimary),
foreign key (CName) references Customer(CName),
foreign key (TPrimary) references Customer(CTPrimary)
);

create table Legal_Req(
DName varchar(100),
Req varchar(500),
foreign key (DName) references Disease(DName)
);

create table Disease(
DName varchar(50) primary key,
DSymptoms varchar(300)
);

create table VacPet(
CName varchar(100),
PName varchar(100),
VName varchar(100),
DName varchar(50),
VDate date, 
primary key (CName,PName,VName,DName),
Foreign key (CName) references Pets(CName),
Foreign key (VName) references Vaccination(VName),
Foreign key (DName) references Disease(DName),
Foreign key (PName) references Pets(PName)
);

create table Vaccination(
VName varchar(100) primary key,
VacFrequency varchar(25),
VacDosage int
);

-- For testing --
drop table VacPet;
drop table Vaccination;
drop table Disease;
drop table Legal_Req;
drop table Pets;
drop table Customer;
drop table Appointment;
drop table Customer;
drop table Customer;
drop table Customer;


-- TASK 4: Show all the vaccination records for all pets --
select v.VName, v.VacFrequency, v.VacDosage, d.DName, lq.Req, p.CName, p.PName, p.CTPrimary, p.Breed, p.Spcs from Vaccination as v, Disease as D, Legal_Req as lq, Pets as p, VacPets as vp where p.PName=vp.PName
