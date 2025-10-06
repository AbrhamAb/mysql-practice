-- working with aggregate functions : Aggregate functions perform a calculation on a set of values and return a single value.
-- 1, working with COUNT 

SELECT COUNT(*) FROM books;

SELECT COUNT(author_lname) FROM books;

SELECT COUNT(DISTINCT author_lname) FROM books;

SELECT COUNT(*) FROM books WHERE title LIKE '%the%';

-- working with group by

SELECT author_lname, COUNT(*) 
FROM books
GROUP BY author_lname;

SELECT 
    author_lname, COUNT(*) AS books_written
FROM
    books
GROUP BY author_lname
ORDER BY books_written DESC;

SELECT author_lname, COUNT(title) FROM books GROUP BY author_lname;


-- working with MIN AND MAX

SELECT MAX(pages) FROM books;

SELECT MIN(author_lname) FROM books;

-- working with suqueries

SELECT title, pages FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

SELECT MIN(released_year) FROM books;

SELECT title, released_year FROM books 
WHERE released_year = (SELECT MIN(released_year) FROM books);

select title , concat (author_fname," ",author_lname) as full_name , pages from books where pages = ( select max(pages) from books);


-- grouping by multiple columns 

select concat ( author_fname , " ",author_lname) as author ,count(*) from books group by author;

SELECT author_fname, author_lname, COUNT(*) 
FROM books 
GROUP BY author_lname, author_fname;

select * from books;

-- min and max with group by

SELECT author_lname, MIN(released_year) FROM books GROUP BY author_lname;

SELECT author_lname, MAX(released_year), MIN(released_year) FROM books GROUP BY author_lname;


SELECT 
	author_lname, 
	COUNT(*) as books_written, 
	MAX(released_year) AS latest_release,
	MIN(released_year)  AS earliest_release,
      MAX(pages) AS longest_page_count
FROM books GROUP BY author_lname;


SELECT 
	author_lname, 
        author_fname,
	COUNT(*) as books_written, 
	MAX(released_year) AS latest_release,
	MIN(released_year)  AS earliest_release
FROM books GROUP BY author_lname, author_fname;

-- working with sum and sum with group by : sum only works with numbers , whenever we use sum for string values it gives 0

SELECT SUM(pages) FROM books;


SELECT author_lname, COUNT(*), SUM(pages)
FROM books
GROUP BY author_lname;

-- working with avg and avg with group by

SELECT AVG(pages) FROM books;

SELECT AVG(released_year) FROM books;

SELECT concat(author_fname ," " , author_lname)as author,
    AVG(stock_quantity) as Avg_stock_quantity, 
    COUNT(*) as total FROM books
GROUP BY author;

SELECT 
    released_year, 
    AVG(stock_quantity), 
    COUNT(*) FROM books
GROUP BY released_year;

-- aggregat function excercise solutions 

select count(*) from books;

select released_year , count(*) as total_books from books group by released_year;
select concat(author_fname ," ",author_lname) as author from books where pages = (select max(pages) from books);

SELECT COUNT(*) FROM books;

SELECT released_year, COUNT(*) 
FROM books GROUP BY released_year;

SELECT SUM(stock_quantity) FROM books;

SELECT AVG(released_year) 
FROM books GROUP BY author_lname, author_fname;


SELECT CONCAT(author_fname, ' ', author_lname) AS author, pages FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

SELECT CONCAT(author_fname, ' ', author_lname) AS author, pages FROM books
ORDER BY pages DESC LIMIT 1;


SELECT 
    released_year AS year,
    COUNT(*) AS '# books',
    AVG(pages) AS 'avg pages'
FROM books
GROUP BY released_year
ORDER BY released_year;