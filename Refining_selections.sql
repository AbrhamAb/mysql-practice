-- refining selections using distnict ,like , order by ,limit

INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
select * from books;

delete from books where book_id = 22;
-- using distinct
SELECT author_lname FROM books;
 
SELECT DISTINCT author_lname FROM books;
 
SELECT author_fname, author_lname FROM books;
 
SELECT DISTINCT CONCAT(author_fname,' ', author_lname) as fullname FROM books;
 
SELECT DISTINCT author_fname, author_lname FROM books;

-- using order_by

SELECT * FROM books
ORDER BY author_lname;

SELECT * FROM books
ORDER BY author_lname DESC;

SELECT * FROM books
ORDER BY released_year;

SELECT book_id, author_fname, author_lname, pages
FROM books ORDER BY 2;

SELECT book_id, author_fname, author_lname, pages
FROM books ORDER BY author_lname, author_fname;

-- workingg with LIMITS
 
 SELECT title FROM books LIMIT 3;
 
SELECT title FROM books LIMIT 1;
 
SELECT title FROM books LIMIT 10;
 
SELECT * FROM books LIMIT 1;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 5;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 1;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 14;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 0,5;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 0,3;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 1,3;
 
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 10,1;
 
SELECT * FROM tbl LIMIT 95,18446744073709551615;
 
SELECT title FROM books LIMIT 5;
 
SELECT title FROM books LIMIT 5, 123219476457;
 
SELECT title FROM books LIMIT 5, 50;

-- working with LIKE 

SELECT title, author_fname, author_lname, pages 
FROM books
WHERE author_fname LIKE '%da%';

SELECT title, author_fname, author_lname, pages 
FROM books
WHERE title LIKE '%:%';

SELECT * FROM books
WHERE author_fname LIKE '____';

SELECT * FROM books
WHERE author_fname LIKE '_a_';

-- To select books with '%' in their title:
SELECT * FROM books
WHERE title LIKE '%\%%';

-- To select books with an underscore '_' in title:
SELECT * FROM books
WHERE title LIKE '%\_%';

-- solution for exercises
SELECT title FROM books WHERE title LIKE '%stories%';
 
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;
 
SELECT 
    CONCAT(title, ' - ', released_year) AS summary 
FROM books ORDER BY released_year DESC LIMIT 3;
 
SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';
 
SELECT title, released_year, stock_quantity 
FROM books ORDER BY stock_quantity LIMIT 3;
 
SELECT title, author_lname 
FROM books ORDER BY author_lname, title;
 
SELECT title, author_lname 
FROM books ORDER BY 2,1;
 
SELECT
    CONCAT(
        'MY FAVORITE AUTHOR IS ',
        UPPER(author_fname),
        ' ',
        UPPER(author_lname),
        '!'
    ) AS yell
FROM books ORDER BY author_lname;