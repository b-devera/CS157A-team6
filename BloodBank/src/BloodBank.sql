DROP DATABASE IF EXISTS BloodBank;
CREATE DATABASE BloodBank;
USE BloodBank;

-- admin table
DROP TABLE IF EXISTS admin;
CREATE TABLE admin(
	id INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(36) NOT NULL,
    last_name VARCHAR(36) NOT NULL,
    age INT(4) NOT NULL CHECK (age >= 18),
    gender CHAR(1) NOT NULL,
    password VARCHAR(36) NOT NULL
);

-- admin input
INSERT INTO admin(first_name,last_name,age,gender,password)
VALUES('Admin','Test',42,'M','password'),
('Darth','Vader',50,'M','force'),
('Obiwan','Kenobi',60,'M','highground'),
('Boba','Fett',34,'M','bounty'),
('Jango','Fett',60,'M','kamino'),
('Rey','Skywalker',26,'F','alljedi'),
('Leia','Organa',60,'F','ben'),
('Han','Solo',65,'M','falcon'),
('Chewbacca','Solo',160,'M','raaaaar'),
('Mike','Wazowski',23,'M','eyeball');


-- employee table
DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
	id INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(36) NOT NULL,
    last_name VARCHAR(36) NOT NULL,
    age INT(4) NOT NULL CHECK (age>=18),
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
    
-- donor table
DROP TABLE IF EXISTS donor;
CREATE TABLE donor (
	id INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(36) NOT NULL,
    last_name VARCHAR(36) NOT NULL,
    gender CHAR(1) NOT NULL,
    age INT(4) NOT NULL CHECK (age>=18),
    blood_type VARCHAR(3) NOT NULL,
    heightIN INT NOT NULL,
    weightLB INT NOT NULL,
    username VARCHAR(36) NOT NULL UNIQUE,
    password VARCHAR(36) NOT NULL,
    eligibility DATE
);

-- donor input
INSERT INTO donor(first_name,last_name,gender,age,blood_type,heightIN,WeightLB,username,password,eligibility)
VALUES('First','Test','M',23,'AB+',70,210,'test','test','2020-08-09'),
	('Mr','Spock','M',102,'B-',72,170,'spock','vulcan','2020-03-11'),
    ('Worf','Mogh','M',54,'AB-',73,190,'klingon','pride','2022-06-01'),
    ('Tom','Rosenthal','M',34,'A-',67,130,'watermelon','pasta','2020-04-13'),
    ('Robert','Smith','M',63,'B+',70,201,'cure','friday','2021-05-29'),
    ('Jim','Hopper','M',45,'A+',73,201,'hops','cop','2019-01-30'),
    ('Winona','Ryder','F',50,'AB-',65,120,'will','where','2021-04-14'),
    ('Gates','McFadden','F',73,'A+',68,130,'doctor','picard','2020-02-11'),
    ('Marina','Sitris','F',67,'O-',65,130,'dianna','ryker','2022-1-23'),
    ('Jonathan','Frakes','M',69,'O+',75,201,'number1','makeitso','2021-12-24');

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
    ('Jack','ONeill','AB+','General','twols'),
    ('Will','Riker','B+','beard','man'),
    ('Samantha','Carter','B-','sam','oneill'),
    ('TealC','Jaffa','A-','Jaffa','indeed'),
    ('Frank','Reynolds','O-','Devito','rocks'),
    ('Dee','Reynolds','O+','bird','woman'),
    ('Charlie','Day','B+','Dayman','fighter');


-- donation table
DROP TABLE IF EXISTS donation;
CREATE TABLE donation (
	donation_id INT(8) NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
    donor_id INT(8) NOT NULL,
    employee_id INT(8) NOT NULL,
    blood_type VARCHAR(36) NOT NULL,
    CONSTRAINT donor_id
		FOREIGN KEY (donor_id)
		REFERENCES donor (id)
        ON DELETE CASCADE,
	CONSTRAINT employee_id
		FOREIGN KEY (employee_id)
		REFERENCES employee (id)
		ON DELETE CASCADE
);

-- donation input
INSERT INTO donation(donor_id, employee_id, blood_type)
VALUES(1,22,'AB+'),
(1,22,'AB+'),
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


-- withdraw relationship table
DROP TABLE IF EXISTS withdraw;
CREATE TABLE withdraw (
	employee_number INT(8) NOT NULL,
    donorId INT(8) NOT NULL,
    donationId INT(8) NOT NULL,
    CONSTRAINT employee_number
		FOREIGN KEY (employee_number)
        REFERENCES employee(id)
        ON DELETE CASCADE,
	CONSTRAINT donorId
		FOREIGN KEY (donorId)
        REFERENCES donor(id)
        ON DELETE CASCADE,
	CONSTRAINT donationId
		FOREIGN KEY (donationId)
        REFERENCES donation(donation_id)
        ON DELETE CASCADE
);

-- withdraw input
INSERT INTO withdraw (employee_number,donorId,donationId)
SELECT employee_id, donor_id, donation_id FROM donation;

-- inventory table
DROP TABLE IF EXISTS inventory;
CREATE TABLE inventory (
	bag_id INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	donation_id INT(8) NOT NULL,
    employeeId INT(8) NOT NULL,
    blood_type VARCHAR(3) NOT NULL,
    quantity INT(8) NOT NULL,
    expiration DATE NOT NULL,
    approved_by INT(8),
    CONSTRAINT donation_id
		FOREIGN KEY (donation_id)
		REFERENCES donation(donation_id)
        ON DELETE CASCADE,
	CONSTRAINT employeeId
		FOREIGN KEY (employeeId)
		REFERENCES employee (id)
		ON DELETE CASCADE,
	CONSTRAINT approved_by 
		FOREIGN KEY (approved_by)
        REFERENCES admin(id)
        ON DELETE CASCADE
);

