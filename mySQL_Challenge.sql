CREATE DATABASE mySQL_week1;

USE mySQL_week1;

-- very easy
CREATE TABLE top_cars (
make VARCHAR(20),
model VARCHAR(20),
year INT
);

INSERT INTO top_cars (make, model, year) VALUES ('Porsche','911', 2021), ('Toyota', 'Supra', 2022);

-- easy
CREATE TABLE books(
bookid INT AUTO_INCREMENT,
title VARCHAR(45),
published_date INT,
author_firstname VARCHAR(45),
author_lastname VARCHAR(45),
PRIMARY KEY(bookid)
);

INSERT INTO books (title, published_date, author_firstname ,author_lastname) VALUES
('one', 2000, 'Brian', 'K'),
('two', 2001, 'Bruce', 'Wayne'),
('three', 2003, 'Barry', 'Allen'),
('four', 2004, 'Clark', 'Kent'),
('penta', 2005, 'Peter', 'Parker'); 

INSERT INTO books (title, published_date , author_firstname ,author_lastname) VALUES
('six', 2006, 'Tony', 'Stark'),
('seven', 2007, 'Diana', 'Prince');

DELETE FROM books ORDER BY published_date DESC LIMIT 1;

-- medium
CREATE TABLE top_movies (
movieid INT AUTO_INCREMENT,
title VARCHAR(30),
release_date INT,
rating ENUM('G', 'PG', 'PG-13', 'R'),
PRIMARY KEY(movieid)
);

INSERT INTO top_movies (title, release_date, rating) VALUES
('THE BATMAN', 2022, 'PG-13'),
('TURNING RED', 2022, 'PG'),
('THE ADAM PROJECT', 2022, 'PG-13'),
('UNCHARTED', 2022, 'PG-13'),
('FRESH', 2022, 'R'),
('SPIDER-MAN: NO WAY HOME', 2021, 'PG-13'),
('THE POWER OF THE DOG', 2021, 'R'),
('THE DARK KNIGHT', 2008, 'PG-13'),
('SCREAM', 2022, 'R'),
('DUNE', 2021, 'PG-13');

SELECT * FROM top_movies WHERE title LIKE '%s' ORDER BY release_date DESC;

-- hard
ALTER TABLE top_movies ADD director_firstname VARCHAR(30); 
ALTER TABLE top_movies ADD director_lastname VARCHAR(30);

UPDATE top_movies SET director_firstname = 'Brian', 
director_lastname= 'K' WHERE movieid >= 1 ;

SELECT director_firstname, director_lastname, 
CONCAT (director_firstname,' ', director_lastname) AS director
FROM top_movies;

SELECT * FROM top_movies ORDER BY director_lastname ASC;

DELETE FROM top_movies WHERE director_lastname BETWEEN 'r%' AND 'z%';

SELECT * FROM top_movies LIMIT 3;

-- very hard
CREATE TABLE top_cars2(
make VARCHAR(20),
model VARCHAR(20),
year INT
);

INSERT INTO top_cars2 (make, model, year) VALUES ('Porsche','911', 2021), ('Toyota', 'Supra', 2022);

INSERT INTO top_cars2 (make, model, year) VALUES 
('Nissan','GT-R', 2021), 
('Honda','Civic', 2016), 
('Honda', 'Accord', 2022);

ALTER TABLE top_cars2 ADD price INT;
ALTER TABLE top_cars2 ADD color VARCHAR(20);

SELECT make, model, 
CONCAT (make, ' ', model) 
AS car FROM top_cars2;

SELECT make, COUNT(*) FROM top_cars2 GROUP BY make;
