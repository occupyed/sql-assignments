CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL
);

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

CREATE TABLE borrowers (
    borrower_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- Authors Data
INSERT INTO authors (author_name) VALUES
    ('J.K. Rowling'),
    ('George Orwell'),
    ('Jane Austen'),
    ('F. Scott Fitzgerald'),
    ('Mark Twain');

-- Books Data
INSERT INTO books (title, author_id) VALUES
    ('Harry Potter and the Sorcerer''s Stone', 1),
    ('1984', 2),
    ('Pride and Prejudice', 3),
    ('The Great Gatsby', 4),
    ('The Adventures of Huckleberry Finn', 5);

-- Borrowers Data
INSERT INTO borrowers (name, email) VALUES
    ('Alice Johnson', 'alice@email.com'),
    ('Bob Smith', 'bob@email.com'),
    ('Charlie Brown', 'charlie@email.com'),
    ('David Wilson', 'david@email.com'),
    ('Eve Davis', 'eve@email.com');

