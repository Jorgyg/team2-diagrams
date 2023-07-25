DROP DATABASE IF EXISTS academia_de_clases;
CREATE DATABASE academia_de_clases; 
USE academia_de_clases;

CREATE TABLE Empresas (
    cif VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(15),
    direccion VARCHAR(100)
);

CREATE TABLE Alumnos (
    dni VARCHAR(10) PRIMARY KEY,
    direccion VARCHAR(100),
    nombre VARCHAR(50),
    telefono VARCHAR(15),
    edad INT,
    esTrabajador BOOLEAN,
    cif_empresa VARCHAR(20),
    FOREIGN KEY (cif_empresa) REFERENCES Empresas(cif)
);

CREATE TABLE Cursos (
    codigo_curso INT PRIMARY KEY,
    programa VARCHAR(200),
    horas INT,
    titulo VARCHAR(100),
    editorial VARCHAR(100),
    isbn VARCHAR(20)
);

CREATE TABLE Asiste (
    dni_alumno VARCHAR(10),
    codigo_curso INT,
    nota DECIMAL(4, 2),
    PRIMARY KEY (dni_alumno, codigo_curso),
    FOREIGN KEY (dni_alumno) REFERENCES Alumnos(dni),
    FOREIGN KEY (codigo_curso) REFERENCES Cursos(codigo_curso)
);

CREATE TABLE Profesores (
    dni VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(50),
    apellidos VARCHAR(100),
    direccion VARCHAR(100),
    telefono VARCHAR(15)
);

CREATE TABLE Impartidos (
    num_curso INT PRIMARY KEY,
    codigo_curso INT,
    dni_profesor VARCHAR(10),
    fecha_inicio DATE,
    fecha_final DATE,
    FOREIGN KEY (codigo_curso) REFERENCES Cursos(codigo_curso),
    FOREIGN KEY (dni_profesor) REFERENCES Profesores(dni)
);
