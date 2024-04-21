-- Task 1: create a database 
/*Create a database to store employee records and name it techmac_db. 
Use the techmac_db database to store database objects such as tables.
*/

create database if not exists techmac_db;
use techmac_db;

-- Task 2: create three tables 
/*Create three tables to store the details of the employees of the three start-ups. 
Name the tables techhyve_employees, techcloud _employees, and techsoft _employees. 
Each table must be designed to store the employee ID, first name, last name, gender, and age.
- Each record should be uniquely identified. So, alter the Employee ID column with the primary key constraint.
- The age of the employees should be between 21 and 55. So, alter the Age column structure with the check constraint.
*/

CREATE TABLE techhyve_employees( 
employeeID   int ,First_name   VARCHAR(50), Last_name   VARCHAR(50),Gender  VARCHAR(50), Age   Int);
alter table techhyve_employees modify column employeeID VARCHAR(100);


create table techsoft_employees( 
employeeID   int , First_name   VARCHAR(50), Last_name   VARCHAR(50), Gender  VARCHAR(50), Age  int);
alter table techsoft_employees modify column employeeID VARCHAR(100);

create table techcloud_employees( 
employeeID   int, First_name   VARCHAR(50), Last_name   VARCHAR(50), Gender  VARCHAR(50), Age    Int);
alter table techcloud_employees modify column employeeID VARCHAR(100);


-- Task 2A: Alter the employee ID 
Alter table techhyve_employees Add primary key (employeeID);  
Alter table techcloud_employees Add primary key (employeeID); 
Alter table techsoft_employees Add primary key (employeeID); 

-- Task 2B: alter age column 
ALTER TABLE techhyve_employees ADD CONSTRAINT cons_pk_id1 CHECK (Age BETWEEN 21 AND 55);
Alter table techcloud_employees add constraint cons_pk_id2 check (Age BETWEEN 21 AND 55);
Alter table techsoft_employees add constraint cons_pk_id3 check (Age BETWEEN 21 AND 55);

desc techsoft_employees;

-- Task 3: Add communication colunm with proficeincy level ranging from 1 to 5
/*The organization has suggested to store the communication proficiency level of employees, ranging from 1 to 5. 
Alter the three tables and add a new column Communication_Proficiency.
- Alter the Communication_Proficiency column with the check constraint and set the default value of this column as 1.
Note: Alter each of the three tables to add the Communication_Proficiency column.
*/  

--- ALTER TABLE techhyve_employees ADD column communicationproficiency INT CHECK (communicationproficiency between( 1 and 5)) 

alter table techhyve_employees add column communicationproficiency int;
alter table techcloud_employees add column communicationproficiency int;
alter table techsoft_employees  add column communicationproficiency int;


Alter table techcloud_employees add constraint cons_co_pr4 check (communicationproficiency between 1 and 5); 
Alter table techhyve_employees add constraint cons_co_pr5 check (communicationproficiency between 1 and 5);
Alter table techsoft_employees add constraint cons_co_pr6 check (communicationproficiency between 1 and 5);

-- Task 3A: set the default values to 1 
Alter table techcloud_employees ALTER COLUMN communicationproficiency set default 1;
Alter table techhyve_employees ALTER COLUMN communicationproficiency set default 1;
Alter table techsoft_employees ALTER COLUMN communicationproficiency set default 1;


-- Task 4: Insert employee data in the three tables
/*Insert employee data in the three tables, techhyve_employees, techcloud _employees, and techsoft_employees, by using the INSERT INTO command.
Note:Data on each start-up is provided in a separate sheet in the Excel file containing the employee data
*/

INSERT INTO techmac_db.techhyve_employees
values 
('TH0001', 'Eli', 'Evans', 'Male', 26, 1),
('TH0002', 'Carlos', 'Simmons', 'Male', 32, 1), 
('TH0003', 'Kathie', 'Bryant', 'Female', 25, 1),
('TH0004', 'Joey', 'Hughes', 'Male', 41, 4),
('TH0005', 'Alice', 'Matthews', 'Female', 52, 4);
select* from techhyve_employees;

INSERT INTO techmac_db.techcloud_employees
values 
('TC0001', 'Teresa', 'Bryant', 'Female', 39, 2),
('TC0002', 'Alexis', 'Patterson', 'Male', 48, 5), 
('TC0003', 'Rose', 'Bell', 'Female', 42, 3),
('TC0004', 'Gemma', 'Watkins', 'Female', 44, 3),
('TC0005', 'Kingston', 'Martinez', 'Male', 29, 2);
select* from techcloud_employees;


INSERT INTO techmac_db.techsoft_employees
values 
('TS0001', 'Peter', 'Burtler', 'Male',44 , 4),
('TS0002', 'Harold', 'Simmons', 'Male', 54, 4), 
('TS0003', 'Juliana', 'Sanders', 'Female', 36, 2),
('TS0004', 'Paul', 'Ward', 'Male', 29, 2),
('TS0005', 'Nicole', 'Bryant', 'Female', 30, 2);
select* from techmac_db.techsoft_employees;

-- Task 5: backup the three tableand the database 
/*Back up the three tables techhyve_employees,
techcloud_employees,and techsoft _employees and name them echhyve_employees_bkp,
techcloud_employees _bkp, and techsoft_employees _bkp, respectively.
Note:The backup tables need to be saved in a new database called backup_techmac_db.
*/

CREATE database IF NOT EXISTS backup_techmac_db;

CREATE table IF NOT EXISTS backup_techmac_db.backup_techhyve_employees_bkp like techhyve_employees;
insert backup_techhyve_employees_bkp select* from techhyve_employees;

CREATE table IF NOT EXISTS backup_techmac_db.backup_techcloud_employees_bkp like techcloud_employees;
insert backup_techcloud_employees_bkp select* from techcloud_employees;

CREATE table IF NOT EXISTS backup_techmac_db.backup_techsoft_employees_bkp  like techsoft_employees;
insert backup_techsoft_employees_bkp select* from techsoft_employees;
 
-- CREATE TABLE IF NOT EXISTS backup_techsoft_employees_bkp 
-- SELECT * FROM techsoft_employees
SELECT * FROM backup_techsoft_employees_bkp;
SELECT * FROM techcloud_employees;


-- Task 6: delete the rows for employees that left techcloud and techhyve
/*TechHyve and TechCloud employees with the following employee IDsI Dees have resigned: TH0003, TH0005, TC0001, and TC0004.
- Delete the data on these employees from the original table and retain them in the backup database.
- Note:Identify the tables corresponding to the above-mentioned employee IDsI Dees.
*/

Delete from techcloud_employees where employeeID in ('TC0001', 'TC0004');

Delete from techhyve_employees where employeeID  in( 'TH0003', 'TH0005');


-- Task 7: merge the techhyve and techcloud tables 
/*The organization has decided to merge TechHyve and TechCloud.

Merge the data on these two start-ups in a new table called techhyvecloud_employees. Then, delete the records from the 
techhyve_employees and techcloud _employees tables and retain them in the backup database.
*/

CREATE table IF NOT EXISTS techhyvercloud_employees like techhyve_employees;
insert techhyvercloud_employees select * from techhyve_employees;
insert techhyvercloud_employees select * from techcloud_employees;

Truncate table techhyve_employees;
Truncate table techcloud_employees;
-- delete from techhyve_employees

select * from techmac_db.techcloud_employees;
select* from techhyvercloud_employees;