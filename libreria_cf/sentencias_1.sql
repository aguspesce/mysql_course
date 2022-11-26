-- -----------------------------------
-- Create database
-- -----------------------------------
DROP DATABASE IF EXISTS libreria_cf;
CREATE DATABASE IF NOT EXISTS libreria_cf;

USE libreria_cf;

-- Create authors table
CREATE TABLE IF NOT EXISTS autores(
    autor_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    apellido VARCHAR(25) NOT NULL,
    seudonimo VARCHAR(50) UNIQUE,
    genero ENUM('M', 'F'),
    fecha_nacimiento DATE NOT NULL,
    pais_origen VARCHAR(40) NOT NULL,
    fecha_creacion DATETIME DEFAULT current_timestamp
);

-- Create book table
CREATE TABLE libros(
    libro_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    autor_id INT UNSIGNED NOT NULL,
    titulo varchar(50) NOT NULL,
    descripcion varchar(250) NOT NULL DEFAULT '',
    paginas INTEGER UNSIGNED NOT NULL DEFAULT 0,
    fecha_publicacion Date NOT NUll,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (autor_id) REFERENCES autores(autor_id) ON DELETE CASCADE
);

-- Add 2 new columns in book table
ALTER TABLE libros ADD ventas INT UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE libros ADD stock INT UNSIGNED DEFAULT 10;

-- Add records
-- ------------
-- Add records in authors table
INSERT INTO autores (nombre, apellido, seudonimo, fecha_nacimiento, genero, pais_origen)
    VALUES
        ('Stephen Edwin', 'King', 'Richard Bachman', '1947-09-27', 'M', 'USA'),
        ('Joanne', 'Rowling', 'J.K Rowling', '1947-09-27', 'F', 'Reino unido'),
        ('Daniel', 'Brown',  NULL, '1964-06-22', 'M', 'USA'),
        ('John', 'Katzenbach ', NULL,'1950-06-23', 'M', 'USA'),
        ('John Ronald', 'Reuel Tolkien', NULL, '1892-01-03', 'M', 'Reino unido'),
        ('Miguel', 'de Unamuno', NULL, '1892-01-03', 'M', 'USA'),
        ('Arturo', 'Pérez Reverte', NULL, '1951-11-25', 'M', 'España'),
        ('George Raymond', 'Richard Martin', NULL, '1948-09-20', 'M', 'USA');

