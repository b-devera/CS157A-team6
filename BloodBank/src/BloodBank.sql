DROP DATABASE IF EXISTS BloodBank;
CREATE DATABASE BloodBank;
USE BloodBank;

-- admin table
DROP TABLE IF EXISTS admin;
CREATE TABLE admin(
	id INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(36) NOT NULL,
    last_name VARCHAR(36) NOT NULL,
    age INT NOT NULL,
    gender CHAR(1) NOT NULL,
    password VARCHAR(36) NOT NULL
);

-- admin input
INSERT INTO admin(first_name,last_name,age,gender,password)
VALUES('Admin','Test',42,'M','password'),
('Darth','Vader',50,'M','force'),
('Obiwan','Kenobi',60,'M','highground');

-- inventory table
DROP TABLE IF EXISTS inventory;
CREATE TABLE inventory (
	bag_id INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	donation_id INT(8) NOT NULL REFERENCES donation(donation_id),
    employee_id INT(8) NOT NULL REFERENCES employee(id),
    blood_type VARCHAR(3) NOT NULL,
    quantity INT(8) NOT NULL,
    expiration DATE NOT NULL,
    approved_by INT(8) REFERENCES admin(id)
);

-- inventory input
INSERT INTO inventory(donation_id,employee_id,blood_type,quantity,expiration,approved_by) 
VALUES(1,23,'AB+',500,'2022-08-01',1),
(2,23,'AB+',560,'2022-08-11',2),
(3,19,'A+',550,'2022-08-01',3),
(4,15,'B+',150,'2022-09-04',3),
(5,17,'AB-',230,'2022-08-01',2),
(6,20,'O-',700,'2022-08-11',3),
(7,21,'O+',800,'2022-08-01',3),
(8,12,'A+',1000,'2022-09-01',1),
(9,11,'B-',501,'2022-08-24',2),
(10,14,'A-',523,'2022-08-16',3),
(11,13,'B+',545,'2022-08-30',2),
(12,11,'AB-',673,'2022-08-01',1);

-- donor table
DROP TABLE IF EXISTS donor;
CREATE TABLE donor (
	id INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(36) NOT NULL,
    last_name VARCHAR(36) NOT NULL,
    gender CHAR(1) NOT NULL,
    age INT NOT NULL,
    blood_type VARCHAR(3) NOT NULL,
    heightIN INT NOT NULL,
    weightLB INT NOT NULL,
    username VARCHAR(36) NOT NULL UNIQUE,
    password VARCHAR(36) NOT NULL,
    eligibility DATE
);

-- donor input
INSERT INTO donor(first_name,last_name,gender,age,blood_type,heightIN,WeightLB,username,password)
VALUES('First','Test','M',23,'AB+',70,210,'test','test'),
	('Mr','Spock','M',102,'B-',72,170,'spock','vulcan'),
    ('Worf','Mogh','M',54,'AB-',73,190,'klingon','pride'),
    ('Tom','Rosenthal','M',34,'A-',67,130,'watermelon','pasta'),
    ('Robert','Smith','M',63,'B+',70,201,'cure','friday'),
    ('Jim','Hopper','M',45,'A+',73,201,'hops','cop'),
    ('Winona','Ryder','F',50,'AB-',65,120,'will','where'),
    ('Gates','McFadden','F',73,'A+',68,130,'doctor','picard'),
    ('Marina','Sitris','F',67,'O-',65,130,'dianna','ryker'),
    ('Jonathan','Frakes','M',69,'O+',75,201,'number1','makeitso');

-- patient table
DROP TABLE IF EXISTS patient;
CREATE TABLE patient (
	id INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(36) NOT NULL,
    last_name VARCHAR(36) NOT NULL,
    blood_type VARCHAR(3) NOT NULL,
    username VARCHAR(36) NOT NULL UNIQUE,
    password VARCHAR(36) NOT NULL
);

-- patient input
INSERT INTO patient(first_name,last_name,blood_type,username,password)
VALUES('Patient','Zero','O-','pz','pz'),
	('Jim','Doe','A+','jimdoe','jim'),
    ('Brent','Spiner','AB-','data','android'),
    ('Will','Riker','B+','beard','man');

-- employee table
DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
	id INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(36) NOT NULL REFERENCES person(first_name),
    last_name VARCHAR(36) NOT NULL REFERENCES person(last_name),
    age INT NOT NULL REFERENCES person(age),
    gender CHAR(1) NOT NULL,
    password VARCHAR(36) NOT NULL
);

