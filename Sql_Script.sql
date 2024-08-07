-- Create the database
CREATE DATABASE library;
-- Use the library database
USE library;
-- Create the Branch table
CREATE TABLE Branch (
Branch_no INT PRIMARY KEY,
Manager_Id INT,
Branch_address VARCHAR(255),
Contact_no VARCHAR(15)
);
-- Create the Employee table
CREATE TABLE Employee (
Emp_Id INT PRIMARY KEY,
Emp_name VARCHAR(255),
Position VARCHAR(50),
Salary DECIMAL(10, 2),
Branch_no INT,
FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);
-- Create the Books table
CREATE TABLE Books (
ISBN VARCHAR(13) PRIMARY KEY,
Book_title VARCHAR(255),
Category VARCHAR(100),
Rental_Price DECIMAL(10, 2),
Status ENUM('yes', 'no'),
Author VARCHAR(255),
Publisher VARCHAR(255)
);
-- Create the Customer table
CREATE TABLE Customer (
Customer_Id INT PRIMARY KEY,
Customer_name VARCHAR(255),
Customer_address VARCHAR(255),
Reg_date DATE
);
-- Create the IssueStatus table
CREATE TABLE IssueStatus (
Issue_Id INT PRIMARY KEY,
Issued_cust INT,
Issued_book_name VARCHAR(255),
Issue_date DATE,
Isbn_book VARCHAR(13),
FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);
-- Create the ReturnStatus table
CREATE TABLE ReturnStatus (
Return_Id INT PRIMARY KEY,
Return_cust INT,
Return_book_name VARCHAR(255),
Return_date DATE,
Isbn_book2 VARCHAR(13),
FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
DB scripts to Sample data insertions(10-20 rows per table)
–Branch table
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, '123 Library St.', '9123456780'),
(2, 102, '456 Reading Rd.', '9123456781'),
(3, 103, '789 Book Ave.', '9123456782'),
(4, 104, '101 Main St.', '9123456783'),
(5, 105, '202 Center Blvd.', '9123456784'),
(6, 106, '303 Elm St.', '9123456785'),
(7, 107, '404 Oak St.', '9123456786'),
(8, 108, '505 Pine St.', '9123456787'),
(9, 109, '606 Cedar St.', '9123456788'),
(10, 110, '707 Birch St.', '9123456789');
–Employee table
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(1, 'Arun Kumar', 'Manager', 50000, 1),
(2, 'Sreeja Nair', 'Librarian', 40000, 2),
(3, 'Anoop Menon', 'Assistant', 35000, 3),
(4, 'Divya Pillai', 'Manager', 55000, 4),
(5, 'Ramesh Iyer', 'Librarian', 45000, 5),
(6, 'Lakshmi Devi', 'Assistant', 30000, 6),
(7, 'Manoj Warrier', 'Manager', 60000, 7),
(8, 'Rajesh Sharma', 'Librarian', 42000, 8),
(9, 'Vijaya Raghavan', 'Assistant', 32000, 9),
(10, 'Meera Nambiar', 'Manager', 58000, 10);
–Books table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('9783161484100', 'God of Small Things', 'Fiction', 10.00, 'yes', 'Arundhati Roy', 'Penguin India'),
('9781234567897', 'The White Tiger', 'Fiction', 12.00, 'yes', 'Aravind Adiga', 'HarperCollins'),
('9780123456789', 'Midnight\'s Children', 'Fiction', 15.00, 'yes', 'Salman Rushdie', 'Vintage Books'),
('9784567890123', 'The Inheritance of Loss', 'Fiction', 9.00, 'yes', 'Kiran Desai', 'Grove Press'),
('9787890123456', 'Train to Pakistan', 'Fiction', 20.00, 'yes', 'Khushwant Singh', 'Penguin India'),
('9780987654321', 'A Suitable Boy', 'Fiction', 11.00, 'yes', 'Vikram Seth', 'HarperCollins'),
('9783216549870', 'The Godfather', 'Fiction', 18.00, 'yes', 'Mario Puzo', 'Penguin Random House'),
('9786549873210', 'The Alchemist', 'Fiction', 14.00, 'yes', 'Paulo Coelho', 'HarperOne'),
('9789876543210', 'Shantaram', 'Fiction', 13.00, 'yes', 'Gregory David Roberts', 'Abacus'),
('9782345678901', 'The Guide', 'Fiction', 16.00, 'yes', 'R. K. Narayan', 'Indian Thought Publications'),
('9780199232765', 'A Brief History of Time', 'Science', 22.00, 'yes', 'Stephen Hawking', 'Bantam Books'),
('9780345803481', 'Sapiens: A Brief History of Humankind', 'History', 25.00, 'yes', 'Yuval Noah Harari', 'Harper'),
('9780393354324', 'The Gene: An Intimate History', 'Science', 19.00, 'yes', 'Siddhartha Mukherjee', 'Scribner'),
('9780241977068', 'Homo Deus: A Brief History of Tomorrow', 'History', 24.00, 'yes', 'Yuval Noah Harari', 'Vintage'),
('9780140449181', 'The Art of War', 'Philosophy', 12.00, 'yes', 'Sun Tzu', 'Penguin Classics'),
('9780140280197', 'The Prince', 'Philosophy', 10.00, 'yes', 'Niccolò Machiavelli', 'Penguin Classics'),
('9780307476708', 'Thinking, Fast and Slow', 'Psychology', 20.00, 'yes', 'Daniel Kahneman', 'Farrar, Straus and Giroux'),
('9780307946308', 'The Power of Habit', 'Psychology', 18.00, 'yes', 'Charles Duhigg', 'Random House'),
('9780812981605', 'The Book Thief', 'Literature', 14.00, 'yes', 'Markus Zusak', 'Knopf'),
('9780345453747', 'The Da Vinci Code', 'Thriller', 15.00, 'yes', 'Dan Brown', 'Doubleday');
–Customer table
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(1, 'Anil Kumar', '789 MG Road', '2022-12-31'),
(2, 'Bindu Nair', '456 Church St.', '2023-01-01'),
(3, 'Chetan Reddy', '123 Mall Road', '2023-02-01'),
(4, 'Deepa Menon', '101 Gandhi Nagar', '2023-03-01'),
(5, 'Eashwar Iyer', '202 Indira Nagar', '2023-04-01'),
(6, 'Fathima Begum', '303 Brigade Road', '2023-05-01'),
(7, 'Ganesh Pillai', '404 Koramangala', '2023-06-01'),
(8, 'Harini Devi', '505 JP Nagar', '2023-07-01'),
(9, 'Irfan Khan', '606 HSR Layout', '2023-08-01'),
(10, 'Jayanthi Rao', '707 Whitefield', '2023-09-01')
(11, 'Akhil Nair', 'Thiruvananthapuram, Kerala', '2021-12-15'),
(12, 'Divya Menon', 'Kochi, Kerala', '2021-11-30'),
(13, 'Ravi Kumar', 'Thrissur, Kerala', '2021-10-20'),
(14, 'Meera Suresh', 'Kozhikode, Kerala', '2021-09-25'),
(15, 'Arjun Reddy', 'Kannur, Kerala', '2021-08-14'),
(16, 'Priya Varma', 'Palakkad, Kerala', '2021-07-19'),
(17, 'Vikram Shenoy', 'Alappuzha, Kerala', '2021-06-30'),
(18, 'Sneha Iyer', 'Kollam, Kerala', '2021-05-10'),
(19, 'Rajesh Pillai', 'Pathanamthitta, Kerala', '2021-04-01'),
(20, 'Anjali Mohan', 'Malappuram, Kerala', '2021-03-22');
–IssueStatus
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(1, 1, 'God of Small Things', '2023-06-10', '9783161484100'),
(2, 2, 'The White Tiger', '2023-06-15', '9781234567897'),
(3, 3, 'Midnight\'s Children', '2023-06-20', '9780123456789'),
(4, 4, 'The Inheritance of Loss', '2023-07-01', '9784567890123'),
(5, 5, 'Train to Pakistan', '2023-07-05', '9787890123456'),
(6, 6, 'A Suitable Boy', '2023-07-10', '9780987654321'),
(7, 7, 'The Godfather', '2023-07-15', '9783216549870'),
(8, 8, 'The Alchemist', '2023-07-20', '9786549873210'),
(9, 9, 'Shantaram', '2023-07-25', '9789876543210'),
(10, 10, 'The Guide', '2023-07-30', '9782345678901');
–ReturnStatus Table
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(1, 1, 'God of Small Things', '2023-07-11', '9783161484100'),
(2, 2, 'The White Tiger', '2023-07-12', '9781234567897'),
(3, 3, 'Midnight\'s Children', '2023-07-13', '9780123456789'),
(4, 4, 'The Inheritance of Loss', '2023-07-14', '9784567890123'),
(5, 5, 'Train to Pakistan', '2023-07-15', '9787890123456'),
(6, 6, 'A Suitable Boy', '2023-07-16', '9780987654321'),
(7, 7, 'The Godfather', '2023-07-17', '9783216549870'),
(8, 8, 'The Alchemist', '2023-07-18', '9786549873210'),
(9, 9, 'Shantaram', '2023-07-19', '9789876543210'),
(10, 10, 'The Guide', '2023-07-20', '9782345678901');