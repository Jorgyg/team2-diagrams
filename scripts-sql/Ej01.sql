DROP DATABASE IF EXISTS biblioteca_v1;
CREATE DATABASE biblioteca_v1;
USE biblioteca_v1;

CREATE TABLE Autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE Libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    editorial VARCHAR(100),
    anio_escrito DATE,
    anio_edicion DATE,
    ISBN VARCHAR(20)
);

CREATE TABLE Socios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_socio VARCHAR(20) UNIQUE,
    dni VARCHAR(10),
    direccion VARCHAR(100),
    telefono VARCHAR(15),
    nombre VARCHAR(50),
    apellidos VARCHAR(100)
);

CREATE TABLE Volumenes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    deteriorado BOOLEAN,
    id_libro INT,
    FOREIGN KEY (id_libro) REFERENCES Libros(id)
);

CREATE TABLE Prestamos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    fecha_maxima DATE,
    fecha_real DATE,
    id_volumen INT,
    id_socio INT,
    FOREIGN KEY (id_volumen) REFERENCES Volumenes(id),
    FOREIGN KEY (id_socio) REFERENCES Socios(id)
);

CREATE TABLE Escribe (
    id_libro INT,
    id_autor INT,
    PRIMARY KEY (id_libro, id_autor),
    FOREIGN KEY (id_libro) REFERENCES Libros(id),
    FOREIGN KEY (id_autor) REFERENCES Autores(id)
);
INSERT INTO Autores (nombre) VALUES ('Gabriel García Márquez');
INSERT INTO Autores (nombre) VALUES ('Agatha Christie');
INSERT INTO Autores (nombre) VALUES ('J.R.R. Tolkien');

INSERT INTO Libros (titulo, editorial, anio_escrito, anio_edicion, ISBN)
VALUES ('Cien años de soledad', 'Sudamericana', '1967-03-01', '1967-05-30', '9780307474728');
INSERT INTO Libros (titulo, editorial, anio_escrito, anio_edicion, ISBN)
VALUES ('Asesinato en el Orient Express', 'Collins Crime Club', '1934-01-01', '1934-03-01', '9780007119318');
INSERT INTO Libros (titulo, editorial, anio_escrito, anio_edicion, ISBN)
VALUES ('El Señor de los Anillos: La Comunidad del Anillo', 'Allen & Unwin', '1954-07-29', '1954-11-11', '9780618574957');

INSERT INTO Socios (codigo_socio, dni, direccion, telefono, nombre, apellidos)
VALUES ('SOC001', '1122334455', 'Calle Principal 123', '555-1234', 'Laura', 'Gómez');
INSERT INTO Socios (codigo_socio, dni, direccion, telefono, nombre, apellidos)
VALUES ('SOC002', '9988776655', 'Avenida Secundaria 456', '555-5678', 'Carlos', 'Pérez');
INSERT INTO Socios (codigo_socio, dni, direccion, telefono, nombre, apellidos)
VALUES ('SOC003', '5544332211', 'Plaza Central 789', '555-9876', 'María', 'López');

INSERT INTO Volumenes (deteriorado, id_libro) VALUES (FALSE, 1);
INSERT INTO Volumenes (deteriorado, id_libro) VALUES (TRUE, 2);
INSERT INTO Volumenes (deteriorado, id_libro) VALUES (FALSE, 3);


INSERT INTO Prestamos (fecha, fecha_maxima, fecha_real, id_volumen, id_socio)
VALUES ('2023-07-25', '2023-08-25', NULL, 1, 1);
INSERT INTO Prestamos (fecha, fecha_maxima, fecha_real, id_volumen, id_socio)
VALUES ('2023-07-26', '2023-08-26', NULL, 2, 2);
INSERT INTO Prestamos (fecha, fecha_maxima, fecha_real, id_volumen, id_socio)
VALUES ('2023-07-27', '2023-08-27', NULL, 3, 3);

INSERT INTO Escribe (id_libro, id_autor) VALUES (1, 1);
INSERT INTO Escribe (id_libro, id_autor) VALUES (2, 2);
INSERT INTO Escribe (id_libro, id_autor) VALUES (3, 3);


UPDATE Autores SET nombre = 'Stephen King Jr.' WHERE id = 1;
UPDATE Libros SET editorial = 'Penguin Books' WHERE id = 1;
UPDATE Socios SET telefono = '555-5678' WHERE id = 1;
UPDATE Volumenes SET deteriorado = TRUE WHERE id = 1;
UPDATE Prestamos SET fecha_real = '2023-07-30' WHERE id = 1;
UPDATE Escribe SET id_autor = 2 WHERE id_libro = 1;

DELETE FROM Autores WHERE id = 1;
DELETE FROM Libros WHERE id = 1;
DELETE FROM Socios WHERE id = 1;
DELETE FROM Volumenes WHERE id = 1;
DELETE FROM Prestamos WHERE id = 1;
