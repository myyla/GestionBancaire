create database BankTransactionDB
use BankTransactionDB
create table SecurityQuestions
(
   SecurityQuestionsid int PRIMARY KEY IDENTITY(1,1),
   SecurityQuestionsName VARCHAR(50)
)
INSERT INTO SecurityQuestions values ('Where did you have your primary education?');
INSERT INTO SecurityQuestions values ('What is your nick name?');
INSERT INTO SecurityQuestions values ('What is your lucky number?');
 
create table Account
(
   Accountid int PRIMARY KEY IDENTITY(1,1),
   AccountNumber VARCHAR(30),
   AccountType VARCHAR(20),
   UserName VARCHAR(30),
   Gender VARCHAR(10),
   Email VARCHAR(50),
   Address VARCHAR(MAX),
   SecurityQuestionsid int FOREIGN KEY REFERENCES SecurityQuestions(SecurityQuestionsid),
   Answer VARCHAR(30),
   Amount int,
   PASSWORD VARCHAR(30)
)
create table Transactions
(
   TransactionId int PRIMARY KEY IDENTITY(1,1),
   SenderAccountId int FOREIGN KEY REFERENCES Account(Accountid),
   ReceiverAccountId int FOREIGN KEY REFERENCES Account(Accountid),
   MobileNo VARCHAR(20),
   Amount int,
   TransactionType varchar(10),
   Remarks varchar(30)
)
create table PerformTransaction
(
    AccountNumber VARCHAR(30),
    UserName VARCHAR(30),
    Amount int,
)
