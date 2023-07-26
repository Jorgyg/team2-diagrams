DROP DATABASE IF EXISTS empresa_de_comidas;
CREATE DATABASE empresa_de_comidas;
USE empresa_de_comidas;

CREATE TABLE Almacen (
    letras VARCHAR(10) PRIMARY KEY,
    tamano INT
);

CREATE TABLE Estanteria (
    numero INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    letra_almacen VARCHAR(10),
    FOREIGN KEY (letra_almacen) REFERENCES Almacen(letras)
);

CREATE TABLE Ingrediente (
    id INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Almacena (
    numero_estanteria INT,
    id_ingrediente INT,
    cantidad INT,
    PRIMARY KEY (numero_estanteria, id_ingrediente),
    FOREIGN KEY (numero_estanteria) REFERENCES Estanteria(numero),
    FOREIGN KEY (id_ingrediente) REFERENCES Ingrediente(id)
);

CREATE TABLE Plato (
    id INT PRIMARY KEY,
    precio DECIMAL(8, 2),
    tipo_plato VARCHAR(50),
    nombre VARCHAR(100)
);

CREATE TABLE Usa (
    id_ingrediente INT,
    id_plato INT,
    cantidad INT,
    PRIMARY KEY (id_ingrediente, id_plato),
    FOREIGN KEY (id_ingrediente) REFERENCES Ingrediente(id),
    FOREIGN KEY (id_plato) REFERENCES Plato(id)
);

CREATE TABLE Empleado (
    dni VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(100),
    numero_ss INT,
    telefono_fijo VARCHAR(15),
    telefono_movil VARCHAR(15)
);

CREATE TABLE Pinche (
    dni VARCHAR(10) PRIMARY KEY,
    fecha_nacimiento DATE
);

CREATE TABLE Cocinero (
    dni VARCHAR(10) PRIMARY KEY,
    anos_servicio INT
);

CREATE TABLE Prepara (
    dni_cocinero VARCHAR(10),
    id_plato INT,
    PRIMARY KEY (dni_cocinero, id_plato),
    FOREIGN KEY (dni_cocinero) REFERENCES Cocinero(dni),
    FOREIGN KEY (id_plato) REFERENCES Plato(id)
);
