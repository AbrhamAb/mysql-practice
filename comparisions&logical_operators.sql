use book_shop;

select title,author_lname,released_year from books where released_year!=2017 and author_lname!='Gaiman';

-- using like and not like 

select title from books where title like "% %";
select title from books where title not like "% %";

select author_fname,title from books where author_fname not like '%a%';

-- using greater than

SELECT * FROM books
WHERE released_year > 2005;

SELECT * FROM books
WHERE pages > 500;

-- using less than or equal to

SELECT * FROM books
WHERE pages < 200;

SELECT * FROM books
WHERE released_year < 2000;

SELECT * FROM books
WHERE released_year <= 1985;

-- USING LOGICAL AND

SELECT title, author_lname, released_year FROM books
WHERE released_year > 2010
AND author_lname = 'Eggers';

SELECT title, author_lname, released_year FROM books
WHERE released_year > 2010
AND author_lname = 'Eggers'
AND title LIKE '%novel%';

-- USING LOGICAL OR

SELECT title, pages FROM books 
WHERE CHAR_LENGTH(title) > 30
AND pages > 500;

SELECT title, author_lname FROM books
WHERE author_lname='Eggers' AND
released_year > 2010;

SELECT title, author_lname, released_year FROM books
WHERE author_lname='Eggers' OR
released_year > 2010;


SELECT title, pages FROM books
WHERE pages < 200 
OR title LIKE '%stories%';

-- USING BETWEEN AND NOT BETWEEN 
SELECT title, released_year FROM books
WHERE released_year <= 2015
AND released_year >= 2004;

SELECT title, released_year FROM books
WHERE released_year BETWEEN 2004 AND 2014;

SELECT title, released_year FROM books
WHERE released_year NOT BETWEEN 2004 AND 2014;

-- COMPARING DATES AND TIME 
use mysql_practice;
select * from people;

SELECT * FROM people WHERE year(birthdate)
BETWEEN 2000 
AND 2017;

SELECT * FROM people WHERE birthtime 
BETWEEN CAST('12:00:00' AS TIME) 
AND CAST('16:00:00' AS TIME);


SELECT * FROM people WHERE HOUR(birthtime)
BETWEEN 12 AND 16;

-- USING IN ,NOT IN AND MODULUS TO FILTER OUT DATA 
use book_shop;

SELECT title, author_lname FROM books
WHERE author_lname = 'Carver' 
OR author_lname = 'Lahiri'
OR author_lname = 'Smith';

SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');

SELECT title, author_lname FROM books
WHERE author_lname NOT IN ('Carver', 'Lahiri', 'Smith');


SELECT title, released_year FROM books
WHERE released_year >= 2000 
AND released_year % 2 = 1;

-- USING CASE TO RATE DATAS 

SELECT title, released_year,
CASE
	WHEN released_year >= 2000 THEN 'modern lit'
    ELSE '20th century lit' 
END AS genre
FROM books;


SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 40 THEN '*'
        WHEN stock_quantity BETWEEN 41 AND 70 THEN '**'
        WHEN stock_quantity BETWEEN 71 AND 100 THEN '***'
        WHEN stock_quantity BETWEEN 101 AND 140 THEN '****'
        ELSE '*****'
    END AS stock
FROM
    books;


SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity <= 40 THEN '*'
        WHEN stock_quantity <= 70 THEN '**'
        WHEN stock_quantity <= 100 THEN '***'
        WHEN stock_quantity <= 140 THEN '****'
        ELSE '*****'
    END AS stock
FROM
    books;
    
-- USING IS NULL AND IS NOT NULL TO FILTER OUT COLUMNS WITH NULL VALUES
select * from books where title is null;    

select * from books where title is not null;  

SET SQL_SAFE_UPDATES = 0;

delete from books where title is null;    
  
-- exercise _ solutions 

select 1 in (5,3) or 11 between 8 and 10;

SELECT * FROM books WHERE released_year < 1980;

SELECT * FROM books 
WHERE author_lname = 'Eggers'
OR author_lname = 'Chabon';

SELECT * FROM books
WHERE author_lname = 'Lahiri'
AND released_year > 2000;

SELECT * FROM books
WHERE pages >= 100 
AND pages <= 200;

SELECT * FROM books
WHERE pages BETWEEN 100 and 200;

SELECT title, author_lname FROM books
WHERE author_lname LIKE 'C%'
OR author_lname LIKE 'S%';

SELECT title, author_lname
FROM books WHERE SUBSTR(author_lname, 1, 1) in ('C', 'S');

SELECT title, author_lname,
CASE
    WHEN title LIKE '%stories%' THEN 'Short Stories'
    WHEN title = 'Just Kids' THEN 'Memoir' 
    WHEN title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memior'
    ELSE 'Novel'
END AS type
FROM books;


SELECT author_fname, author_lname,
	CASE
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
	END AS count
FROM books
WHERE author_lname IS NOT NULL
GROUP BY author_fname, author_lname;

