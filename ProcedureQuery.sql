-- -------------------------------------------------
-- creating procedures
-- -------------------------------------------------

-- -------------------------------------------------
-- Procedure for inserting in Orphanage table
-- -------------------------------------------------
DELIMITER $$
CREATE PROCEDURE Insert_into_Orphanage (Orp_Name VARCHAR(45),
Loc VARCHAR(10))
BEGIN
insert into Orphanage (Orphanage_Name, Location) values (Orp_Name,Loc);
END; 
$$
-- ---------------------------------------------------
DELIMITER ;

CALL Insert_into_Orphanage ('Hope','Boston');
CALL Insert_into_Orphanage ('Silver Lining','Cambridge');
CALL Insert_into_Orphanage ('Sunshine','Quincy');

select * from Orphanage;

-- ---------------------------------------------------
-- Procedure for inserting in Person table
-- ---------------------------------------------------
DELIMITER $$
CREATE PROCEDURE Insert_into_Person (
  F_Name VARCHAR(45) ,
  L_Name VARCHAR(45) ,
  Dob DATE ,
  Sex VARCHAR(10),
  roles VARCHAR(10),
  email_id VARCHAR(45))
BEGIN
insert into Person (First_Name, Last_Name, DOB, Gender , Roles,email_id) values (F_Name, L_Name, Dob, Sex, roles,email_id);
END; 
$$
DELIMITER ;
-- ----------------------------------------------------
CALL Insert_into_Person ('Marry','Brown','1970-07-01','Male','Sponsor','marry@gmail.com');
CALL Insert_into_Person ('Bob','Marley','1972-01-01','Female','Sponsor','bob@gmail.com');

CALL Insert_into_Person('Amy','Patrick','1990-06-01','Female','CareTaker','amy@gmail.com');
CALL Insert_into_Person ('Carrie','Patrick','1987-09-01','Female','CareTaker','carrie@gmail.com');

CALL Insert_into_Person('Nimay','Nik','1980-12-01',	'Male',	'Foster','nimay@gmail.com');
CALL Insert_into_Person('Sanjana','Gose','1982-09-01','Female','Foster','san@gmail.com');
-- CALL Insert_into_Person('Ritwik','Sen','1989-09-01','Male','Foster','rit@gmail.com');

CALL Insert_into_Person('Ajay',	'N','2011-12-01','Male','Child','');
CALL Insert_into_Person('Saumya','Singh','2015-09-01','Female','Child','');
CALL Insert_into_Person('Sam','Smith','2017-09-01','Male','Child', null);

select * from Person;

-- ---------------------------------------------------
-- Procedure for inserting in Resources table
-- ---------------------------------------------------
DELIMITER $$
CREATE PROCEDURE Insert_into_Resources (
  item VARCHAR(10),
  Av_Bal INT ,
  Time_Per DATE)
BEGIN
insert into Resources (Item, Available_Balance, Time_Period ) 
values (item ,  Av_Bal,  Time_Per);
END; 
$$

DELIMITER ;
CALL Insert_into_Resources ("Education",4800,"2018-01-01");
CALL Insert_into_Resources ("Medical",3800,"2018-02-21");
CALL Insert_into_Resources ("Food",2800,"2018-12-04");

select * from Resources;
-- ---------------------------------------------------


-- ---------------------------------------------------
-- Procedure for inserting in orphanage_has_resources table
-- ---------------------------------------------------
DELIMITER $$
CREATE PROCEDURE Insert_into_orphanage_has_resources (
  orphanage_idorphanage INT ,
  resources_idResources INT)
BEGIN
insert into orphanage_has_resources (orphanage_idorphanage, resources_idResources) 
values (orphanage_idorphanage, resources_idResources);
END; 
$$

DELIMITER ;

CALL Insert_into_orphanage_has_resources (1,3);
CALL Insert_into_orphanage_has_resources (1,2);


select * from orphanage_has_resources;
-- ---------------------------------------------------


-- ---------------------------------------------------
-- Procedure for inserting in caretaker table
-- ---------------------------------------------------
DELIMITER $$
CREATE PROCEDURE Insert_into_caretaker (
  DOJ DATE ,
  Person_idPerson INT,
  orphanage_idorphanage INT)
BEGIN
DECLARE roles varchar(20);
SET roles = (SELECT Roles From person WHERE idPerson =Person_idPerson );
 IF(roles = 'CareTaker') THEN
insert into caretaker (DOJ, Person_idPerson, orphanage_idorphanage ) 
values (DOJ, Person_idPerson, orphanage_idorphanage);
END IF;
END; 
$$
DELIMITER ;
CALL Insert_into_caretaker ("2015-09-09", 3 , 1);
CALL Insert_into_caretaker (curdate(),10,2);

select * from person;
-- ---------------------------------------------------------------

-- ---------------------------------------------------
-- Procedure for inserting in child table
-- ---------------------------------------------------
DELIMITER $$
CREATE PROCEDURE Insert_into_child (
  Date_Of_Entry DATE ,
  Person_idPerson INT ,
  caretaker_Person_idPerson INT ,
  orphanage_idorphanage INT,
  Current_status VARCHAR (15))
BEGIN
DECLARE roles varchar(20);
SET roles = (SELECT Roles From person WHERE idPerson =Person_idPerson );
 IF(roles = 'Child') THEN
insert into child (Date_Of_Entry, Person_idPerson,caretaker_Person_idPerson, orphanage_idorphanage,Current_status ) 
values (Date_Of_Entry, Person_idPerson,caretaker_Person_idPerson, orphanage_idorphanage,Current_status);
END IF;
END; 
$$
 DELIMITER ; 
