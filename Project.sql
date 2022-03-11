create database Project_system;
use Project_system;

create table SpecialFood(
SFName varchar(100) Primary Key,
Amnt varchar(30),
foreign key (SFName) references MedInformation(MSFName)
);

create table medicines(
MName varchar(100) Primary key,
PDosage varchar(30),
foreign key (MName) references MedInformation(MSFName)
);


create table MedInformation(
CName varchar(100),
PName varchar(100),
MSFName varchar(100),
FDosage varchar(50),
Diagnosis varchar(200),
SInstructions varchar(300),
Price int,
Primary key (MSFName),
Foreign key (CName) references Pets(CName),
foreign key (PName) references pets(PName)
);


create table Pets(
CName varchar(100),
PName varchar(100),
CTPrimary varchar(10),
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
CTPrimary varchar(10) unique,
SPrimary int unique,
primary key (CName, CTPrimary)
);

create table Appointment(
CName varchar(100),
PName varchar(100),
TPrimary varchar(10),
AppTime date,
AppDate date,
Pvisit varchar(50),
Fee int,
primary key (AppTime, AppDate, Pvisit),
foreign key (CName) references Customer(CName),
foreign key (TPrimary) references Customer(CTPrimary),
foreign key (PName) references Pets(PName)
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
CTPrimary varchar(10),
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

-- Insert for Special Food --
insert into SpecialFood values ('Zesty Paws, Probiotic Bites for Dogs','90 Soft Chews');
insert into SpecialFood values ('Pet Naturals of Vermont, Daily Probiotic, For Cats','30 Soft Chews');


-- Insert for Medicine --
insert into medicines values ('Beaphar Fiprotec for Dogs','4 pipettes of 100mg');
insert into medicines values ('Beaphar Fiprotec for Cats','4 pipettes of 50mg');
insert into medicines values ('Beaphar Multi-Vit Parrots Healthcare Supplements','20 ml');
insert into medicines values ('VetPlus Coatex for Hair and Skin Care for Dogs and Cats in Capsules','100 grams');


-- Insert for MedInformation --
insert into MedInformation values ('Anna','Max','Zesty Paws, Probiotic Bites for Dogs','2 per day','Gut Function, Gut Health','y',115);
insert into MedInformation values ('Jeremy','Zoe','Beaphar Multi-Vit Parrots Healthcare Supplements','2 per day','General health','',115);
insert into MedInformation values ('Thomas','Luna','Beaphar Fiprotec for Dogs','4 pipettes of 100mg','fleas and ticks','Part the dogs’s fur between the shoulder blades and apply the contents of one pipette to the skin’s surface, ideally split between two areas roughly 2cm apart, one at the base of the head and the second 2-3cm further back. For continuous protection re-apply once every four weeks',95);
insert into MedInformation values ('Bob','Leo','VetPlus Coatex for Hair and Skin Care for Dogs and Cats in Capsules','1-2 per day','Skin & Coat','Up to 25 lbs, daily amount is 1 Soft Chew, 26-75 lbs, daily amount is 2 Soft Chews, Over 75 lbs, Daily amount is 3 Soft Chews',115);
insert into MedInformation values ('Sandro','Koko','Beaphar Fiprotec for Cats','Daily dosage of 1 capsule','Hair loss, dry or reddened skin, dandruff, and flaking','Daily dosage of 1 capsule',64);
insert into MedInformation values ('Sandro','Abby','Pet Naturals of Vermont, Daily Probiotic, For Cats','1 per day','Mucosal lining of the urinary tract','Eat 1 per day',45);


-- Insert for MedInformation --
insert into MedInformation values ('Anna','Max','Zesty Paws, Probiotic Bites for Dogs','2 per day','Gut Function, Gut Health','y',115);
insert into MedInformation values ('Jeremy','Zoe','Beaphar Multi-Vit Parrots Healthcare Supplements','2 per day','General health','',115);
insert into MedInformation values ('Thomas','Luna','Beaphar Fiprotec for Dogs','4 pipettes of 100mg','fleas and ticks','Part the dogs’s fur between the shoulder blades and apply the contents of one pipette to the skin’s surface, ideally split between two areas roughly 2cm apart, one at the base of the head and the second 2-3cm further back. For continuous protection re-apply once every four weeks',95);
insert into MedInformation values ('Bob','Leo','VetPlus Coatex for Hair and Skin Care for Dogs and Cats in Capsules','1-2 per day','Skin & Coat','Up to 25 lbs, daily amount is 1 Soft Chew, 26-75 lbs, daily amount is 2 Soft Chews, Over 75 lbs, Daily amount is 3 Soft Chews',115);
insert into MedInformation values ('Sandro','Koko','Beaphar Fiprotec for Cats','Daily dosage of 1 capsule','Hair loss, dry or reddened skin, dandruff, and flaking','Daily dosage of 1 capsule',64);
insert into MedInformation values ('Sandro','Abby','Pet Naturals of Vermont, Daily Probiotic, For Cats','1 per day','Mucosal lining of the urinary tract','Eat 1 per day',45);


-- Insert for Pets --
insert into Pets values ('Anna','Max','0502345645','Black','Male','2018-08-31',32,'Labrador','Dog');
insert into Pets values ('Bob','Leo','0508976767','Brown and White','Male','2015-01-15',10,'Beagle','Dog');
insert into Pets values ('Thomas','Luna','0523039378','Grey','Female','2018-06-11',28,'Greyhound','Dog');
insert into Pets values ('Sandro','Abby','0502998765','White','Female','2012-03-01',6,'Ragdoll','Cat');
insert into Pets values ('Sandro','Koko','0502998765','White','Male','2020-02-04',7,'Siamese','Cat');
insert into Pets values ('Jeremy','Zoe','0506543749','Green','Female','2021-07-25',0.03,'Parrotlet','Bird');


-- Insert for Customer --
insert into Customer values ('Anna','Springs,UAE','0502345645','0566788934');
insert into Customer values ('Bob','Arabian Ranches,UAE','0508976767','0507867892');
insert into Customer values ('Thomas','Arabian Ranches,UAE','0523039378','0564355628');
insert into Customer values ('Sandro','Jumeirah Village Circle, UAE','0502998765','0507776543');
insert into Customer values ('Jeremy','Meadows,UAE','0506543749','0503454485');


-- Insert For Appointment --
insert into Appointment values ('Anna','Max','0502345645',str_to_date("193010", "%H%i%s"),DATE_FORMAT("2020-06-15", "%Y/%m/%d"),'Doctor Visit',300);
insert into Appointment values ('Anna','Max','0502345645',str_to_date("153510", "%H%i%s"),DATE_FORMAT("2021-06-11", "%Y/%m/%d"),'Vaccination',500);
insert into Appointment values ('Bob','Leo','0508976767',str_to_date("124500", "%H%i%s"),DATE_FORMAT("2020-08-21", "%Y/%m/%d"),'Health Check',150);
insert into Appointment values ('Bob','Leo','0508976767',str_to_date("170000", "%H%i%s"),DATE_FORMAT("2022-01-05", "%Y/%m/%d"),'Special Food',150);
insert into Appointment values ('Sandro','Abby','0502998765',str_to_date("153510", "%H%i%s"),DATE_FORMAT("2022-01-24", "%Y/%m/%d"),'Doctor Visit',300);
insert into Appointment values ('Sandro','Abby','0502998765',str_to_date("165010", "%H%i%s"),DATE_FORMAT("2022-03-03", "%Y/%m/%d"),'Vaccination',500);
insert into Appointment values ('Sandro','Koko','0502998765',str_to_date("153510", "%H%i%s"),DATE_FORMAT("2022-02-24", "%Y/%m/%d"),'Doctor Visit',300);


-- Insert for Legal_Req --
insert into Legal_Req values("Rabies",'Can be administered in one dose, as early as 3 months of age. States regulate the age at which it is first administered. Annual boosters are required.');
insert into Legal_Req values('Distemper','At least 3 doses, given between 6 and 16 weeks of age');
insert into Legal_Req values('Feline Viral Rhinotracheitis','All kittens and adult cats receiving this vaccine for the first time should receive a series of boosters which are separated by 3-4 weeks. The frequency of vaccination thereafter is determined by your veterinarian.');
insert into Legal_Req values("Canine Influenza",'every 3 years');
insert into Legal_Req values('Candida','These shots are given every 3 to 4 weeks from the time a puppy is 6 weeks old until he is at least 16 weeks of age.');
insert into Legal_Req values ('Feline Leukaemia', 'It is recommened annually for cats that go outside and have exposure with other cats and/or live with FeLV');
insert into Legal_Req values ('Feline Calicivirus', 'Two or three injections are recommended in kittens, starting at around 8 weeks of age');
insert into Legal_Req values ('Bordetella', 'healthy adult dogs that come into contact with large groups of other dogs should have a Bordetella vaccine annually, and boarding facilities may require a booster within the last six months');
insert into Legal_Req values ('Leptospirosis', 'Currently available vaccines effectively prevent leptospirosis and protect dogs for at least 12 months. ');
insert into Legal_Req values ('polyomavirus', 'Some avian veterinarians recommend vaccination starting at 21 days of age and repeat the vaccine in two weeks. They then follow the recommendation that the parrot should receive the vaccine yearly');
insert into Legal_Req values ('Feline Panleucopaenia', 'Licensed FPV vaccine schedules generally dictate an initial subcutaneous dose at 8-9 weeks of age, followed by a booster 3-4 weeks later. This is then followed by a booster injection 12 months later, and boosters every 3 years thereafter');


-- Insert for Disease --
insert into Disease values ("Rabies", "Flu, weakness, fever, headache");
insert into Disease values ('Distemper', 'Fever, nasal and eye discharge, lethargy, sneezing, vomiting');
insert into Disease values ('Feline Viral Rhinotracheitis', 'Nasal congestion, excessive eye blinking and squinting, redness around and in the eye');
insert into Disease values ('Canine Influenza', 'Loss of appetite, abdominal pain, fever, diarrhea');
insert into Disease values ('Candida', 'Excessive shaking of the head, skin rashes and infections,  scratching of the ears or other places on the body');
insert into Disease values ('Feline Leukaemia', 'Fever or chills,  Persistent fatigue, Frequent or severe infections');
insert into Disease values ('Feline Calicivirus', 'sneezing, nasal congestion, fever');
insert into Disease values ('Bordetella', 'Cold temperatures, exposure to dust or cigarette smoke, travel-induced stress');
insert into Disease values ('Leptospirosis', 'Muscle aches, vomiting, jaundice (yellow skin and eyes)');
insert into Disease values ('polyomavirus', 'anorexia, weight loss, delayed crop emptying, regurgitation, diarrhea, wet droppings');
insert into Disease values ('Feline Panleucopaenia', 'vomiting, diarrhoea, anorexia');


-- Insert for VacPet --
-- Anna's Pet --
insert into VacPet values ('0502345645','Max','RABVAC','Rabies',DATE_FORMAT("2021-06-11", "%Y/%m/%d"));
insert into VacPet values ('0502345645','Max','DHPP','Distemper',DATE_FORMAT("2020-11-19", "%Y/%m/%d"));
-- Bob's Pet --

insert into VacPet values ('0508976767','Leo','DHPP','Distemper',DATE_FORMAT("2020-08-21", "%Y/%m/%d"));
insert into VacPet values ('0508976767','Leo','DA2PP','Rabies',DATE_FORMAT("2021-09-27", "%Y/%m/%d"));
-- Sandro's Pet

insert into VacPet values ('0502998765','Abby','FVRCP','Feline Viral Rhinotracheitis',DATE_FORMAT("2022-01-21", "%Y/%m/%d"));
insert into VacPet values ('0502998765','Abby','FeLV','Feline Leukaemia',DATE_FORMAT("2022-01-21", "%Y/%m/%d"));

insert into VacPet values ('0502998765','Koko','FVRCP','Feline Viral Rhinotracheitis',DATE_FORMAT("2021-01-31", "%Y/%m/%d"));
insert into VacPet values ('0502998765','Koko','FeLV','Feline Calicivirus',DATE_FORMAT("2020-03-11", "%Y/%m/%d"));
insert into VacPet values ('0502998765','Koko','FVRCP','Feline Panleucopaenia',DATE_FORMAT("2021-01-31", "%Y/%m/%d"));

-- Thomas's Pet --
insert into VacPet values ('0523039378','Luna','DHPP','Bordetella',DATE_FORMAT("2021-01-31", "%Y/%m/%d"));
insert into VacPet values ('0523039378','Luna','NOBIVAC','Leptospirosis',DATE_FORMAT("2020-03-11", "%Y/%m/%d"));
insert into VacPet values ('0523039378','Luna','NOBIVAC','Canine Influenza',DATE_FORMAT("2021-02-26", "%Y/%m/%d"));

-- Jeremy's Pet --
insert into VacPet values ('0506543749','Zoe','FVRCP','polyomavirus',DATE_FORMAT("2020-05-31", "%Y/%m/%d"));
insert into VacPet values ('0506543749','Zoe','Nystatin','candida',DATE_FORMAT("2021-04-30", "%Y/%m/%d"));

-- End Insert for VacPets --


-- Insert for Vaccination --
insert into Vaccination values ('RABVAC','Once every year',1);
insert into Vaccination values ('DHPP','Once every 3 years',3);
insert into Vaccination values ('DA2PP','Once every year',1);
insert into Vaccination values ('FVRCP','Once every 3 years',3);
insert into Vaccination values ('FeLV','Once every year',1);
insert into Vaccination values ('NOBIVAC','Once every year',1);
insert into Vaccination values ('Nystatin','Once every 3 years',3);


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
-- 

-- TASK 4: Show all the vaccination records for all pets --
select distinct c.CName,vp.CTPrimary,vp.PName,vp.DName,vp.VName,vp.VDate from VacPet as vp, Pets as p, Customer as C  where p.PName=vp.PName and vp.CTPrimary=p.CTPrimary and p.CTPrimary=c.CTPrimary;

-- TASK 4: Show the amount paid by customers for each visit --
select CName,PName,Fee from appointment;

-- TASK 4: Show the total amount of fees paid by customers for each months for last 3 months --
SELECT distinct CName, sum(fee) from appointment where AppDate > str_to_date('01/01/2022','%d/%m/%YY') and AppDate < str_to_date('31/01/2022','%d/%m/%YY');
SELECT distinct CName, sum(fee) from appointment where AppDate > str_to_date('01/02/2022','%d/%m/%YY') and AppDate < str_to_date('28/02/2022','%d/%m/%YY');
SELECT distinct CName, sum(fee) from appointment where AppDate > str_to_date('01/03/2022','%d/%m/%YY') and AppDate < str_to_date('31/03/2022','%d/%m/%YY');
SELECT distinct CName, fee from appointment where AppDate > str_to_date('01/01/2022','%d/%m/%YY') and AppDate < str_to_date('31/03/2022','%d/%m/%YY');

-- TASK 4: Show the pet with most visits --
SELECT distinct CDName,PDName,Max(CNT) as visit from (select distinct PName as PDName,CName as CDName,count(PName) as CNT from Appointment group by CName) as subq1, appointment group by CName;

-- Task 4: Show the pets that never visited the clinic --
select PName from Pets where PName not in(select PName from Appointment);

-- Task 4: Show the pets that received all vaccines --
select count(VName) from VacPet group by PName;
select distinct count(VName) from Vaccination, Pets Spcs like 'Dog';
select distinct count(VName) from VacPet, Pets where VacPet.PName=Pets.PName and Spcs like 'Cat';
select distinct count(VName) from VacPet, Pets where VacPet.PName=Pets.PName and Spcs like 'Bird';

-- Task 4: Show the name of the medicine or special food that was given to each pet. (IF statement) --
select distinct mi.CName,mi.PName, if(p.PName=mi.PName and p.CName=mi.CName,MSFName,"") as medicine from MedInformation as mi, Pets as p;

-- Task 4: Show the number of visits and amounts paid for each pet --
select CName,PName,count(PName) as Number_of_Visits,sum(fee) from appointment group by PName;

-- Task 5: For a customer and pet, you can show all the records related to the pet and total cost and number of visits

