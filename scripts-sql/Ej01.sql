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