CALL Insert_into_child ("2015-12-01", 1, 3, 1, 'Not Adopted');
CALL Insert_into_child (CURDATE(),11,10,2,'Not Adopted');

select * from person where idperson=7;
select * from child;
-- ---------------------------------------------------------------
drop procedure Insert_into_child;
-- ---------------------------------------------------
-- Procedure for inserting in volunteer_for_adoption table
-- ---------------------------------------------------
DELIMITER $$
CREATE PROCEDURE Insert_into_volunteer_for_adoption (
  Date_Of_Registration DATE ,
  Person_idPerson INT ,
  child_Person_idPerson INT)
BEGIN
DECLARE roles varchar(20);
SET roles = (SELECT Roles From person WHERE idPerson =Person_idPerson );
 IF(roles = 'Foster') THEN
insert into volunteer_for_adoption (Date_Of_Registration, Person_idPerson, child_Person_idPerson) 
values (Date_Of_Registration, Person_idPerson, child_Person_idPerson);
END IF;
end 
$$
DELIMITER ;

CALL Insert_into_volunteer_for_adoption ("2018-11-01", 5 , 7);
CALL Insert_into_volunteer_for_adoption ("2017-10-01", 6 , 8);

CALL Insert_into_volunteer_for_adoption (CURDATE(), 10 , 11);

select * from volunteer_for_adoption;
select * from person;
select * from education;
select * from child;
-- --------------------------------------------------------------
-- ---------------------------------------------------
-- Procedure for inserting in adoption_details
-- ---------------------------------------------------
DELIMITER $$
CREATE PROCEDURE Insert_into_adoption_details (
  Adoption_Application_Date DATE,
  Adoption_Application_Approval_Date DATE ,
  Adoption_Date DATE ,
  volunteer_for_adoption_Person_idPerson INT)
BEGIN
insert into adoption_details (Adoption_Application_Date, Adoption_Application_Approval_Date, Adoption_Date,volunteer_for_adoption_Person_idPerson) 
values (Adoption_Application_Date, Adoption_Application_Approval_Date, Adoption_Date,volunteer_for_adoption_Person_idPerson);
END; 
$$
DELIMITER ;
CALL Insert_into_adoption_details ("2017-11-01","2017-12-01","2018-01-01",5);
CALL Insert_into_adoption_details ("2017-10-01","2016-11-01","2018-11-02",6);

select * from adoption_details;

-- ----------------------------------------------------------------------------
-- ---------------------------------------------------
-- Procedure for inserting in sponsor
-- ---------------------------------------------------
DELIMITER $$
CREATE PROCEDURE Insert_into_sponsor (
  Sponsor_Resource VARCHAR(45) ,
  Sponsoring_Date DATE,
  Sponsoring_Amount DECIMAL(3,0),
  person_idPerson INT )
BEGIN
DECLARE roles varchar(20);
SET roles = (SELECT Roles From person WHERE idPerson =Person_idPerson );
 IF(roles = 'Sponsor') THEN
insert into sponsor (Sponsor_Resource, Sponsoring_Date, Sponsoring_Amount,person_idPerson) 
values (Sponsor_Resource, Sponsoring_Date, Sponsoring_Amount,person_idPerson);
END IF;
END;
$$

DELIMITER ;

CALL Insert_into_sponsor ('Food','2017-12-01',500,1);
CALL Insert_into_sponsor ('Education','2018-08-01',800,2);

select * from sponsor;

-- -------------------------------------------------------------------------------------------

-- ---------------------------------------------------
-- Procedure for inserting in sponsor
-- ---------------------------------------------------
DELIMITER $$
CREATE PROCEDURE Insert_into_orphanage_has_sponsor (
  orphanage_idorphanage INT ,
  sponsor_person_idPerson INT ,
  sponsor_Sponsoring_Date DATE  )
BEGIN
insert into orphanage_has_sponsor (orphanage_idorphanage, sponsor_person_idPerson, sponsor_Sponsoring_Date) 
values (orphanage_idorphanage, sponsor_person_idPerson, sponsor_Sponsoring_Date);
END; 
$$

DELIMITER ;

CALL Insert_into_orphanage_has_sponsor (1,1,'2017-12-01');
CALL Insert_into_orphanage_has_sponsor (1,2,'2018-08-01');


select * from orphanage_has_sponsor;

-- ----------------------------------------------------------------------------------
 -- ---------------------------------------------------
-- Procedure for inserting in medical
-- ---------------------------------------------------
DELIMITER $$
CREATE PROCEDURE Insert_into_medical (
  Issue VARCHAR(45) ,
  Reported_On DATE,
  Hospital_Name VARCHAR(45),
  Current_Status VARCHAR(45) ,
  child_Person_idPerson INT )
BEGIN
insert into medical (Issue, Reported_On, Hospital_Name,Current_Status,child_Person_idPerson) 
values (Issue, Reported_On, Hospital_Name,Current_Status,child_Person_idPerson);
END; 
$$

DELIMITER ;

CALL Insert_into_medical ("Fever",'2017-12-01','Boston child hospital','Cured',7);

select * from medical;

-- ----------------------------------------------------------------------------------------

 -- ---------------------------------------------------
-- Procedure for inserting in education
-- ---------------------------------------------------
DELIMITER $$
CREATE PROCEDURE Insert_into_education (
  School_Name VARCHAR(45) ,
  Education_Start_Date DATE ,
  child_Person_idPerson INT,
   Education_End_Date DATE
  )
BEGIN
insert into education (School_Name, Education_Start_Date, child_Person_idPerson,Education_End_Date) 
values (School_Name, Education_Start_Date, child_Person_idPerson,Education_End_Date);
END; 
$$

DELIMITER ;

CALL Insert_into_education ("Boston Public School",'2011-08-06',7,'2017-07-03');

select * from education;