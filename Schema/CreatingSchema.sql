CREATE DATABASE Library_Management_System;
GO

USE Library_Management_System;
GO

CREATE TABLE Books (
	BookID INT PRIMARY KEY IDENTITY(1,1),
	Title VARCHAR(100) NOT NULL,
	Author VARCHAR(50) NOT NULL,
	ISBN VARCHAR(20) NOT NULL UNIQUE,
	Published_Date DATE NOT NULL,
	Genre VARCHAR(100) NOT NULL,
	Shelf_Location VARCHAR(50) NOT NULL,
	Current_Status VARCHAR(10) CHECK (Current_Status IN ('Available', 'Borrowed')) NOT NULL
);
GO

CREATE TABLE Borrowers (
	BorrowerID INT PRIMARY KEY IDENTITY(1,1),
	First_Name VARCHAR(50) NOT NULL,
	Last_Name VARCHAR(50) NOT NULL,
	Email VARCHAR(100) NOT NULL UNIQUE,
	Date_of_Birth DATE NOT NULL,
	Membership_Date DATE NOT NULL	
);
GO

CREATE TABLE Loans (
	LoanID INT PRIMARY KEY IDENTITY(1,1),
	BookID INT NOT NULL FOREIGN KEY References Books (BookID),
	BorrowerID INT NOT NULL FOREIGN KEY References Borrowers (BorrowerID),
	Date_Borrowed DATE NOT NULL,
	Due_Date DATE NOT NULL,
	Date_Returned DATE
);
