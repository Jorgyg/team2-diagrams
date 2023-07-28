DROP DATABASE IF EXISTS biblioteca_v2;
CREATE DATABASE biblioteca_v2;
USE biblioteca_v2;

CREATE TABLE Autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    pais VARCHAR(50)
);

CREATE TABLE Articulos (
    codigo_articulo INT PRIMARY KEY,
    nombre VARCHAR(100),
    año_obra DATE,
    resumen TEXT,
    resumen_obra TEXT,
    esta_deteriorado BOOLEAN,
    comentario_deterioro TEXT,
    id_autor INT,
    FOREIGN KEY (id_autor) REFERENCES Autores(id)
);

CREATE TABLE Libros (
    id INT PRIMARY KEY,
    num_paginas INT,
    codigo_articulo INT,
    FOREIGN KEY (codigo_articulo) REFERENCES Articulos(codigo_articulo)
);

CREATE TABLE Cds (
    id INT PRIMARY KEY,
    num_canciones INT,
    codigo_articulo INT,
    FOREIGN KEY (codigo_articulo) REFERENCES Articulos(codigo_articulo)
);

CREATE TABLE Peliculas (
    id INT PRIMARY KEY,
    duracion INT,
    codigo_articulo INT,
    FOREIGN KEY (codigo_articulo) REFERENCES Articulos(codigo_articulo)
);

CREATE TABLE Socios (
    codigo_socio INT PRIMARY KEY,
    dni VARCHAR(10),
    nombre VARCHAR(50),
    apellidos VARCHAR(100),
    direccion VARCHAR(100),
    telefono VARCHAR(15)
);

CREATE TABLE Prestamos (
    id INT PRIMARY KEY,
    fecha_presta DATE,
    fecha_max_devolucion DATE,
    fecha_entrega DATE
);

CREATE TABLE Presta (
    codigo_articulo INT,
    codigo_socio INT,
    FOREIGN KEY (codigo_articulo) REFERENCES Articulos(codigo_articulo),
    FOREIGN KEY (codigo_socio) REFERENCES Socios(codigo_socio)
);


INSERT INTO Autores (nombre, pais) VALUES ('Juan Pérez', 'España');
INSERT INTO Autores (nombre, pais) VALUES ('María López', 'Argentina');
INSERT INTO Autores (nombre, pais) VALUES ('Carlos García', 'México');
INSERT INTO Articulos (codigo_articulo, nombre, año_obra, resumen, resumen_obra, esta_deteriorado, comentario_deterioro, id_autor) VALUES (1, 'Artículo 1', '2020-01-01', 'Resumen del artículo 1', 'Resumen de la obra del artículo 1', FALSE, '', 1);
INSERT INTO Articulos (codigo_articulo, nombre, año_obra, resumen, resumen_obra, esta_deteriorado, comentario_deterioro, id_autor) VALUES (2, 'Artículo 2', '2019-05-15', 'Resumen del artículo 2', 'Resumen de la obra del artículo 2', TRUE, 'Dañado en la portada', 2);
INSERT INTO Articulos (codigo_articulo, nombre, año_obra, resumen, resumen_obra, esta_deteriorado, comentario_deterioro, id_autor) VALUES (3, 'Artículo 3', '2022-11-30', 'Resumen del artículo 3', 'Resumen de la obra del artículo 3', FALSE, '', 3);
INSERT INTO Libros (id, num_paginas, codigo_articulo) VALUES (101, 300, 1);
INSERT INTO Cds (id, num_canciones, codigo_articulo) VALUES (201, 12, 2);
INSERT INTO Peliculas (id, duracion, codigo_articulo) VALUES (301, 120, 3);
INSERT INTO Socios (codigo_socio, dni, nombre, apellidos, direccion, telefono) VALUES (1001, '11111111A', 'Ana', 'Gómez', 'Calle Uno 1', '555-1111');
INSERT INTO Socios (codigo_socio, dni, nombre, apellidos, direccion, telefono) VALUES (1002, '22222222B', 'Pedro', 'López', 'Avenida Dos 2', '555-2222');
INSERT INTO Socios (codigo_socio, dni, nombre, apellidos, direccion, telefono) VALUES (1003, '33333333C', 'María', 'Martínez', 'Plaza Tres 3', '555-3333');
INSERT INTO Prestamos (id, fecha_presta, fecha_max_devolucion, fecha_entrega) VALUES (5001, '2023-07-01', '2023-07-15', '2023-07-10');
INSERT INTO Prestamos (id, fecha_presta, fecha_max_devolucion, fecha_entrega) VALUES (5002, '2023-08-01', '2023-08-15', '2023-08-05');
INSERT INTO Prestamos (id, fecha_presta, fecha_max_devolucion, fecha_entrega) VALUES (5003, '2023-09-01', '2023-09-15', NULL);

UPDATE Autores SET pais = 'Colombia' WHERE id = 1;
UPDATE Autores SET nombre = 'Laura Martínez' WHERE id = 2;
UPDATE Articulos SET resumen = 'Nuevo resumen del artículo 1' WHERE codigo_articulo = 1;
UPDATE Articulos SET esta_deteriorado = FALSE WHERE codigo_articulo = 2;
UPDATE Socios SET telefono = '555-1234' WHERE codigo_socio = 1001;
UPDATE Socios SET apellidos = 'Rodríguez' WHERE codigo_socio = 1002;
UPDATE Prestamos SET fecha_entrega = '2023-07-12' WHERE id = 5001;

DELETE FROM Autores WHERE id = 3;
DELETE FROM Articulos WHERE codigo_articulo = 3;
