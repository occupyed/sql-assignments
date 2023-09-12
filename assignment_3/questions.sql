-- Question 1: List all the authors in the database.

SELECT * FROM authors;

-- Question 2: Find the total number of books in the library.

SELECT COUNT(*) AS total_books FROM books;

-- Question 3: List all the books and their authors' names.

SELECT books.title, authors.author_name
FROM books
JOIN authors ON books.author_id = authors.author_id;

-- Question 4: Find the book with the longest title.

SELECT title
FROM books
ORDER BY LENGTH(title) DESC
LIMIT 1;

-- Question 5: List all borrowers who have not borrowed any books.

SELECT borrowers.name
FROM borrowers
LEFT JOIN (SELECT DISTINCT borrower_id FROM borrowed_books) AS borrowed ON borrowers.borrower_id = borrowed.borrower_id
WHERE borrowed.borrower_id IS NULL;

-- Question 6: Find the author with the most books in the library.

SELECT authors.author_name, COUNT(*) AS book_count
FROM authors
JOIN books ON authors.author_id = books.author_id
GROUP BY authors.author_name
ORDER BY book_count DESC
LIMIT 1;

-- Question 7: List the borrowers who have borrowed the book "1984."

SELECT borrowers.name
FROM borrowers
JOIN borrowed_books ON borrowers.borrower_id = borrowed_books.borrower_id
JOIN books ON borrowed_books.book_id = books.book_id
WHERE books.title = '1984';

-- Question 8: Find the book that has been borrowed the most times.

SELECT books.title, COUNT(*) AS borrow_count
FROM books
JOIN borrowed_books ON books.book_id = borrowed_books.book_id
GROUP BY books.title
ORDER BY borrow_count DESC
LIMIT 1;

-- Question 9: List all authors who have books in the library and the total number of books they have authored.

SELECT authors.author_name, COUNT(*) AS total_books_authored
FROM authors
LEFT JOIN books ON authors.author_id = books.author_id
GROUP BY authors.author_name;

-- Question 10: Find the borrowers who have borrowed the most books.

SELECT borrowers.name, COUNT(*) AS books_borrowed
FROM borrowers
JOIN borrowed_books ON borrowers.borrower_id = borrowed_books.borrower_id
GROUP BY borrowers.name
ORDER BY books_borrowed DESC
LIMIT 1;