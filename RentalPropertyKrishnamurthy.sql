drop schema if exists RentalPropertyKrishnamurthy;
create schema RentalPropertyKrishnamurthy;
use RentalPropertyKrishnamurthy;

DROP TABLE IF EXISTS `Rental_agreement`;
DROP TABLE IF EXISTS `Renter`; 
DROP TABLE IF EXISTS `Beach_property`;
DROP TABLE IF EXISTS `Mountain_property`;
DROP TABLE IF EXISTS `Property`;
DROP TABLE IF EXISTS `Property_activity`;
DROP TABLE IF EXISTS `Activity`;

create table `Renter`(
renter_id int not null auto_increment,
last_name varchar(50)DEFAULT NULL,
first_name varchar(50)DEFAULT NULL,
middle_initial varchar(50)DEFAULT NULL,
address varchar(50)DEFAULT NULL,
phone int DEFAULT NULL,
email varchar(50)DEFAULT NULL,
primary key(renter_id)
);

Insert into `Renter` values(11,'Dhoni','Mahendra Singh','Captain','7,Chepauk stadium,jharkhand',7777,'dhoni07@gmail.com'),
(12,'Raina','Suresh','Cool captain','3,Gandhi road,adayar',3333,'raina03@gmail.com'),
(13,'Ronaldo','Cristiano','Goat','17,Portugual footbal ground',1221,'ronaldo@gmail.com'),
(14,'Messi','Lionel','Beast','03 Argentnia,football ground',73333,'messi@gmail.com'),
(15,'Cena','John','Champion','45,champion stadium,chennai',3323,'Cena@gmail.com'),
(16,'Jadeja','Ravindra','Finisher','8,Gujarat stadium',123,'jadeja@gmail.com'),
(17,'Starc','Mitchell','Yorker','1,Melborune stadium',678,'starc@gmail.com'),
(18,'Mpappe','France','Fifa','45,France stadium',129,'mpappe@gmail.com'),
(19,'Neymar','Junior','Dribble','34,Brazil ground',432,'neymar@gmail.com'),
(20,'Rossi','Valentino','Biker','43,Italian racetrack',364,'rossi@gmail.com'),
(21,'Sebastin','Vetttel','racer','65,Dubai racetrack',723,'sebastin@gmail.com'),
(22,'Halland','erling','defender','37,Mancheaste united stadium',397,'halland.com'),
(23,'Snow','Jon','North king','91,dragons stone',90,'jonsnow@gmail.com'),
(24,'Ragnar','Vikings','lodbrok','93,Swedish stone',673,'ragnar@gmail.com'),
(25,'Uthred','Bamburg','Northrubmia','56,Northrumbian lands',783,'uthred@gmail.com');


create table `Property`(
property_id int not null auto_increment,
property_type char(1),
street_address varchar(50) DEFAULT NULL,
city_state varchar(50) DEFAULT NULL,
zip varchar(50) DEFAULT NULL,
Nbr_rooms varchar(50) default null,
base_rate int default null,
main_property int default null,
primary key(property_id),
foreign key (main_property) references Property(property_id),     #Main property is declared as foreign key as stated in the given DBDL diagram description
constraint vtcc_property check(property_type IN ('B','M'))
);


Insert into `Property`(property_id,property_type,street_address,city_state,zip,Nbr_rooms,base_rate,main_property)values (1001,'B','anna salai street','chennai',600056,'4a',100,1001),
(1002,'M','downtown street','halifax','B3K 42','4b',200,1002),
(1003,'B','argyle street','mumbai','B1K 4K1','4c',300,1003),
(1004,'M','robie street','delhi','B2K 4K2','4d',400,1004),
(1005,'B','thiruvalluvar hyderabad','chennai',600012,'4e',500,1005),
(1006,'B','south street','jaipur',600013,'5a',600,1006),
(1007,'M','cape breton street','star','B3K 432','5b',700,1007),
(1008,'B','north street','tokyo','B1K 4W1','5c',800,1008),
(1009,'M','north ridge road','trivandrum','B2K 442','5d',900,1009),
(1010,'B','novalea drive','kottayam',600034,'5e',150,1010),
(1011,'B','duffus street','madurai',600057,'6a',160,1011),
(1012,'M','lawton street','coimbatore','B3K 32','6b',170,1012),
(1013,'B','atlantic street','trichy','B1K 1K3','6c',180,1013),
(1014,'M','walmart street','chengalpattu','B1K 8K2','6d',190,1014),
(1015,'B','cotsco street','karur',600090,'6e',110,1015);


