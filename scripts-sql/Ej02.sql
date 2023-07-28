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

INSERT INTO Empresas (cif, nombre, telefono, direccion) VALUES ('1234567890', 'Empresa A', '555-1234', 'Calle Principal 123');
INSERT INTO Empresas (cif, nombre, telefono, direccion) VALUES ('9876543210', 'Empresa B', '555-5678', 'Avenida Secundaria 456');
INSERT INTO Empresas (cif, nombre, telefono, direccion) VALUES ('6543210987', 'Empresa C', '555-9876', 'Plaza Central 789');

INSERT INTO Alumnos (dni, direccion, nombre, telefono, edad, esTrabajador, cif_empresa) VALUES ('1111111111', 'Calle Uno 1', 'Juan', '111-1111', 25, TRUE, '1234567890');
INSERT INTO Alumnos (dni, direccion, nombre, telefono, edad, esTrabajador, cif_empresa) VALUES ('2222222222', 'Avenida Dos 2', 'María', '222-2222', 30, FALSE, NULL);
INSERT INTO Alumnos (dni, direccion, nombre, telefono, edad, esTrabajador, cif_empresa) VALUES ('3333333333', 'Plaza Tres 3', 'Carlos', '333-3333', 22, TRUE, '9876543210');

INSERT INTO Cursos (codigo_curso, programa, horas, titulo, editorial, isbn) VALUES (101, 'Programación en Java', 40, 'Java 101', 'Editorial X', '9781234567890');
INSERT INTO Cursos (codigo_curso, programa, horas, titulo, editorial, isbn) VALUES (102, 'Diseño Gráfico', 30, 'Diseño Creativo', 'Editorial Y', '9789876543210');
INSERT INTO Cursos (codigo_curso, programa, horas, titulo, editorial, isbn) VALUES (103, 'Inglés Avanzado', 50, 'Avanzando en Inglés', 'Editorial Z', '9780987654321');

INSERT INTO Profesores (dni, nombre, apellidos, direccion, telefono) VALUES ('1111111111', 'Ana', 'Gómez', 'Calle Uno 1', '111-1111');
INSERT INTO Profesores (dni, nombre, apellidos, direccion, telefono) VALUES ('2222222222', 'Pedro', 'López', 'Avenida Dos 2', '222-2222');
INSERT INTO Profesores (dni, nombre, apellidos, direccion, telefono) VALUES ('3333333333', 'María', 'Martínez', 'Plaza Tres 3', '333-3333');

INSERT INTO Impartidos (num_curso, codigo_curso, dni_profesor, fecha_inicio, fecha_final) VALUES (1, 101, '1111111111', '2023-07-01', '2023-07-30');
INSERT INTO Impartidos (num_curso, codigo_curso, dni_profesor, fecha_inicio, fecha_final) VALUES (2, 102, '2222222222', '2023-08-01', '2023-08-31');
INSERT INTO Impartidos (num_curso, codigo_curso, dni_profesor, fecha_inicio, fecha_final) VALUES (3, 101, '1111111111', '2023-09-01', '2023-09-30');

UPDATE Empresas SET telefono = '555-1111' WHERE cif = '1234567890';
UPDATE Alumnos SET esTrabajador = FALSE WHERE dni = '2222222222';
UPDATE Cursos SET horas = 45 WHERE codigo_curso = 101;
UPDATE Profesores SET telefono = '555-1111' WHERE dni = '1111111111';
UPDATE Profesores SET apellidos = 'Rodríguez' WHERE dni = '2222222222';
UPDATE Impartidos SET fecha_final = '2023-08-15' WHERE num_curso = 1;
UPDATE Impartidos SET dni_profesor = '3333333333' WHERE num_curso = 2;

DELETE FROM Empresas WHERE cif = '6543210987';
DELETE FROM Alumnos WHERE dni = '3333333333';
DELETE FROM Cursos WHERE codigo_curso = 103;
DELETE FROM Profesores WHERE dni = '3333333333';
DELETE FROM Impartidos WHERE num_curso = 3;
