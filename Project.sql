create database Project_system;
use Project_system;

create table SpecialFood(
SFName varchar(50) unique Primary Key,
Amnt varchar(30),
FAmnt varchar(50),
Diagnosis varchar(200),
SInstructions varchar(100),
Price int,
foreign key (FDosage) references MedInformation(FDosage),
foreign key (Diagnosis) references MedInformation(Diagnosis),
foreign key (SInstructions) references MedInformation(SInstructions),
foreign key (Price) references MedInformation(Price),
foreign key (SFName) references MedInformation(MSFName)
);

create table medicines(
MName varchar(50) unique Primary key,
PDosage varchar(30),
FDosage varchar(50),
Diagnosis varchar(200),
SInstructions varchar(100),
Price int,
foreign key (FDosage) references MedInformation(FDosage),
foreign key (Diagnosis) references MedInformation(Diagnosis),
foreign key (SInstructions) references MedInformation(SInstructions),
foreign key (Price) references MedInformation(Price),
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
Foreign key (PName) references Pets(PName),
Foreign key (CName) references Pets(CName)
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
primary key (CName,PName,CTPrimary),
foreign key (CName) references Customer(CName),
foreign key (CTPrimary) references Customer(TPrimary)
);

create table Customer(
CName varchar(100),
CAddress varchar(100),
TPrimary int unique,
SPrimary int unique,
primary key (Cname, TPrimary)
);

create table Appointment(
CName varchar(100),
PName varchar(100),
TPrimary int unique,
AppTime date,
AppDate date,
Pvisit varchar(50),
Fee int,
primary key (Cname, TPrimary),
foreign key (CName) references Customer(CName),
foreign key (TPrimary) references Customer(TPrimary)
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
