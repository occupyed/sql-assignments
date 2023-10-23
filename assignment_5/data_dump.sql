-- Create a database named "bookstore"
CREATE DATABASE bookstore;

-- Use the "bookstore" database
USE bookstore;

-- Create a table for authors
CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    birth_date DATE
);

-- Create a table for books
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    publication_year INT,
    author_id INT,
    genre VARCHAR(30),
    price DECIMAL(8, 2),
    available BOOLEAN
);

-- Create a table for customers
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    email VARCHAR(50),
    birth_date DATE
);

-- Create a table for book orders
CREATE TABLE book_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    book_id INT,
    order_date DATE,
    quantity INT,
    total_price DECIMAL(8, 2)
);

-- Insert sample data into the tables

-- Authors
INSERT INTO author (first_name, last_name, birth_date) VALUES
    ('John', 'Smith', '1970-03-15'),
    ('Emily', 'Jones', '1985-07-21'),
    ('Michael', 'Johnson', '1965-12-10'),
    ('Sarah', 'Brown', '1978-04-30');

-- Books
INSERT INTO book (title, publication_year, author_id, genre, price, available) VALUES
    ('The Art of Programming', 2019, 1, 'Programming', 29.99, TRUE),
    ('Mystery at Midnight', 2021, 2, 'Mystery', 12.99, TRUE),
    ('Data Science Fundamentals', 2020, 3, 'Data Science', 39.99, TRUE),
    ('The Lost Key', 2018, 2, 'Mystery', 14.99, FALSE),
    ('Web Development Basics', 2022, 1, 'Programming', 19.99, TRUE);

-- Customers
INSERT INTO customer (first_name, last_name, email, birth_date) VALUES
    ('Alice', 'Johnson', 'alice@gmail.com', '1995-02-18'),
    ('Bob', 'Smith', 'bob@gmail.com', '1990-09-12'),
    ('Charlie', 'Brown', 'charlie@gmail.com', '1988-06-25'),
    ('Diana', 'Williams', 'diana@gmail.com', '1998-11-05');

-- Book Orders
INSERT INTO book_order (customer_id, book_id, order_date, quantity, total_price) VALUES
    (1, 1, '2023-03-01', 2, 59.98),
    (2, 2, '2023-03-05', 3, 38.97),
    (3, 3, '2023-03-10', 1, 39.99),
    (4, 5, '2023-03-15', 2, 39.98),
    (1, 4, '2023-03-20', 1, 14.99);