create table `Rental_agreement`(
agreement_id int not null auto_increment,
renter_id int default null,
property_id int default null,
Begin_date DATE DEFAULT NULL,
End_date DATE DEFAULT NULL,
Rental_amount int DEFAULT NULL,
primary key(agreement_id),
KEY `CSA_FK1` (`renter_id`),
KEY `CSA_FK2` (`property_id`),
CONSTRAINT `CSA_FK1` FOREIGN KEY (`renter_id`)
REFERENCES `Renter` (`renter_id`),
CONSTRAINT `CSA_FK2` FOREIGN KEY (`property_id`)
REFERENCES `Property` (`property_id`)
);

Insert into `Rental_agreement` values(41,11,1001,'2021-01-01','2022-01-01',45000),
(42,12,1002,'2021-02-02','2022-02-02',46000),
(43,13,1003,'2021-03-03','2022-03-03',47000),
(44,14,1004,'2021-04-05','2022-04-04',48000),
(45,15,1005,'2021-06-06','2022-05-05',49000),
(46,16,1006,'2021-07-07','2022-06-06',50000),
(47,17,1007,'2021-08-08','2022-07-07',51000),
(48,18,1008,'2021-09-09','2022-08-08',52000),
(49,19,1009,'2021-10-10','2022-09-09',53000),
(50,20,1010,'2021-11-11','2022-10-10',54000),
(51,21,1011,'2021-12-12','2022-11-11',55000),
(52,22,1012,'2021-01-06','2022-12-12',56000),
(53,23,1013,'2021-01-07','2022-01-07',57000),
(54,24,1014,'2021-01-08','2022-01-08',58000),
(55,25,1015,'2021-01-09','2022-01-09',59000);


create table `Beach_property`(
Bproperty_id int not null,
Blocks_to_beach varchar(100),
primary key (Bproperty_id),
foreign key (Bproperty_id) references Property(property_id));

Insert into Beach_property(Bproperty_id,Blocks_to_beach) values (1001,'1a'),(1003,'1b'),(1005,'1c');


create table Mountain_property(
Mproperty_id int not null,

primary key(Mproperty_id),
foreign key(Mproperty_id) references Property(property_id));

Insert into `Mountain_property`(Mproperty_id)values(1002);



create table Activity (
activity_id int not null,
activity_desc varchar(100),
primary key(activity_id));

Insert into `Activity`(activity_id,activity_desc) values (201,'Best beach');


create table Property_activity(
Mproperty_id int not null,
activity_id int not null,
primary key(Mproperty_id,activity_id),
foreign key (activity_id) references Activity(activity_id),
foreign key(Mproperty_id) references Mountain_property(Mproperty_id));

Insert into Property_activity (Mproperty_id,activity_id) values (1002,201);




#As Per question we already created table and inserted values in Question 1a) Now as per question 
#1C)first part we need to create intergrity constraint, so we use unique key for property_id, begin_date,end_date for no repeated values


Use RentalPropertyKrishnamurthy;
Alter table  `Rental_agreement`
ADD Constraint `unique_value`
unique(property_id,Begin_date,End_date);

#In the second part of the question we need to throw an error message if the above constraint is violated so we are using trigger function with before insert functionality
#To drop or throw an error message when the property_id value is inserted twice with same date or if the property_id ,begin date or end date is within the previous value range
#Then it will throw an error message


DROP TRIGGER Rental_agreement_validity_check

DELIMITER $$
CREATE TRIGGER Rental_agreement_validity_check
BEFORE INSERT ON Rental_agreement
FOR EACH ROW
BEGIN
    IF (
        SELECT COUNT(*) FROM Rental_agreement WHERE property_id = NEW.property_id 
        AND Begin_date = NEW.Begin_date 
        AND End_date = NEW.End_date
    ) > 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Duplicate rental property agreement';
 END IF;
    
END
$$
DELIMITER ;


Insert into `Rental_agreement` values(103,11,1003,'2025-05-01','2026-01-01',45000)




