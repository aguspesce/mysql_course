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

-- Create users table
CREATE TABLE usuarios(
    usuario_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(25) NOT NULL,
    apellido varchar(25),
    username varchar(25) NOT NULL,
    email varchar(50) NOT NULL,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table of borrowed books by users
CREATE TABLE libros_usuarios(
    libro_id INT UNSIGNED NOT NULL,
    usuario_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (libro_id) REFERENCES libros(libro_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
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

-- Add records in users table
INSERT INTO usuarios (nombre, apellido, username, email)
    VALUES
        ('Eduardo', 'García', 'eduardogpg', 'eduardo@codigofacilito.com'),
        ('Codi1', 'Facilito', 'codigofacilito', 'ayuda@codigofacilito.com'),
        ('Codi2', 'Facilito', 'codigofacilito', 'ayuda@codigofacilito.com'),
        ('Codi3', 'Facilito', 'codigofacilito', 'ayuda@codigofacilito.com'),
        ('Codi4', 'Facilito', 'codigofacilito', 'ayuda@codigofacilito.com'),
        ('Codi5', 'Facilito', 'codigofacilito', 'ayuda@codigofacilito.com'),
        ('Codi6', 'Facilito', 'codigofacilito', 'ayuda@codigofacilito.com');

-- Add record
INSERT INTO libros_usuarios(libro_id, usuario_id, fecha_creacion)
VALUES
    (1, 1, "2022-09-25 21:48:23"),
    (2, 1, current_timestamp),
    (3, 2, current_timestamp),
    (10, 3, "2022-09-25 21:48:23"),
    (20, 3, current_timestamp),
    (50, 5, current_timestamp),
    (25, 5, current_timestamp),
    (2, 1, current_timestamp),
    (5, 3, current_timestamp),
    (11, 3, current_timestamp),
    (10, 3, current_timestamp);


UPDATE libros SET stock = 0 WHERE libro_id IN (55, 54);
-- ---------------------
-- Create procedures
-- --------------------

DELIMITER //

CREATE PROCEDURE prestamo(usuario_id INT, libro_id INT, OUT cantidad INT)
BEGIN
    -- Creo la variable cantidad con el numero de ejemplares q hay en stock
    set cantidad = (SELECT stock FROM libros WHERE libros.libro_id = libro_id);
    -- Si el stock es 0 no se puede prestar el libro
    IF cantidad > 0 THEN
    -- si hay ejemplares entonces:
        -- Agrego el prestamo a la tabla libros_usuarios
        INSERT INTO libros_usuarios(libro_id, usuario_id)
            VALUES (libro_id, usuario_id);
        -- Actualizo el stock de ese lilo en la tabla libros
        UPDATE libros SET stock = stock - 1 WHERE libros.libro_id = libro_id;
        -- Actualizo el numero de ejemplares que quedan
        set cantidad = cantidad - 1;
        -- Mensaje
        SET @titulo = (
            SELECT titulo FROM libros WHERE libros.libro_id = libro_id
        );
        SET @usuario = (
            SELECT CANCAT(nombre, " ", apellido) FROM usuarios
                WHERE usuarios.usuario_id = usuario_id
        );
        SELECT cantidad AS stock, @titulo AS libro_prestado, @usuario AS a_usuario;
    ELSE
    -- Si no hay ejemplares no se puede hacer el prestamo
        -- Mensaje
        SET @titulo = (
            SELECT titulo FROM libros WHERE libros.libro_id = libro_id
        );
        SELECT @titulo AS libro, "No se puede prestar ese libro" AS mensaje;
    END IF;
END//

CREATE PROCEDURE tipo_lector(usuario_id INT)
BEGIN
    -- Determino cuantos libros pidio prestado
    SET @cantidad = (
        SELECT COUNT(*) FROM libros_usuarios
        WHERE libros_usuarios.usuario_id = usuario_id
    );
    -- Determino el nombre del usuario
    SET @usuario = (
        SELECT CONCAT(nombre," ", apellido) FROM usuarios
        WHERE usuarios.usuario_id = usuario_id
    );
    -- Evaluo que tipo de lector es
    CASE
        -- Mas de 20 libros >> Fanatico
        WHEN @cantidad > 5 THEN
            -- Mensaje
            SELECT @usuario AS usuario, "Fanatico" AS tipo_lector;
        -- Entre 10 y 20 >> Aficionado
        WHEN @cantidad > 2 AND @cantidad <= 5 THEN
            -- Mensaje
            SELECT @usuario AS usuario, "Aficionado" AS tipo_lector;
        -- Menos de 30 >> Promedio
        WHEN @cantidad <= 2 THEN
            -- Mensaje
            SELECT @usuario AS usuario, "Promedio" AS tipo_lector;
    END CASE;
END//

DELIMITER ;


SET @cantidad = 0;
-- Se le presta el libro 20 al usuario 3
CALL prestamo(3, 20, @cantinda);

-- Se le presta el libro 55 al usuario 2;
CALL prestamo(2, 55, @cantinda);

-- Determinar el tipo de lector del usuario con id 2,3 y 5
CALL tipo_lector(2);
CALL tipo_lector(3);
CALL tipo_lector(5);

