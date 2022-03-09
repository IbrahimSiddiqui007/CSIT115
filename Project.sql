create database Project_system;
use Project_system;

create table SpecialFood(
FName varchar(50),
PDosage varchar(30),
FDosage varchar(50),
Diagnosis varchar(200),
SInstructions varchar(100),
Price int,
foreign key (FDosage) references MedInformation(FDosage)
);

create table medicines(
FName varchar(50),
PDosage varchar(30),
FDosage varchar(50),
Diagnosis varchar(200),
SInstructions varchar(100),
Price int
);

create table MedInformation(
PDosage varchar(30),
FDosage varchar(50),
Diagnosis varchar(200),
SInstructions varchar(100),
Price int
);

create table Pets(
CName varchar(100),
PName varchar(100),
CTPrimary int,
PColor varchar(50),
PSex enum("Male","Female"),
DOB date,
LWeight int,
Breed varchar(50),
Spcs varchar(100),
foreign key (CName) references Customer(CName)
);

create table Customer(
CName varchar(100),
CAddress varchar(100),
TPrimary int,
SPrimary int,
primary key (Cname, TPrimary)
);

create table Appointment(
CName varchar(100),
PName varchar(100),
TPrimary int,
AppTime date,
AppDate date,
Pvisit varchar(50),
Fee int,
foreign key (CName) references Customer(CName)
);

create table Disease(
DName varchar(50),
DSymptoms varchar(300)
);

create table VacPet(
CName varchar(100),
VName varchar(100),
DName varchar(50),
VDate date, 
Foreign key (CName) references Pets(CName),
Foreign key (VName) references Vaccination(VName),
Foreign key (DName) references Disease(DName)
);

create table Vaccination(
VName varchar(100),
VacFrequency varchar(25),
VacDosage int
);
