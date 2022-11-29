-- Ethan Coyle and Paxton Proctor
-- DataBase Management Systems
-- Dr. Lopamudra
-- DDL design for Semester Project
-- Union Bank 
-- Novemeber 12, 2022
create database unionbank5;
use unionbank5;

-- creating our tables starting with the customer
CREATE TABLE CUSTOMERS
    (Customer_Id       INTEGER          NOT NULL,
     Customer_Name                              VARCHAR(50)  NOT NULL              ,
     Customer_Phone_Number              VARCHAR(50)   NOT NULL                ,
     Customer_Email                              VARCHAR(255)                             ,
     Login                                                VARCHAR(50)  NOT NULL              ,
     Password                                         VARCHAR(50)  NOT NULL              ,
     Bank_Location                                 VARCHAR(255) NOT NULL            ,
     PRIMARY KEY (Customer_Id));

-- creating the accounts table 
CREATE TABLE ACCOUNTS
    (Account_Id INTEGER NOT NULL,
     Customer_Id       INTEGER          NOT NULL,
     Account_Name                              VARCHAR(50)  NOT NULL              ,
     Date_Opened              VARCHAR(50)               ,
     Account_Type                              VARCHAR(255)                             ,
     PRIMARY KEY (Account_Id),
 CONSTRAINT ACCOUNTS_FK1 FOREIGN KEY(Customer_Id) REFERENCES CUSTOMERS(Customer_Id));

-- create the atm table
CREATE TABLE ATM
(Location_Id INTEGER NOT NULL,
Customer_id INTEGER NOT NULL,
DEPOSIT DOUBLE,
WITHDRAW DOUBLE,
CHECK_BALANCE DOUBLE,
PRIMARY KEY (Location_Id),
CONSTRAINT ATM_FK1 FOREIGN KEY(Customer_Id) REFERENCES CUSTOMERS(Customer_Id));

-- create the transactions
CREATE TABLE TRANSACTIONS
(TRANSACTION_ID INTEGER NOT NULL,
Account_Id INTEGER NOT NULL,
Date Varchar(50),
Transaction_Ammount DOUBLE,
Transaction_Type VarChar(50),
Location_Id INTEGER NOT NULL,
PRIMARY KEY (TRANSACTION_ID),
CONSTRAINT TRANSACTIONS_FK1 FOREIGN KEY(Account_Id) REFERENCES ACCOUNTS(Account_Id),
CONSTRAINT TRANSACTIONS_FK2 FOREIGN KEY(Location_Id) REFERENCES ATM(Location_Id));

-- creating inserts into the tables
INSERT INTO customers (Customer_ID, Customer_Name, Customer_Phone_Number, Customer_Email, Login,Password,Bank_Location)
VALUES  (1, 'Joe Bubble',123456, 'BigBubs@gmail.com', 'BigBubble', 'Bubble', 'Florida');
INSERT INTO customers (Customer_ID, Customer_Name, Customer_Phone_Number, Customer_Email, Login,Password,Bank_Location)
VALUES  (3,'Aigneis Bandt',93291,'abandt0@360.cn','UyMx4RxVAs','34231', 'Pierstorff Point');
INSERT INTO customers (Customer_ID, Customer_Name, Customer_Phone_Number, Customer_Email, Login,Password,Bank_Location)
VALUES(2,'Kelsy Wrist',2482,'kwrist1@businesswire.com','K20Vg6Khv8y','97063', 'New Castle Court');
INSERT INTO customers (Customer_ID, Customer_Name, Customer_Phone_Number, Customer_Email, Login,Password,Bank_Location)
VALUES (4,'Vanessa Ivatts','3457508594','vivatts2@ftc.gov','enYVTHkS','2925', 'Haas Place');
INSERT INTO customers (Customer_ID, Customer_Name, Customer_Phone_Number, Customer_Email, Login,Password,Bank_Location)
VALUES (5,'Henry Cheeser','3457545464','harrypotter1@gmail.com','cheese balls','1234', 'Bilbo Baggins');

