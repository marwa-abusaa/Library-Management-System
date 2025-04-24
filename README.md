# Library Management System:

## Objective:
The goal of this project is to design and implement a relational database using Microsoft SQL Server to support the operations of a local library. The system will handle key functionalities such as **book tracking**, **borrower management**, and **loan processing**. It will efficiently manage and analyze essential data such as books, borrowers, and loans, and offer advanced querying capabilities to improve the library’s operations.

## Features:
- **Database Design**: Implement a robust schema to manage books, borrowers, and loans with primary and foreign key relationships, ensuring data integrity.
- **Book Tracking**: Monitor the availability, loan history, and status of books.
- **Borrower Management**: Handle borrower information, track borrowing activity, and automate loan processing, including due dates and overdue fees.
- **Complex Queries & Stored Procedures**: Create queries for analyzing borrowing trends, popular genres, overdue fees, and more. Stored procedures automate tasks like adding borrowers, calculating overdue fees, and generating reports.
- **Triggers & Automation**: Implement triggers to log status changes for books and automate actions such as overdue fee calculations and borrowing reports.
- **Weekly Peak Days Analysis**: Analyze and identify the most popular days for book loans based on historical data.
- **Indexing for Performance**: Implemented multiple indexes to optimize search and retrieval of data, particularly for commonly queried fields such as BookID, BorrowerID, and Date Borrowed.

## ERD Diagram:
The Entity Relationship (ER) Diagram provides a visual representation of the database schema, including entities, attributes, and relationships.

![ERD Diagram](https://github.com/marwa-abusaa/Library-Management-System/blob/schema/Library%20Management%20System%20ERD.png)

## Database Schema:
- **Books**: BookID (PK), Title, Author, ISBN, Published Date, Genre, Shelf Location, Current Status.
- **Borrowers**: BorrowerID (PK), First Name, Last Name, Email, Date of Birth, Membership Date.
- **Loans**: LoanID (PK), BookID (FK), BorrowerID (FK), Date Borrowed, Due Date, Date Returned.

## Technologies:
- Microsoft SQL Server
- TSQL Queries