-- inventory input
INSERT INTO inventory(donation_id, employeeId ,blood_type,quantity,expiration,approved_by) 
VALUES(1,22,'AB+',500,'2022-08-01',1),
(2,22,'AB+',560,'2022-08-11',2),
(3,19,'A+',550,'2022-08-01',3),
(4,15,'B+',150,'2022-09-04',3),
(5,17,'AB-',230,'2022-08-11',2),
(6,20,'O-',700,'2022-08-11',3),
(7,21,'O+',800,'2022-08-01',3),
(8,12,'A+',1000,'2022-09-01',1),
(9,11,'B-',501,'2022-08-24',2),
(10,14,'A-',523,'2022-08-16',3),
(11,13,'B+',545,'2022-08-30',2),
(12,11,'AB-',673,'2022-08-01',1);


-- transfusion relationship table
DROP TABLE IF EXISTS transfusion;
CREATE TABLE transfusion (
	bagId INT(8) NOT NULL,
    patient_id INT(8) NOT NULL,
    date DATE NOT NULL,
    CONSTRAINT bagId 
		FOREIGN KEY (bagId)
        REFERENCES inventory(bag_id)
        ON DELETE CASCADE,
	CONSTRAINT patient_id
		FOREIGN KEY (patient_id)
        REFERENCES patient(id)
        ON DELETE CASCADE
	
);

-- transfusion input
INSERT INTO transfusion
VALUES(1,4,'2022-08-07'),
(3,2,'2022-07-27'),
(4,10,'2022-08-12'),
(7,9,'2022-07-13'),
(6,1,'2022-07-20'),
(5,3,'2022-07-23'),
(4,5,'2022-08-27'),
(9,6,'2022-08-23'),
(10,7,'2022-08-14'),
(6,8,'2022-08-08');

-- maintains relationship table
DROP TABLE IF EXISTS maintains;
CREATE TABLE maintains (
	bag_id INT(8) NOT NULL,
    admin_id INT(8) NOT NULL,
    CONSTRAINT bag_id
		FOREIGN KEY (bag_id)
        REFERENCES inventory(bag_id)
        ON DELETE CASCADE,
	CONSTRAINT admin_id
		FOREIGN KEY (admin_id)
        REFERENCES admin(id)
        ON DELETE CASCADE
);
-- maintains input
INSERT INTO maintains (bag_id, admin_id)
SELECT bag_id, approved_by FROM inventory;

-- stores relationship table
DROP TABLE IF EXISTS stores;
CREATE TABLE stores (
  employee_identification INT(8) NOT NULL,
  donation_identification INT(8) NOT NULL,
  amount  INT(8) NOT NULL,
  CONSTRAINT donation_identification
    FOREIGN KEY (donation_identification)
    REFERENCES donation(donation_id)
    ON DELETE CASCADE,
  CONSTRAINT employee_identification
    FOREIGN KEY (employee_identification)
    REFERENCES employee (id)
    ON DELETE CASCADE
);

-- stores input
INSERT INTO stores(employee_identification, donation_identification, amount)
SELECT employeeId, donation_id, quantity FROM inventory;

-- appointment table
DROP TABLE IF EXISTS appointment;
CREATE TABLE appointment (
	appointment_id INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    don_id INT(8) NOT NULL,
    emp_id INT(8) NOT NULL,
    appointment_date DATE NOT NULL,
    time TIME NOT NULL,
    CONSTRAINT don_id
		FOREIGN KEY (don_id)
        REFERENCES donor(id)
        ON DELETE CASCADE,
	CONSTRAINT emp_id
		FOREIGN KEY (emp_id)
        REFERENCES employee(id)
        ON DELETE CASCADE
);

-- appointment input
INSERT INTO appointment(don_id, emp_id, appointment_date, time)
VALUES(1,22,'2022-06-20','09:00:00'),
(1,22,'2022-06-30','09:30:00'),
(2,11,'2022-07-13','09:00:00'),
(3,11,'2022-06-20','09:00:00'),
(3,17,'2022-06-30','09:00:00'),
(4,14,'2022-07-05','09:30:00'),
(5,15,'2022-07-24','09:30:00'),
(5,13,'2022-07-19','09:45:00'),
(6,12,'2022-07-21','09:30:00'),
(8,19,'2022-06-20','09:00:00'),
(9,20,'2022-06-30','09:30:00'),
(10,21,'2022-06-20','09:00:00');

-- attends relationship table
DROP TABLE IF EXISTS attends;
CREATE TABLE attends (
	appointment_id INT(8) NOT NULL,
    donId INT(8) NOT NULL,
    CONSTRAINT appointment_id
		FOREIGN KEY (appointment_id)
        REFERENCES appointment(appointment_id)
        ON DELETE CASCADE,
	CONSTRAINT donId
		FOREIGN KEY (donId)
        REFERENCES donor(id)
        ON DELETE CASCADE
);
-- attends input
INSERT INTO attends
SELECT appointment_id, don_id FROM appointment;

-- makes relationship table
DROP TABLE IF EXISTS makes;
CREATE TABLE makes (
	appointmentId INT(8) NOT NULL,
    empId INT(8) NOT NULL,
    CONSTRAINT appointmentId
		FOREIGN KEY (appointmentId)
        REFERENCES appointment(appointment_id)
        ON DELETE CASCADE,
	CONSTRAINT empId
		FOREIGN KEY (empId)
        REFERENCES employee(id)
        ON DELETE CASCADE
);

-- makes input
INSERT INTO makes
SELECT appointment_id, emp_id FROM appointment;