-- inserting into the atm table
INSERT INTO atm(Location_Id,Customer_Id,DEPOSIT,WITHDRAW,CHECK_BALANCE)
VALUES (78,1,188692.04,653957.77,253451.41);
INSERT INTO atm(Location_Id,Customer_Id,DEPOSIT,WITHDRAW,CHECK_BALANCE)
VALUES (58,2,927894.43,219437.16,642386);
INSERT INTO atm(Location_Id,Customer_Id,DEPOSIT,WITHDRAW,CHECK_BALANCE)
VALUES (98,3,2910.75,494526.79,450471.29);
INSERT INTO atm(Location_Id,Customer_Id,DEPOSIT,WITHDRAW,CHECK_BALANCE)
VALUES (97,4,868691.34,459153.53,364255.75);
INSERT INTO atm(Location_Id,Customer_Id,DEPOSIT,WITHDRAW,CHECK_BALANCE)
VALUES(96,5,933939.93,439972.9,105815.34);
INSERT INTO atm(Location_Id,Customer_Id,DEPOSIT,WITHDRAW,CHECK_BALANCE)
VALUES (995,1,188692.04,653957.77,253451.41);
INSERT INTO atm(Location_Id,Customer_Id,DEPOSIT,WITHDRAW,CHECK_BALANCE)
VALUES (43,2,927894.43,219437.16,642386);
INSERT INTO atm(Location_Id,Customer_Id,DEPOSIT,WITHDRAW,CHECK_BALANCE)
VALUES (22,3,2910.75,494526.79,450471.29);
INSERT INTO atm(Location_Id,Customer_Id,DEPOSIT,WITHDRAW,CHECK_BALANCE)
VALUES (89,4,868691.34,459153.53,364255.75);
INSERT INTO atm(Location_Id,Customer_Id,DEPOSIT,WITHDRAW,CHECK_BALANCE)
VALUES(100,5,933939.93,439972.9,105815.34);

-- inserting into the table account details for the accounts
INSERT INTO accounts (Account_Id,Customer_Id,Account_Name, Date_Opened,Account_Type)
VALUES(1,1,'RICHARD','01/22/2022','CHECKING');
INSERT INTO accounts (Account_Id,Customer_Id,Account_Name, Date_Opened,Account_Type)
VALUES(2,2,'FRODOS ACT','05/31/2022','SAVINGS');
INSERT INTO accounts (Account_Id,Customer_Id,Account_Name, Date_Opened,Account_Type)
VALUES(3,3,'POTATOE MAN','05/31/2022','CHECKING');
INSERT INTO accounts (Account_Id,Customer_Id,Account_Name, Date_Opened,Account_Type)
VALUES(4,4,'BORAT','07/07/2022','CHECKING');
INSERT INTO accounts (Account_Id,Customer_Id,Account_Name, Date_Opened,Account_Type)
VALUES(5,5,'FRODOS ACT','03/97/2022','SAVINGS');

-- inserting values into the transactions table to interacte with accounts and atm tables as well for the key values
INSERT INTO transactions (Transaction_Id,Account_Id,Date,Transaction_Ammount,Transaction_Type,Location_Id)
VALUES (214,1,'2022-01-02', 500.00, 'Visa', 78 );
INSERT INTO transactions (Transaction_Id,Account_Id,Date,Transaction_Ammount,Transaction_Type,Location_Id)
VALUES (215,2,'2022-15-08', 1.00, 'MasterCard', 22 );
INSERT INTO transactions (Transaction_Id,Account_Id,Date,Transaction_Ammount,Transaction_Type,Location_Id)
VALUES (216,3,'2022-05-12', 1500.00, 'Cash', 22 );
INSERT INTO transactions (Transaction_Id,Account_Id,Date,Transaction_Ammount,Transaction_Type,Location_Id)
VALUES (217,1,'2022-05-12', 1500.00, 'Cash', 98 );
INSERT INTO transactions (Transaction_Id,Account_Id,Date,Transaction_Ammount,Transaction_Type,Location_Id)
VALUES (218,4,'2022-05-11', 50.00, 'Cash', 78 );
INSERT INTO transactions (Transaction_Id,Account_Id,Date,Transaction_Ammount,Transaction_Type,Location_Id)
VALUES (219,5,'2022-19-01', 5000.00, 'Monopoly Money', 43 );
INSERT INTO transactions (Transaction_Id,Account_Id,Date,Transaction_Ammount,Transaction_Type,Location_Id)
VALUES (220,3,'2022-01-01', 10000.00, 'Fake Check', 58 );

