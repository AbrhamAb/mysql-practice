create database book_shop;
use book_shop;
CREATE TABLE books 
	(
		book_id INT AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

select * from books;

-- concat 

SELECT CONCAT('pi', 'ckle');

SELECT CONCAT(author_fname,' ', author_lname) AS author_name FROM books;

SELECT CONCAT_WS('-',title, author_fname, author_lname) FROM books;

-- substrings
 
SELECT SUBSTRING('Hello World', 1, 4);

SELECT SUBSTRING('Hello World', 7);

SELECT SUBSTRING('Hello World', -3);

SELECT SUBSTRING(title, 1, 10) AS 'short title' FROM books;
 
SELECT SUBSTR(title, 1, 10) AS 'short title' FROM books;

-- combinning string fuctions 

SELECT CONCAT
    (
        SUBSTRING(title, 1, 10),
        '...'
    ) AS 'short title'
FROM books;

select concat ( 
 substring(author_fname,1,1),".",
 substring(author_lname,1,1),".") 
 from books;
 
-- using REPLACE 

select replace (title , " " , "-") from books;

-- using REVERSE

SELECT REVERSE('Hello World');
 
SELECT REVERSE('meow meow');
 
SELECT REVERSE(author_fname) FROM books;
 
SELECT CONCAT('woof', REVERSE('woof'));
 
SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books; 


-- using char_length

SELECT CHAR_LENGTH('Hello World');

SELECT CHAR_LENGTH(title) as length, title FROM books;
 
SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;
 
SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;


-- using upper and lower 

SELECT UPPER('Hello World');
 
SELECT LOWER('Hello World');
 
SELECT UPPER(title) FROM books;
 
SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;
 
SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) FROM books;

-- other string functions 

SELECT INSERT('Hello Bobby', 6, 0, 'There'); 
SELECT INSERT('Hello Bobby', 7, 5, 'Tom');


SELECT LEFT('omghahalol!', 3);

SELECT RIGHT('omghahalol!', 4);

SELECT REPEAT('ha', 4);

SELECT TRIM('  pickle  ');


-- exercise solutions on string functions 

SELECT REVERSE(UPPER('Why does my cat look at me with such hatred?'));

SELECT REPLACE(title, ' ', '->') AS title FROM books;

SELECT 
    author_lname AS forwards, REVERSE(author_lname) AS backwards
FROM
    books;
    

SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS 'full name in caps' FROM books;


SELECT CONCAT(title, ' was released in ', released_year) AS blurb FROM books;

SELECT title, CHAR_LENGTH(title) AS character_count FROM books;

SELECT 
    CONCAT(SUBSTR(title, 1, 10), '...') AS short_title,
    CONCAT(author_lname, ',', author_fname) AS author,
    CONCAT(stock_quantity, ' in stock') AS quantity
FROM
    books;