-- Add records in books table
INSERT INTO libros(autor_id, titulo, fecha_publicacion)
    VALUES
        (1, 'Carrie','1974-01-01'),
        (1, 'El misterio de Salmes Lot','1975-01-01'),
        (1, 'El resplando','1977-01-01'),
        (1, 'Rabia','1977-01-01'),
        (1, 'El umbral de la noche','1978-01-01'),
        (1, 'La danza de la muerte','1978-01-01'),
        (1, 'La larga marcha','1979-01-01'),
        (1, 'La zona muerta','1979-01-01'),
        (1, 'Ojos de fuego','1980-01-01'),
        (1, 'Cujo','1981-01-01'),
        (1, 'La torre oscura 1 El pistolero','1982-01-01'),
        (1, 'La torre oscura 2 La invocación','1987-01-01'),
        (1, 'Apocalipsis','1990-01-01'),
        (1, 'La torre oscura 3 Las tierras baldías','1991-01-01'),
        (1, 'La torre oscura 4 Bola de cristal','1997-01-01'),
        (1, 'La torre oscura 5 Los de Calla','2003-01-01'),
        (1, 'La torre oscura 6 La torre oscura','2004-01-01'),
        (1, 'La torre oscura 7 Canción de Susannah','2004-01-01'),
        (1, 'La niebla','1981-01-01'),

        (2, 'Harry Potter y la Piedra Filosofal', '1997-06-30'),
        (2, 'Harry Potter y la Cámara Secreta', '1998-07-2'),
        (2, 'Harry Potter y el Prisionero de Azkaban','1999-07-8'),
        (2, 'Harry Potter y el Cáliz de Fuego','2000-03-20'),
        (2, 'Harry Potter y la Orden del Fénix','2003-06-21'),
        (2, 'Harry Potter y el Misterio del Príncipe','2005-06-16'),
        (2, 'Harry Potter y las Reliquias de la Muerte','2007-07-21'),

        (3, 'Origen', '2017-01-01'),
        (3, 'Inferno', '2013-01-01'),
        (3, 'El simbolo perdido', '2009-01-01'),
        (3, 'El código Da Vinci', '2006-01-01'),
        (3, 'La consipiración', '2003-01-01'),

        (4, 'Al calor del verano', '1982-01-01'),
        (4, 'Un asunto pendiente', '1987-01-01'),
        (4, 'Juicio Final', '1992-01-01'),
        (4, 'La sombra', '1995-01-01'),
        (4, 'Juego de ingenios', '1997-01-01'),
        (4, 'El psicoanalista', '2002-01-01'),
        (4, 'La historia del loco', '2004-01-01'),
        (4, 'El hombre equivocado', '2006-01-01'),
        (4, 'El estudiante', '2014-01-01'),

        (5, 'El hobbit','1937-01-01'),
        (5, 'Las dos torres','1954-01-01'),
        (5, 'El señor de los anillos','1954-01-01'),
        (5, 'La comunidad del anillo','1954-01-01'),
        (5, 'El retorno del rey','1955-01-01'),

        (6, 'La niebla','1914-01-01'),

        (7, 'Eva','2017-01-01'),
        (7, 'Falcó','2016-01-01'),
        (7, 'Hombre buenos','2015-01-01'),
        (7, 'Los barcos se pierden en tierra','2011-01-01'),

        (8, 'Juego de tronos','1996-08-01'),
        (8, 'Choque de reyes','1998-11-16'),
        (8, 'Tormenta de espadas','2005-10-17'),
        (8, 'Festin de cuervos','2011-07-12'),
        (8, 'Danza de dragones','2011-07-12');

-- -----------------------
-- Exercises 1
-- --------------------------

-- Obtener todos los libros escritos por autores que cuenten con un seudónimo.
SELECT titulo FROM libros
    WHERE autor_id IN (
        SELECT autor_id FROM autores WHERE seudonimo IS NOT NULL
    );

-- Obtener todos los libros escritos por autores que cuenten con un seudónimo
-- y que hayan nacido ante de 1965.
SELECT titulo FROM libros
    WHERE autor_id IN (
        SELECT autor_id FROM autores
            WHERE seudonimo IS NOT NULL
            AND YEAR(fecha_nacimiento)<1965
    );

-- Colocar el mensaje no disponible a la columna descripción, en todos los
-- libros publicados antes del año 2000.
UPDATE libros SET descripcion="no disponible"
    WHERE YEAR(fecha_publicacion)<2000;
SELECT libro_id, titulo, descripcion, fecha_publicacion FROM libros;

-- Obtener la llave primaria de todos los libros cuya descripción sea diferente
-- de no disponible.
SELECT libro_id FROM libros WHERE descripcion != "no disponible";

-- Obtener el título de los últimos 3 libros escritos por el autor con id 2.
SELECT titulo, fecha_publicacion FROM libros
    WHERE autor_id=2
    ORDER BY fecha_publicacion DESC LIMIT 3;

-- Obtener la cantidad de libros publicados entre enero del año 2000 y enero
-- del año 2005.
SELECT COUNT(titulo) FROM libros
    WHERE fecha_publicacion BETWEEN "2000-01-01" and "2005-01-01";

-- Obtener el título y el número de ventas de los cinco libros más vendidos.
-- First I need to create a function to add a random number of sales.
DELIMITER //
CREATE FUNCTION add_sales()
RETURNS INT
BEGIN
    SET @sales = (SELECT ROUND(RAND() * 100) * 6);
    RETURN @sales;
END//
DELIMITER ;
UPDATE libros set ventas = add_sales();
SELECT titulo, ventas FROM libros ORDER BY ventas DESC LIMIT 5;

-- Obtener el título y el número de ventas de los cinco libros más vendidos de
-- la última década.
SELECT titulo, ventas, fecha_publicacion FROM libros
    WHERE fecha_publicacion BETWEEN "2010-01-01" and "2022-01-01"
    ORDER BY ventas DESC
    LIMIT 5;