-- the below runs 6 querys on our tables for certain data and criteria to be met and displays to the user

-- query 1 : selecting all of the customers from the customers table and count the number of that customer  ordered by
select Customer_ID, count(Customer_Id) from Customers group by Customer_ID order by Customer_ID;

-- query 2 selecting all of the accounts inside of the accounts table with their accounts only being checking and 
-- displaying both the name and the account type of their account 
select Account_Type,Account_Name from accounts where Account_type='CHECKING' ;

-- query 3 : electing all of the account checking balances that pertain to all those above 250,000 dollars, can also view those below this threshold
Select Customer_Id,CHECK_BALANCE from atm where CHECK_BALANCE > 250000.00 AND Customer_Id >=1;

-- Query 4:  showing all of the customers that have a bank location starting with a P or if their name starts with an H
select Customer_Id,Customer_Name,Bank_Location from customers Where  Bank_Location like 'P%' OR Customer_Name like 'H%';

-- Query 5: selecting all of the customers from the transaction history where the transaction id is greater than 218 and their ammount it greater than or equal to 5000 and show what kind of type it is
Select Transaction_Id, Account_Id,Transaction_Type,Transaction_Ammount from transactions where Account_Id > 2 AND Transaction_Id >218 AND Transaction_Ammount >=5000.00;

-- Query 6: show any customers account id with the date being less than may 14 2022, will show the type,ammount,id date and transaction id
Select Transaction_Id,Date, Account_Id,Transaction_Type,Transaction_Ammount from transactions where Date <='2022-14-05';

-- the below shows concatination of multiple tables to display information for all the customers information running 4 queries

-- query 7 : working with multiple tables, this one we use the customers table and the atm table to displayu the collumns customer name, customer id from both the atm and customers the location and checking their balance with the location id  is greater than or equl to 78 and less or equals to 
-- than 96
Select customers.Customer_Name, customers.Customer_Id,atm.Customer_Id, atm.Location_Id,atm.Check_Balance From customers,atm Where Location_Id >= 78 AND Location_Id <=96 and customers.Customer_Id=1 LIMIT 1;

--  Query 8: Selecting from accounts and customers displaying the customer id, the name, the account type, and the date opened where the customer id matches that in the accounts table
select customers.customer_id, customers.Customer_name, accounts.Account_Type,accounts.Date_Opened from customers, accounts Where customers.Customer_id=accounts.Customer_Id;

-- Query 9. Selection from the accounts, transactions tables displaying the account if, the type of transaction, the ammount from the transaction table the accountid of the accounts table and the customer id and displaying to the user
select accounts.Customer_Id,accounts.Account_id, transactions.Account_Id, transactions.Transaction_Type,transactions.Transaction_ammount from accounts,transactions where accounts.account_type ='SAVINGS';

-- Query 10: Displaying the customers name from utilizing three tables we get the customer id from the customers table, accounts and transactions, show the customers name their account type and their transaction ammount
Select customers.customer_id, customers.customer_name, accounts.Customer_Id,accounts.Account_Type,transactions.Transaction_ammount from accounts,transactions,customers where customers.customer_id=accounts.customer_id and customers.customer_name like 'A%'ORDER BY Transaction_Ammount DESC;
-- in this last query, we are displaying the customer id from the customers table, the customers name the customers id , the account type from the accounts table and the transaction ammount from the transactions table; we are filtering out everything except what matches the customers name 
-- that starts with an A and where that customer id matchs the aaccounts customer id and then ordering in descending order the transaction ammounts done by that person.
