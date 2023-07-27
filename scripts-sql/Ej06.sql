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
