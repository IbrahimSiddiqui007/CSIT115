create database Project_system;
use Project_system;

create table SpecialFood(
SFName varchar(50) Primary Key,
Amnt varchar(30),
foreign key (SFName) references MedInformation(MSFName)
);

create table medicines(
MName varchar(50) Primary key,
PDosage varchar(30),
foreign key (MName) references MedInformation(MSFName)
);

create table MedInformation(
CName varchar(100),
PName varchar(100),
MSFName varchar(50),
FDosage varchar(50),
Diagnosis varchar(200),
SInstructions varchar(100),
Price int,
Primary key (MSFName),
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
CTPrimary int,
PName varchar(100),
VName varchar(100),
DName varchar(50),
VDate date, 
primary key (CTPrimary,PName,VName,DName),
Foreign key (CTPrimary) references Pets(CTPrimary),
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
drop table MedInformation;
drop table medicines;
drop table SpecialFood;

-- Insert for Customer --
insert into Customer values ('Anna','Springs,UAE',971502345645,0566788934);
insert into Customer values ('Bob','Arabian Ranches,UAE',971508976767,9715078678);
insert into Customer values ('Thomas','Arabian Ranches,UAE',971508947872,0566788934);
insert into Customer values ('Sandra','Jumeirah Village Circle, UAE',971502998765,971507776543);
insert into Customer values ('Jeremy','Meadows,UAE',0506543749,971503454485);

-- Insert For Appointment --
insert into Appointment values ();
insert into Appointment values ();
insert into Appointment values ();
insert into Appointment values ();
insert into Appointment values ();
insert into Appointment values ();
insert into Appointment values ();

-- Insert for Pets --
insert into Pets values ('Anna','Max',971502345645,'Black',Male,2018-08-31,32,'Labrador','Dog');
insert into Pets values ('Bob','Leo',971508976767,'Brown and White',Male,2015-01-15,10,'Beagle','Dog');
insert into Pets values ('Thomas','Luna',971502345645,'Grey',Female,2018-06-11,28,'Greyhound','Dog');
insert into Pets values ('Sandra','Abby',971502998765,'White',Female,2012-03-01,6,'Ragdoll','Cat');
insert into Pets values ('Sandra','Koko',971502998765,'White',Male,2020-02-04,7,'Siamese','Cat');
insert into Pets values ('Jeremy','Zoe',0506543749,'Green',Female,2021-07-25,0.03,'Parrotlet','Bird');

-- Insert for Medicine --
insert into medicines values ('Beaphar Fiprotec for Dogs','4 pipettes of 100mg','Apply once every 4 weeks','fleas and ticks','Part the dogs’s fur between the shoulder blades and apply the contents of one pipette to the skin’s surface, ideally split between two areas roughly 2cm apart, one at the base of the head and the second 2-3cm further back. For continuous protection re-apply once every four weeks.',95);
insert into medicines values ('Beaphar Fiprotec for Cats','4 pipettes of 50mg','Apply once every 4 weeks',' fleas and ticks','Part the cat’s fur between the shoulder blades and apply the contents of one pipette to the skin’s surface, ideally split between two areas roughly 2cm apart, one at the base of the head and the second 2-3cm further back. For continuous protection re-apply once every four weeks.',84);
insert into medicines values ('Beaphar Multi-Vit Parrots Healthcare Supplements ','20 ml','Apply 2-3 drops in food or water','conditioning whilst speeding up moulting and increasing song performance','n/a',64);
insert into medicines values ('VetPlus Coatex for Hair and Skin Care for Dogs and Cats in Capsules','100 grams','Daily dosage of 1 capsule','Hair loss, dry or reddened skin, dandruff, and flaking','n/a',64);

-- Insert for Vaccination --
insert into Vaccination values ('RABVAC 1','Once every year',3);
insert into Vaccination values ('DHPP','Once every 3 years',3);
insert into Vaccination values ('DA2PP','Once every year',3);
insert into Vaccination values ('FVRCP','Once every 3 years',3);
insert into Vaccination values ('FeLV','Once every year',3);

-- Insert for VacPet --
insert into VacPet values (971502345645,'','RABVAC 1','Rabies',2020-06-11);
insert into VacPet values (971508976767,'','DHPP','Distemper',2021-09-27);
insert into VacPet values (971502345645,'','DHPP','Distemper',2020-11-19);
insert into VacPet values (971502998765,'','FVRCP','Feline Viral Rhinotracheitis',2022-01-21);
insert into VacPet values (971502345645,'','FeLV','Feline Viral Rhinotracheitis',2018-02-15);

-- Insert for Special Food --
insert into SpecialFood values ('Zesty Paws, Probiotic Bites for Dogs','90 Soft Chews','Everyday','Gut Function, Gut Health, Immune Function, Gut Flora','Up to 25 lbs, daily amount is 1 Soft Chew, 26-75 lbs, daily amount is 2 Soft Chews, Over 75 lbs, Daily amount is 3 Soft Chews',115);
insert into SpecialFood values ('Zesty Paws, Omega Bites for Dogs','90 Soft Chews','Everyday','Skin & Coat','Up to 25 lbs, daily amount is 1 Soft Chew, 26-75 lbs, daily amount is 2 Soft Chews, Over 75 lbs, Daily amount is 3 Soft Chews',115);
insert into SpecialFood values ('Pet Naturals of Vermont, Daily Probiotic, For Cats','30 Soft Chews','Everyday','healthy gut and healthy digestion','Give 1 chew daily',40);
insert into SpecialFood values ('Pet Naturals of Vermont, UT Support for Cats','60 Soft Chews','Everyday','mucosal lining of the urinary tract','For all cats, Give 1 chew, twice daily',45);


-- TASK 4: Show all the vaccination records for all pets --
select v.VName, v.VacFrequency, v.VacDosage, d.DName, lq.Req, p.CName, p.PName, p.CTPrimary, p.Breed, p.Spcs from Vaccination as v, Disease as D, Legal_Req as lq, Pets as p, VacPets as vp where p.PName=vp.PName
