-- Task 1 create database stylexcarz_db
/*Create a database to store and manage sales records. 
Name the database stylexcarzstyle X Carz_db and use it to store database objects such as tables.
*/ 

create database if not exists stylexcarz_db;
use stylexcarz_db;

-- Task 2 create salesperson, customers, and orders tables
/*Create three tables to store the details of salespersons, customers, and car sales orders and 
name them salesperson, customers, and orders, respectively, for efficient data management.
- The attributes of the salespersons table:
     salespersonidsales person id, salesperson_name, salesperson_city, commission_rate
           - Ensure salespersonidsales person id is set with a primary key constraint.
- The attributes of the customers table:
      customeridcustomer id, c_firstname, c_lastname, c_city, c_rating
            - Ensure customeridcustomer id is set with a primary key constraint.
- The attributes of the orders table:
       orderidorder id, amount, orderdateorder date, salespersonidsales person id, customeridcustomer id
            - Ensure orderidorder id is set with a primary key constraint.
			- The orders table should have two foreign keys that reference the salespersons table and the customers table.
*/


CREATE TABLE salesperson( 
salespersonid   int ,
salesperson_name   VARCHAR(50) not null,
salesperson_city   VARCHAR(50) not null,
commission_rate  VARCHAR(50) not null, 
constraint PK_salesperson primary key(salespersonid) 
);
CREATE TABLE customers ( 
customerid   int ,
c_firstname  VARCHAR(50) not null,
c_lastname  VARCHAR(50) not null,
c_city  VARCHAR(50) not null,
c_rating int not null,  
constraint PK_customers primary key(customerid ) 
);
CREATE TABLE orders( 
orderid   int ,
amount   int not null,
orderdate date not null,
salespersonid int not null,
customerid int not null,
constraint PK_orders primary key(orderid)  
);
Alter table orders
Add constraint fk_salespersonid  foreign key(salespersonid) references salesperson(salespersonid),
add constraint fk_customerid foreign key(customerid) references customers(customerid); 


-- Task 3 Insert the data in the salespersons, customers, and orders tables
/*Insert the data in the salespersons, customers, and orders tables by using the car sales data downloaded earlier.*/

INSERT INTO customers
values 
('2001', 'Hoffman', 'Anny','New York', 1),
('2002', 'Giovanni','Jenny', 'New Jersey', 2),
('2003', 'Liu', 'Williams','San Jose', 3),
('2004', 'Grass', 'Harry','San Diego', 3),
('2005', 'Clemens', 'John','Austin', 4),
('2006', 'Cisneros', 'Fanny','New York', 4),
('2007', 'Pereira','Jonathan','Atlanta', 3);
select* from customers;

INSERT INTO salesperson
values 
('1001', 'William', 'New York', 12),
('1002', 'Liam', 'New Jersey', 13),
('1003', 'Axelrod', 'San Jose', 10),
('1004', 'James', 'San Diego', 11),
('1005', 'Fran', 'Austin', 26),
('1007', 'Oliver', 'New York', 15),
('1008', 'John', 'Atlanta', 2),
('1009', 'Charles', 'New Jersey', 2);
select* from salesperson;

INSERT INTO orders
 values
(3002, 20, '2021-02-23',1007, 2007),
(3003, 89,'2021-03-06', 1002, 2002),
(3004, 67, '2021-04-02', 1004, 2002),
(3005, 30, '2021-07-30​​​'​, 1002, 2009),
(3006, 35, '2021-09-18​​​​'​, 1001, 2004), 
(3007, 19, '2021-10-02​​​​​'​, 1001, 2001), 
(3008, 21, '2021-10-09​​​​​​'​, 1003, 2003),
(3009, 45, '2021-10-10​​​​​​​'​, 1009, 2005);
-- only able to insert the first value

-- Task 4 increase the commission to 15% for all those whose commission is below 15%
/*The companys salespersons need to meet their targets to get their commission. To motivate sales staff, the company wants to increase the commission to 15% for all those whose commission is below 15%
Note:Identify the records manually in the table to update their commission.*/

Set sql_safe_updates = 0; 
update stylexcarz_db.salesperson set commission_rate= 15
where commission_rate>0 and commission_rate <15;


-- Task 5 create a backup table and database for orders table
/*To prevent any loss of data, create a backup of the orders table and name it orders_bkp.
Note:The backup table should be saved in a new database.*/

CREATE database IF NOT EXISTS orders_bkp;
create table if not exists orders_bkp.orders_bkp as select* from stylexcarz_db.orders;
select * from orders_bkp.orders_bkp;



-- Task 6 update the customer rating by 3 points 
/*The company follows the practice of rating its customers. This rating would help the customers to 
obtain discounts on the car service.Increase the rating by three points for the customers who have placed an order more than once.
Note:Inspect the data manually to find the customers who have made multiple orders.*/

select * from stylexcarz_db.orders;
update stylexcarz_db.customers set c_rating = c_rating+3 where customerid=2007;
select * from stylexcarz_db.customers;


