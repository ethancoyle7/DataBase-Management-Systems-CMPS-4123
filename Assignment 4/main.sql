-- Ethan Coyle

-- Dr. LopaMudra

-- CMPS 4132 Database Management Systems

-- 11/10/22

-- SQL Code for Homework
-- first create show and use realestatedb
 CREATE DATABASE REALESTATEDB;
SHOW DATABASES;
USE REALESTATEDB;
SHOW TABLES;

-- foreign key check sytax

SET FOREIGN_KEY_CHECKS=0;

-- drop all the tables first

DROP TABLE EMPLOYEE;

DROP TABLE SALESOFFICE;

DROP TABLE PROPERTY;

DROP TABLE OWNER;

DROP TABLE PROPERTY_OWNER;

-- create employee table  reference it to the sales office number

-- foriegn key is office number and the contraint will be employee_FK1

CREATE TABLE SALESOFFICE

    (Office_Number         INTEGER          NOT NULL,

     Location              VARCHAR(50)              ,

     Manager_Employee_ID   INTEGER          NOT NULL,

             

     PRIMARY KEY (Office_Number));

-- table created for the employee primary key is the employee id

CREATE TABLE EMPLOYEE

    (Employee_ID           INTEGER         NOT NULL,

     Employee_Name         VARCHAR(50)             ,

     Office_Number         INTEGER         NOT NULL,

 

     PRIMARY KEY (Employee_ID)                      ,

     CONSTRAINT EMPLOYEE_FK1 FOREIGN KEY(Office_Number) REFERENCES SALESOFFICE(Office_Number));

-- alter the salesoffice table and add a constraint to foreign key

ALTER TABLE SALESOFFICE

     ADD CONSTRAINT SALESOFFICE_FK1 FOREIGN KEY(Manager_Employee_ID) REFERENCES EMPLOYEE(Employee_ID);

 

-- create the property table and the primary key will be porperty id

CREATE TABLE PROPERTY

    (Property_ID           INTEGER         NOT NULL,

Location_Address           VARCHAR(50)             ,

Location_City              VARCHAR(50)             ,

Location_State             VARCHAR(50)             ,

Location_Zip_Code          INTEGER         NOT NULL,

Office_Number         INTEGER         NOT NULL,

 

     PRIMARY KEY (Property_ID),

CONSTRAINT PROPERTY_FK1 FOREIGN KEY(Office_Number) REFERENCES SALESOFFICE(Office_Number));

-- next creating the owner table with the primary key owner id 

CREATE TABLE OWNER

    (Owner_ID              INTEGER         NOT NULL,

     Owner_Name            VARCHAR(50)             ,

    

     PRIMARY KEY (Owner_ID));

-- create table for property owner

CREATE TABLE PROPERTY_OWNER

    (Property_ID           INTEGER         NOT NULL,

Owner_ID              INTEGER         NOT NULL,

Percent_Owner         INTEGER         NOT NULL,

 

CONSTRAINT PROPERTY_OWNER_FK1 FOREIGN KEY(Property_ID) REFERENCES PROPERTY(Property_ID),

CONSTRAINT PROPERTY_OWNER_FK2 FOREIGN KEY(Owner_ID) REFERENCES OWNER(Owner_ID));
