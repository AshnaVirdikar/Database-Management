CREATE DATABASE IF NOT EXISTS  SALES ;
USE SALES;
DROP TABLE sales ;
create table sales
(
purchase_number int not null AUTO_INCREMENT ,
date_of_purchase date not null,
customer_id int,
item_code varchar(10) not null,
PRIMARY KEY (purchase_number)    
) ; 
ALTER TABLE sales ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE ;
create table customers
( 
customer_id int ,
first_name  varchar(255) ,
last_name varchar(255) ,
email_add varchar(255) ,
number_of_complaints int not null 
);
DROP TABLE customers ;
SELECT *FROM sales ; 
SELECT *FROM sales.sales ;
 DROP TABLE sales;
 
 
 CREATE TABLE customers                                                              
(  

    customer_id INT,  

    first_name varchar(255),  

    last_name varchar(255),  

    email_address varchar(255),  

    number_of_complaints int,  

primary key (customer_id)  

);  
ALTER TABLE customers
ADD UNIQUE KEY (email_address) ;

ALTER TABLE customers
DROP INDEX email_address ;
DROP TABLE customers ;

CREATE TABLE customers (

    customer_id INT AUTO_INCREMENT,

    first_name VARCHAR(255),

    last_name VARCHAR(255),

    email_address VARCHAR(255),

    number_of_complaints INT,

PRIMARY KEY (customer_id)

);
 ALTER TABLE customers

ADD COLUMN gender ENUM('M', 'F') AFTER last_name;

 INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)

VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0)

;
CREATE TABLE companies (
    company_id VARCHAR(255),
    company_name VARCHAR(255) DEFAULT 'X',
    headquarters_phone_number VARCHAR(255),
    PRIMARY KEY (company_id)
);

ADD UNIQUE KEY ( headquarters_phone_number ) 
ALTER TABLE companies 
MODIFY headquarters_phone_number VARCHAR (255) NULL; 
DROP TABLE companies;
 









create table items

(

item_code VARCHAR (255),  

item  VARCHAR (255) ,  

unit_price NUMERIC (10,2),  

company_id VARCHAR (255), 
primary key (item_code) 
);
DROP TABLE items;

create table companies

(company_id VARCHAR ( 255) ,  

company_name VARCHAR (255),  

headquarters_phone_number int (12),
primary key (company_id) 
);
 
 DROP TABLE companies;

DROP TABLE sales;

DROP TABLE customers;