-- employee input
INSERT INTO employee VALUES
	(11, 'MADELINE', 'STEWART', 24, 'F','Stew'),
    (12, 'HANA', 'WHEELER', 26,'F','password'),
    (13, 'FRANKLIN', 'FORSTER', 29,'M','tree'),
    (14, 'AZRA', 'PEARSON', 31,'M','book'),
    (15, 'LESLEY', 'WARNER', 32,'F','les'),
    (16, 'ABIGAIL', 'HAYES', 27,'F','pie314'),
    (17, 'CLAIRE', 'MORIN', 36,'F','password1234'),
    (18, 'KEVIN', 'GARLAND', 37,'M','kgar'),
    (19, 'JOHN', 'CENA', 25,'M','trumpet'),
    (20, 'ARTHUR', 'ARCHER', 24,'M','bea'),
    (21, 'BERNICE', 'NASH', 28,'F','nice'),
    (22, 'DANIELLA', 'VASZUEZ', 34,'F','test');

-- donation table
DROP TABLE IF EXISTS donation;
CREATE TABLE donation (
	donation_id INT(8) NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
    donor_id INT(8) NOT NULL REFERENCES donor(id),
    employee_id INT(8) NOT NULL REFERENCES employee(id),
    blood_type VARCHAR(36) NOT NULL
);

-- donation input
INSERT INTO donation(donor_id,employee_id, blood_type)
VALUES(1,23,'AB+'),
(1,23,'AB+'),
(8,19,'A+'),
(5,15,'B+'),
(3,17,'AB-'),
(9,20,'O-'),
(10,21,'O+'),
(6,12,'A+'),
(2,11,'B-'),
(4,14,'A-'),
(5,13,'B+'),
(3,11,'AB-');

-- transfusion table
DROP TABLE IF EXISTS transfusion;
CREATE TABLE transfusion (
	bag_id INT(8) NOT NULL REFERENCES inventory(bag_id),
    patient_id INT(8) NOT NULL REFERENCES patient(id),
    date DATE NOT NULL
);

-- transfusion input

-- appointment table
DROP TABLE IF EXISTS appointment;
CREATE TABLE appointment (
	appointment_id INT(8) NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
    donor_id INT(8) NOT NULL REFERENCES donor(id),
    employee_id VARCHAR(36) NOT NULL REFERENCES employee(id),
    appointment_date DATE NOT NULL,
    time TIME NOT NULL
);

-- appointment input

-- stores table
DROP TABLE IF EXISTS stores;
CREATE TABLE stores (
  employee_id INT(8) NOT NULL,
  donor_id INT(8) NOT NULL,
  amount  DECIMAL(5,2) NOT NULL,
  CONSTRAINT donor_id
    FOREIGN KEY (donor_id)
    REFERENCES donor (id),
  CONSTRAINT employee_id
    FOREIGN KEY (employee_id)
    REFERENCES employee (id)
);

-- stores input

-- withdraw table
DROP TABLE IF EXISTS withdraw;
CREATE TABLE withdraw (
	employeeId INT(8) NOT NULL,
    donorId INT(8) NOT NULL,
    donation_id INT(8) NOT NULL,
    CONSTRAINT employeeId
		FOREIGN KEY (employeeId)
        REFERENCES employee(id),
	CONSTRAINT donorId
		FOREIGN KEY (donorId)
        REFERENCES donor(id),
	CONSTRAINT donation_id
		FOREIGN KEY (donation_id)
        REFERENCES donation(donation_id)
);

-- withdraw input

-- attends table
DROP TABLE IF EXISTS attends;
CREATE TABLE attends (
	appointment_id INT(8) NOT NULL,
    donId INT(8) NOT NULL,
    CONSTRAINT appointment_id
		FOREIGN KEY (appointment_id)
        REFERENCES appointment(appointment_id),
	CONSTRAINT donId
		FOREIGN KEY (donId)
        REFERENCES donor(id)
);

-- attends input

-- makes table
DROP TABLE IF EXISTS makes;
CREATE TABLE makes (
	appointmentId INT(8) NOT NULL,
    empId INT(8) NOT NULL,
    CONSTRAINT appointmentId
		FOREIGN KEY (appointmentId)
        REFERENCES appointment(appointment_id),
	CONSTRAINT empId
		FOREIGN KEY (empId)
        REFERENCES employee(id)
);

-- makes input

-- maintains table
DROP TABLE IF EXISTS maintains;
CREATE TABLE maintains (
	bag_id INT(8) NOT NULL,
    admin_id INT(8) NOT NULL,
    CONSTRAINT bag_id
		FOREIGN KEY (bag_id)
        REFERENCES inventory(bag_id),
	CONSTRAINT admin_id
		FOREIGN KEY (admin_id)
        REFERENCES admin(id)
);

-- maintains input

