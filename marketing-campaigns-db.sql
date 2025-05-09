CREATE TABLE Department (  
/*a table was created with the name Department that has the following attributes */ 
depID INT PRIMARY KEY NOT NULL,  
/*an attribute for depID in the table (Department) is created as a primary key where the 
record can not be empty */ 
depName VARCHAR(20) UNIQUE NOT NULL,  
/* an attribute for depName in the table (Department) is created as unique to ensure that 
all the values are not the same. The advertName value can not be empty and can hold up to 
20 characters */ 
managerEmpID INT(6) NOT NULL 
/* an attribute managerEmpID in the table (Department) is created where the record can not 
be empty and can hold up to 6 integers */ 
) ENGINE=InnoDB;  
CREATE TABLE Employee (  
/* a table was created with the name Employee that has the following attributes */ 
empID INT(6) PRIMARY KEY NOT NULL AUTO_INCREMENT,  
/* an attribute for empID in the table (Employee) is created as a primary key where the 
record can not be empty and can hold up to 6 integers. With the auto-increment it will 
generate a new empID that will be inserted into the table */ 
firstName VARCHAR(30) NOT NULL,  
/* an attribute for firstName in the table (Employee) is created where the record can not 
be empty and can hold up to 30 characters */ 
lastName VARCHAR (20) NOT NULL,  
/* an attribute for lastName in the table (Employee) is created where the record can not be 
empty and can hold up to 20 characters */ 
dateOfBirth DATE NOT NULL, 
/* an attribute for dateOfBirth in the table (Employee) is created where record can not be 
empty and the data type is Date */ 
email VARCHAR(200) NOT NULL, 
empDepID INT NOT NULL,  
/* an attribute for empDepID in the table (Employee) is created where the record can not be 
empty */ 
FOREIGN KEY (empDepID) REFERENCES Department(depID)  
/* empDepID is a foreign key that references the Department table */ 
ON UPDATE CASCADE ON DELETE CASCADE,  
/* when the foreign key (empDepID) is deleted or updated the value will automatically 
reflect the changes on the parent table */ 
supEmpID INT(6),  
/* an attribute for supEmpID in the table (Employee) is created and can hold up to 6 
integers */ 
FOREIGN KEY (supEmpID) REFERENCES Employee(empID) 
/* supEmpID is a foreign key that references the Employee table */ 
ON UPDATE CASCADE ON DELETE CASCADE, 
/* when the foreign key (supEmpID) is deleted or updated the value will automatically 
reflect the changes on the parent table */ 
gender ENUM('F' ,'M' ,'N') NOT NULL 
/* an attribute for gender in the table (Employee) is created and the entry can only be F, 
M or N and the record can not be empty */ 
) ENGINE=InnoDB;  
/* setting the auto increment start value to 100000 for table employee */ 
ALTER TABLE Employee AUTO_INCREMENT=100000; 
ALTER TABLE Department 
/* to add, delete or modify an existing table (Department) */ 
ADD FOREIGN KEY(managerEmpID) REFERENCES Employee(empID) 
/* adding a new foreign key managerEmpID that references the Employee table */ 
ON UPDATE CASCADE ON DELETE CASCADE; 
/* when the foreign key (managerEmpID) is updated the value will automatically reflect the 
changes on the parent table */  
CREATE TABLE Client (  
/* a table was created with the name Client that has the following attributes */ 
clientID INT(6) PRIMARY KEY NOT NULL AUTO_INCREMENT,  
/* an attribute for clientID in the table (Client) is created as a primary key where the 
record can not be empty and can hold up to 6 integers */ 
clientName VARCHAR(30), 
/* an attribute for clientName in the table (Client) is created where it can hold up to 30 
characters */ 
email VARCHAR(200) NOT NULL 
) ENGINE=InnoDB;  
/* setting the auto increment start value to 100000 for table client*/ 
ALTER TABLE Client AUTO_INCREMENT=100000; 
CREATE TABLE Campaign (  
/* a table was created with the name Campaign that has the following attributes */ 
campID INT(6) PRIMARY KEY NOT NULL AUTO_INCREMENT,  
/* an attribute for campID in the table (Campaign) is created as a primary key where the 
record can not be empty and can hold up to 6 integers. With the auto-increment it will 
generate a new campID that will be inserted into the table */ 
campName VARCHAR(20) NOT NULL,  
/* an attribute for campName in the table (Campaign) is created where the record can not be 
empty and can hold up to 20 characters */ 
campClientID INT(6) NOT NULL,  
/* an attribute for campClientID in the table (Campaign) is created where the record can 
not be empty and can hold up to 6 integers */ 
FOREIGN KEY (campClientID) REFERENCES Client(clientID) 
/* campClientID is a foreign key that references the Client Table */ 
ON UPDATE CASCADE ON DELETE CASCADE, 
/* when the foreign key (campClientID) is deleted or updated the value will automatically 
reflect the changes on the parent table */ 
campDepID INT NOT NULL, 
/* an attribute for campDepID in the table (Campign) is created where the record can not be 
empty and the data type is an integer */ 
FOREIGN KEY (campDepID) REFERENCES Department(depID) 
/* campDepID is a foreign key that references the Department table */ 
ON UPDATE CASCADE ON DELETE CASCADE 
/* when the foreign key (campDepID) is deleted or updated the value will automatically 
reflect the changes on the parent table */ 
) ENGINE=InnoDB;  
/* setting the auto increment start value to 100000 for table campaign */ 
ALTER TABLE Campaign AUTO_INCREMENT=100000; 
CREATE TABLE Invoice (  
/* a table was created with the name Invoice that has the following attribute */   
invoiceID INT(6) PRIMARY KEY NOT NULL AUTO_INCREMENT,   
/* an attribute for invoiceID in the table (Invoice) is created as a primary key where the 
record can not be empty and can hold up to 6 integers. With the auto-increment it will 
generate a new invoiceID that will be inserted into the table */ 
invoiceDate DATE NOT NULL,  
/* an attribute for invoiceDate in the table (Invoice) is created where record can not be 
empty and the data type is date */ 
serviceType VARCHAR(50), 
/* an attribute for serviceType in the table (Invoice) is created and it can hold up to 50 
characters */ 
tax INT NOT NULL, 
/* an attribute for tax in the table (Invoice) is created where the record can not be empty 
and the data type is an integer */ 
iCampID INT(6) NOT NULL, 
/* an attribute for iCampID in the table (Invoice) is created where the record can not be 
empty and can hold up to 6 integers */ 
FOREIGN KEY (iCampID) REFERENCES Campaign (campID)  
/* iCampID is a foreign key that references the Campaign Table */ 
ON UPDATE CASCADE ON DELETE CASCADE 
/* when the foreign key (iCampID) is deleted or updated the value will automatically 
reflect the changes on the parent table */ 
) ENGINE=InnoDB;  
/* setting the auto increment start value to 100000 for table invoice */ 
ALTER TABLE Invoice AUTO_INCREMENT=100000; 
CREATE TABLE CampaignDate (  
/* a table was created with the name CampaignDate that has the following attributes */ 
dCampID INT(6) PRIMARY KEY NOT NULL,  
/* an attribute for dCampID in the table (CampaignDate) is created as a primary key where 
the record can not be empty */ 
FOREIGN KEY(dcampID) REFERENCES Campaign(campID) 
/* dCampID is a foreign key that references the Campaign table */ 
ON UPDATE CASCADE ON DELETE CASCADE,  
/* when the foreign key (dCampID) is deleted or updated the value will automatically 
reflect the changes on the parent table */ 
dStart DATE NOT NULL,  
/* an attribute for dStart in the table (CampaignDate) is created where the record can not 
be empty and the data type is date */ 
dEnd DATE NOT NULL  
/* an attribute for dEnd in the table (CampaignDate) is created where the record can not be 
empty and the data type is date */ 
) ENGINE=InnoDB;  
CREATE TABLE TV (  
/* a table was created with the name TV that has the following attribute */ 
advertID INT(6) PRIMARY KEY NOT NULL AUTO_INCREMENT,  
/* an attribute for advertID in the table (TV) is created as a primary key where the record 
can not be empty and can hold up to 6 integers. With the auto-increment it will generate a 
new advertID that will be inserted into the table */ 
advertName VARCHAR(20) UNIQUE NOT NULL,  
/* an attribute for advertName in the table (TV) is created as unique to ensure that all 
the values are unique. The advertName value can not be empty and can hold up to 20 
characters */ 
releaseDate DATE NOT NULL,  
/* an attribute for releaseDate in the table (TV) is created where the record can not be 
empty and the data type is Date */  
advertLength TIME NOT NULL,  
/* an attribute for advertLength in the table (TV) is created where the record can not be 
empty and the data type is Time */ 
noOfBrodcasts INT NOT NULL,  
/* an attribute for noOfBrodcasts in the table (TV) is created where the record can not be 
empty and the data type is an integer */ 
advertCampID INT(6) NOT NULL,  
/* an attribute for advertCampID in the table (TV) is created where the record can not be 
empty and can hold up to 6 integers */   
FOREIGN KEY (advertCampID) REFERENCES Campaign(CampID)  
/* advertCampID is a foreign key that references the Campaign table */    
ON UPDATE CASCADE ON DELETE CASCADE 
/* when the foreign key (advertCampID) is deleted or updated the value will automatically 
reflect the changes on the parent table */ 
) ENGINE=InnoDB;  
/* setting the auto increment start value to 100000 for table TV */ 
ALTER TABLE TV AUTO_INCREMENT=100000; 
CREATE TABLE Magazine (  
/*a table was created with the name Magazine that has the following attribute */ 
advertID INT(6) PRIMARY KEY NOT NULL AUTO_INCREMENT,  
/* an attribute for advertID in the table (Magazine) is created as a primary key where the 
record can not be empty and can hold up to 6 integers. With the auto-increment it will 
generate a new advertID that will be inserted into the table */ 
advertName VARCHAR(20) UNIQUE NOT NULL,  
/* an attribute for advertName in the table (Magazine) is created as unique to ensure that 
all the values are unique. The advertName value can not be empty and can hold up to 20 
characters */   
releaseDate DATE NOT NULL,  
/* an attribute for releaseDate in the table (Magazine) is created where the record can not 
be empty and the data type is Date */ 
targetMagazine VARCHAR(20) NOT NULL,  
/* an attribute for targetMagazine in the table (Magazine) is created where the record can 
not be empty and it can hold up to 20 characters */ 
position VARCHAR(20) NOT NULL, 
/* an attribute for position in the table (Magazine) is created where the record can not be 
empty and it can hold up to 20 characters */ 
advertSize INT NOT NULL DEFAULT 50,  
/* an attribute for advertSize in the table (Magazine) is created where the record can not 
be empty and the data type is an integers. If there are no given values, it will give a 
default of 50 */ 
noOfIssues INT NOT NULL,  
/* an attribute for noOfIssues in the table (Magazine) is created where the record can not 
be empty and the data type is an integers */ 
advertCampID INT(6) NOT NULL,  
/* an attribute for adverCampID in the table (Magazine) is created where the record can not 
be empty and can hold up to 6 integers */ 
FOREIGN KEY (advertCampID) REFERENCES Campaign(CampID) 
/* advertCampID is a foreign key that references the Campaign table */    
ON UPDATE CASCADE ON DELETE CASCADE 
/* when the foreign key (advertCampID) is deleted or updated the value will automatically 
reflect the changes on the parent table */ 
) ENGINE=InnoDB;  
/* setting the auto increment start value to 100000 for table magazine */ 
ALTER TABLE Magazine AUTO_INCREMENT=100000; 
CREATE TABLE Website (  
/* a table was created with the name Website that has the following attribute */ 
advertID INT(6) PRIMARY KEY NOT NULL AUTO_INCREMENT,  
/* an attribute for advertID in the table (Website) is created as a primary key where the 
record can not be empty and can hold up to 6 integers. With the auto-increment it will 
generate a new advertID that will be inserted into the table */ 
advertName VARCHAR(20) UNIQUE NOT NULL,  
/* an attribute for advertName in the table (Website) is created as unique to ensure that 
all the values are unique. The advertName value can not be empty and can hold up to 20 
characters */   
releaseDate DATE NOT NULL,  
/* an attribute for releaseDate in the table (Website) is created where the record can not 
be empty and the data type is Date */ 
targetDemographic VARCHAR(20) ,   
/* an attribute for targetDemographic in the table (Website) is created and can hold up to 
20 characters */ 
targetRegion VARCHAR(20),  
/* an attribute for targetRegion in the table (Website) is created and can hold up to 20 
characters */ 
totalCost INT NOT NULL,  
/* an attribute for totalCost in the table (Website) is created where the record can not be 
empty and the data type is an integers */ 
advertCampID INT(6) NOT NULL,  
/* an attribute for advertCampID in the table (Website) is created where the record can not 
be empty and can hold up to 6 integers */  
FOREIGN KEY (advertCampID) REFERENCES Campaign(campID)  
/* advertCampID is a foreign key that references the Campaign table */    
ON UPDATE CASCADE ON DELETE CASCADE 
/* when the foreign key (advertCampID) is deleted or updated the value will automatically 
reflect the changes on the parent table */ 
) ENGINE=InnoDB;  
/* setting the auto increment start value to 100000 for table website */ 
ALTER TABLE Website AUTO_INCREMENT=100000; 
CREATE TABLE Radio (  
/* a table was created with the name Radio that has the following attribute */ 
advertID INT(6) PRIMARY KEY AUTO_INCREMENT,  
/* an attribute for advertID in the table (Radio) is created as a primary key where the 
record can not be empty and can hold up to 6 integers. With the auto-increment it will 
generate a new advertID that will be inserted into the table */ 
advertName VARCHAR(20) UNIQUE NOT NULL,  
/* an attribute for advertName in the table (Website) is created as unique to ensure that 
all the values are unique. The advertName value can not be empty and can hold up to 20 
characters */   
releaseDate DATE NOT NULL,  
/* an attribute for releaseDate in the table (Radio) is created where the record can not be 
empty and the data type is Date  */ 
advertLength TIME NOT NULL DEFAULT '00:00:30',  
/* an attribute for advertLength in the table (Radio) is created where the record can not 
be empty and the data type is Time with a default of 30 secounds */ 
noOfBrodcasts INT NOT NULL DEFAULT 10,  
/* an attribute for noOfBrodcasts in the table (Radio) is created where the record can not 
be empty and the data type is int with a default of 1010 numbers */ 
advertCampID INT(6) NOT NULL,  
/* an attribute for advertCampID in the table (Radio) is created where the record can not 
be empty and can hold up to 6 integers */  
/* an attribute for adverCampID in the table (Radio) is created where the record can not be 
empty and can hold up to 6 numbers */ 
FOREIGN KEY (advertCampID) REFERENCES Campaign(CampID)  
/* advertCampID is a foreign key that references the Campaign table */    
ON UPDATE CASCADE ON DELETE CASCADE 
/* when the foreign key (advertCampID) is deleted or updated the value will automatically 
reflect the changes on the parent table */ 
) ENGINE=InnoDB;  
/* setting the auto increment start value to 100000 for table radio*/ 
ALTER TABLE Radio AUTO_INCREMENT=100000; 
CREATE TABLE Handles ( 
/* a table was created with the name Handles that has the following attribute */ 
hCampID INT(6) NOT NULL, 
/* an attribute for hCampID in the table (Handles) is created where the record can not be 
empty and can hold up to 6 integers */  
FOREIGN KEY (hCampID) REFERENCES Campaign (campID) 
/* hCampID is a foreign key that references the Campaign table */    
ON UPDATE CASCADE ON DELETE CASCADE, 
/* when the foreign key (hCampID) is deleted or updated the value will automatically 
reflect the changes on the parent table */ 
hDepID INT NOT NULL, 
/* an attribute for hDepID in the table (Handles) is created where the record can not be 
empty and the data type is an integer */ 
FOREIGN KEY (hDepID) REFERENCES Department (depID) 
/* hDepID is a foreign key that references the Department table */    
ON UPDATE CASCADE ON DELETE CASCADE, 
/* when the foreign key (hDepID) is deleted or updated the value will automatically reflect 
the changes on the parent table */ 
PRIMARY KEY(hCampID, hDepID) 
/* the two attributes (hCampID) and (hDepID) collectively form the primary key since they 
are non-volatile values */ 
) ENGINE=InnoDB; 
CREATE TABLE WorksOn (  
/* a table was created with the name WorksOn that has the following attribute */ 
wEmpID INT(6) NOT NULL,  
/* an attribute for wCampID in the table (WorksOn) is created where the record can not be 
empty and can hold up to 6 numbers */ 
FOREIGN KEY (wEmpID) REFERENCES Employee(empID) 
/* wEmpID is a foreign key that references the Employee table */    
ON UPDATE CASCADE ON DELETE CASCADE,  
/* when the foreign key (wEmpID) is deleted or updated the value will automatically reflect 
the changes on the parent table */ 
wCampID INT(6) NOT NULL,  
/* an attribute for wCampID in the table (WorksOn) is created where the record can not be 
empty and can hold up to 6 integers */ 
FOREIGN KEY (wCampID) REFERENCES Campaign(campID) 
/* wCampID is a foreign key that references the Campaign table */    
ON UPDATE CASCADE ON DELETE CASCADE,  
/* when the foreign key (wCampID) is deleted or updated the value will automatically 
reflect the changes on the parent table */ 
hours INT NOT NULL, 
/* an attribute for hours in the table (WorksOn) is created where the record can not be 
empty and the data type is time */ 
PRIMARY KEY(wEmpID, wCampID) 
/* the two attributes (wEmpID) and (hCampID) collectively form the primary key since they 
are none volatile values */ 
) ENGINE=InnoDB;  
CREATE TABLE Charges(  
/* a table was created with the name Charges that has the following attribute  */ 
cInvoiceID INT(6) NOT NULL,  
/* an attribute for cInvoice in the table (Charges) is created where the record can not be 
empty and can hold up to 6 integers */ 
FOREIGN KEY(cInvoiceID) REFERENCES Invoice(invoiceID) 
/* cInoviceID is a foreign key that references the Invoice table */    
ON UPDATE CASCADE ON DELETE CASCADE, 
/* when the foreign key (cInvoiceID) is deleted or updated the value will automatically 
reflect the changes on the parent table */ 
cEmpID INT(6) NOT NULL,   
/* an attribute for cEmpID in the table (Charges) is created where the record can not be 
empty and can hold up to 6 integers */ 
FOREIGN KEY(cEmpID) REFERENCES Employee(empID) 
/* cEmpID is a foreign key that references the Employee table */    
ON UPDATE CASCADE ON DELETE CASCADE, 
/* when the foreign key (cEmpID) is deleted or updated the value will automatically reflect 
the changes on the parent table */ 
cClientID INT(6) NOT NULL,  
/* an attribute for cClientID in the table (Charges) is created where the record can not be 
empty and can hold up to 6 integers */ 
FOREIGN KEY(cClientID) REFERENCES Client(clientID) 
/* cClientID is a foreign key that references the Client table */    
ON UPDATE CASCADE ON DELETE CASCADE, 
/* when the foreign key (cClientID) is deleted or updated the value will automatically 
reflect the changes on the parent table */ 
PRIMARY KEY (cInvoiceID, cEmpID, cClientID) 
/* the three attributes (cInvoice), (cEmpID), and (cClientID) collectively form the primary 
key since they are none volatile values */ 
) ENGINE=InnoDB;  
CREATE TABLE TvTimeslot(  
/* a table was created with the name TvTimeslot that has the following attribute  */ 
tAdvertID INT(6) NOT NULL,  
/* an attribute for tAdvertID in the table (TvTimeslot) is created where the record can not 
be empty and can hold up to 6 integers */ 
FOREIGN KEY(tAdvertID) REFERENCES TV(advertID) 
/* tAdvertID is a foreign key that references the Campaign table */    
ON UPDATE CASCADE ON DELETE CASCADE,  
/* when the foreign key (tAdvertID) is deleted or updated the value will automatically 
reflect the changes on the parent table */ 
timeslot VARCHAR(20) NOT NULL  
/* an attribute for timeslot in the table (TvTimeslot) is created where the record can not 
be empty and can hold up to 20 characters  */ 
) ENGINE=InnoDB;   
CREATE TABLE RadioTimeslot( 
/* a table was created with the name RadioTimeslot that has the following attribute  */ 
rAdvertID INT(6) NOT NULL,  
/* an attribute for rAdvertID in the table (RadioTimeslot) is created where the record can 
not be empty and can hold up to 6 integers */ 
FOREIGN KEY(rAdvertID) REFERENCES radio(advertID) 
/* rAdvertID is a foreign key that references the Campaign table */    
ON UPDATE CASCADE ON DELETE CASCADE,  
/* when the foreign key (rAdvertID) is deleted or updated the value will automatically 
reflect the changes on the parent table */ 
timeslot VARCHAR(20) NOT NULL 
/* an attribute for timeslot in the table (RadioTimeslot) is created where the record can 
not be empty and can hold up to 20 characters  */   
) ENGINE=InnoDB;  
CREATE TABLE TvStation( 
/* a table was created with the name TvStation that has the following attribute  */ 
tAdvertID INT(6) NOT NULL,  
/* an attribute for tAdvertID in the table (TvStation) is created where the record can not 
be empty and can hold up to 6 integers */ 
FOREIGN KEY(tAdvertID) REFERENCES TV(advertID) 
/* tAdvertID is a foreign key that references the Campaign table */    
ON UPDATE CASCADE ON DELETE CASCADE,  
/* when the foreign key (tAdvertID) is deleted or updated the value will automatically 
reflect the changes on the parent table */ 
station VARCHAR(20) NOT NULL  
/* an attribute for station in the table (TvStation) is created where the record can not be 
empty and can hold up to 20 characters  */   
) ENGINE=InnoDB;  
CREATE TABLE RadioStation(  
/* a table was created with the name RadioStation that has the following attribute */ 
rAdvertID INT(6) NOT NULL,  
/* an attribute for rAdvertID in the table (RadioStation) is created where the record can 
not be empty and can hold up to 6 numbers */ 
FOREIGN KEY(rAdvertID) REFERENCES Radio(advertID) 
/* rAdvertID is a foreign key that references the Campaign table */    
ON UPDATE CASCADE ON DELETE CASCADE,  
/* when the foreign key (rAdvertID) is deleted or updated the value will automatically 
reflect the changes on the parent table */ 
station VARCHAR(20) NOT NULL  
/* an attribute for station in the table (RadioStation) is created where the record can not 
be empty and can hold up to 20 characters */   
)ENGINE=InnoDB;  
CREATE TABLE EmpContactNo( 
/* a table was created with the name EmpContactNo that has the following attribute  */ 
empID INT(6) NOT NULL, 
/* an attribute for empID in the table (EmpContactNo) is created where the record can not 
be empty and can hold up to 6 numbers */ 
FOREIGN KEY(empID) REFERENCES Employee(empID) 
/* empID is a foreign key that references the Campaign table */    
ON UPDATE CASCADE ON DELETE CASCADE,  
/* when the foreign key (empID) is deleted or updated the value will automatically reflect 
the changes on the parent table */ 
contactNo INT(10) NOT NULL, 
/* an attribute for contactNo in the table (EmpContactNo) is created where the record can 
not be empty and can hold up to 10 numbers */   
PRIMARY KEY(empID, contactNo) 
/* the two attributes (empID) and (contactNo) collectively form the primary key since they 
are none volatile values */ 
) ENGINE=InnoDB; 
CREATE TABLE clientContactNo( 
/* a table was created with the name clientContactNo that has the following attribute  */ 
clientID INT(6) NOT NULL, 
/* an attribute for clientID in the table (clientContactNo) is created where the record can 
not be empty and can hold up to 6 integers */ 
FOREIGN KEY(clientID) REFERENCES Client(clientID) 
/* clientID is a foreign key that references the Campaign table */    
ON UPDATE CASCADE ON DELETE CASCADE,  
/* when the foreign key (clientID) is deleted or updated the value will automatically 
reflect the changes on the parent table */ 
contactNo INT(10) NOT NULL, 
/* an attribute for contactNo in the table (clientContactNo) is created where the record 
can not be empty and can hold up to 10 integers */   
PRIMARY KEY(clientID, contactNo) 
/* the two attributes (clientID) and (contactNo) collectively form the primary key since 
they are none volatile values */ 
) ENGINE=InnoDB; 
SET foreign_key_checks = 0; 
INSERT INTO `department` VALUES ('1', 'Sales Department', '895496'); 
SET foreign_key_checks = 1; 