-- Obtener la cantidad de libros vendidos por los autores con id 1, 2 y 3.
SELECT autor_id,  SUM(ventas) FROM libros
    GROUP BY libros.autor_id
    LIMIT 3;

-- Obtener el título del libro con más páginas.
-- First I need to create a function to add the number of pages
DELIMITER //
CREATE FUNCTION add_pages()
RETURNS INT
BEGIN
    SET @pages = (SELECT ROUND(RAND() * 100) * 4);
    RETURN @pages;
END//
DELIMITER ;
UPDATE libros SET paginas = add_pages();
SELECT titulo, paginas FROM libros ORDER BY paginas DESC LIMIT 1;

-- Obtener todos los libros cuyo título comience con la palabra “La”.
SELECT titulo FROM libros WHERE titulo LIKE "La%";

-- Obtener todos los libros cuyo título comience con la palabra “La” y termine
-- con la letra “a”.
SELECT titulo FROM libros WHERE titulo LIKE "La%" and titulo LIKE "%a";

-- Establecer el stock en cero a todos los libros publicados antes del año
-- de 1995
UPDATE libros SET stock = 0 WHERE YEAR(fecha_publicacion) < 1995;
SELECT stock, fecha_publicacion FROM libros;

-- Mostrar el mensaje Disponible si el libro con id 1 posee más de 5 ejemplares
-- en stock, en caso contrario mostrar el mensaje No disponible.
UPDATE libros SET descripcion = "No Disponible" WHERE autor_id=1 AND stock < 5;
UPDATE libros SET descripcion = "Disponible" WHERE autor_id=1 AND stock > 5;
SELECT * FROM libros WHERE autor_id=1;

-- Obtener el título los libros ordenador por fecha de publicación del más
-- reciente al más viejo.
SELECT titulo, fecha_publicacion FROM libros ORDER BY fecha_publicacion DESC;

-- Obtener el nombre de los autores cuya fecha de nacimiento sea posterior a

SELECT CONCAT(nombre," ", apellido), fecha_nacimiento FROM autores
    WHERE YEAR(fecha_nacimiento) > 1950;

-- Obtener la el nombre completo y la edad de todos los autores.
SELECT CONCAT(nombre," ", apellido), TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS edad FROM autores;

-- Obtener el nombre completo de todos los autores cuyo último libro publicado
-- sea posterior al 2005
SELECT CONCAT(nombre," ", apellido) FROM autores
    WHERE autor_id IN (
        SELECT autor_id FROM libros
        WHERE YEAR(fecha_publicacion) > 2005
        GROUP BY autor_id
    );

-- Obtener el id de todos los escritores cuyas ventas en sus libros superen
-- el promedio.
SELECT autor_id, CONCAT(nombre, " ", apellido) FROM autores
    WHERE autor_id in (
        SELECT autor_id FROM libros
        GROUP BY autor_id
        HAVING SUM(ventas) > (SELECT AVG(ventas) FROM libros)
    );

-- Obtener el id de todos los escritores cuyas ventas en sus libros sean
-- mayores a mil ejemplares.
SELECT autor_id, CONCAT(nombre, " ", apellido) FROM autores
    WHERE autor_id in (
        SELECT autor_id FROM libros
        GROUP BY autor_id
        HAVING SUM(ventas) > 1000
    );

-- Crear una función la cual nos permita saber si un libro es candidato a
-- préstamo o no. Retornar “Disponible” si el libro posee por lo menos un
-- ejemplar en stock, en caso contrario retornar “No disponible.”
-- Without a function:
SELECT titulo, IF(stock > 1, "Disponible", "No disponible") AS "Disponibilidad"
    FROM libros;
-- With a function:
DELIMITER //
CREATE FUNCTION candidate(title VARCHAR(50))
RETURNS VARCHAR(50)
BEGIN
    SET @stock = (SELECT stock FROM libros WHERE titulo=title);
    IF @stock > 1 THEN
        RETURN "Disponible";
    ELSE
        RETURN "No disponible";
    END IF;
END//
DELIMITER ;
SELECT titulo, candidate(titulo) FROM libros
    WHERE titulo IN ("El Hobbit", "Eva");
