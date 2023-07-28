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
    ON DELETE CASCADE ON UPDATE CASCADE
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
    FOREIGN KEY (numero_estanteria) REFERENCES Estanteria(numero)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_ingrediente) REFERENCES Ingrediente(id)
    ON DELETE CASCADE ON UPDATE CASCADE
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
    FOREIGN KEY (id_ingrediente) REFERENCES Ingrediente(id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_plato) REFERENCES Plato(id)
    ON DELETE CASCADE ON UPDATE CASCADE
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
	id INT PRIMARY KEY,
    dni VARCHAR(10),
    fecha_nacimiento DATE,
    FOREIGN KEY (dni) REFERENCES Empleado(dni)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Cocinero (
    dni VARCHAR(10) PRIMARY KEY,
    id_pinche INT,
    anos_servicio INT,
    FOREIGN KEY (dni) REFERENCES Empleado(dni)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_pinche) REFERENCES Pinche(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Prepara (
    dni_cocinero VARCHAR(10),
    id_plato INT,
    PRIMARY KEY (dni_cocinero, id_plato),
    FOREIGN KEY (dni_cocinero) REFERENCES Cocinero(dni)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_plato) REFERENCES Plato(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO Almacen (letras, tamano) VALUES ('A', 20);
INSERT INTO Almacen (letras, tamano) VALUES ('B', 33);

INSERT INTO Estanteria (numero, nombre, descripcion, letra_almacen) VALUES (1, 'Estanteria 1', 'Se guardan verduras', 'A');
INSERT INTO Estanteria (numero, nombre, descripcion, letra_almacen) VALUES (2, 'Estanteria 2', 'Se guardan frutas', 'A');
INSERT INTO Estanteria (numero, nombre, descripcion, letra_almacen) VALUES (3, 'Estanteria 3', 'Se guardan legumbres', 'B');
INSERT INTO Estanteria (numero, nombre, descripcion, letra_almacen) VALUES (4, 'Estanteria 4', 'Se guardan Carnes', 'B');

INSERT INTO Ingrediente (nombre) VALUES ('Tomate');
INSERT INTO Ingrediente (nombre) VALUES ('Pepino');
INSERT INTO Ingrediente (nombre) VALUES ('Frijoles');
INSERT INTO Ingrediente (nombre) VALUES ('Carne');

INSERT INTO Almacena (numero_estanteria, id_ingrediente, cantidad) VALUES (1, 2, 20);
INSERT INTO Almacena (numero_estanteria, id_ingrediente, cantidad) VALUES (2, 1, 30);
INSERT INTO Almacena (numero_estanteria, id_ingrediente, cantidad) VALUES (3, 3, 15);
INSERT INTO Almacena (numero_estanteria, id_ingrediente, cantidad) VALUES (4, 4, 50);

INSERT INTO Plato (precio, tipo_plato, nombre) VALUES (15, 'Carne', 'Carne con frijoles');
INSERT INTO Plato (precio, tipo_plato, nombre) VALUES (14, 'Verduras','Surtido de verduras');
INSERT INTO Plato (precio, tipo_plato, nombre) VALUES (20, 'Carne','Carne a la brasa');
INSERT INTO Plato (precio, tipo_plato, nombre) VALUES (8, 'Verduras','Frijoles con tomate');

INSERT INTO Usa (id_plato, id_ingrediente, cantidad) VALUES (1, 4, 1);
INSERT INTO Usa (id_plato, id_ingrediente, cantidad) VALUES (1, 3, 1);
INSERT INTO Usa (id_plato, id_ingrediente, cantidad) VALUES (2, 2, 1);
INSERT INTO Usa (id_plato, id_ingrediente, cantidad) VALUES (2, 1, 2);
INSERT INTO Usa (id_plato, id_ingrediente, cantidad) VALUES (3, 4, 1);
INSERT INTO Usa (id_plato, id_ingrediente, cantidad) VALUES (4, 3, 1);
INSERT INTO Usa (id_plato, id_ingrediente, cantidad) VALUES (4, 1, 3);

INSERT INTO Empleado (dni, nombre, apellido, numero_ss, telefono_fijo, telefono_movil) 
VALUES ('1111111111', 'Juan', 'García', 12345, '123456789', '987654321');
INSERT INTO Empleado (dni, nombre, apellido, numero_ss, telefono_fijo, telefono_movil) 
VALUES ('2222222222', 'María', 'López', 67890, '987654321', '123456789');
INSERT INTO Empleado (dni, nombre, apellido, numero_ss, telefono_fijo, telefono_movil) 
VALUES ('3333333333', 'Pedro', 'Martínez', 13579, '246813579', '975318642');

INSERT INTO Pinche (id, dni, fecha_nacimiento) VALUES (1, '1111111111', '2000-03-15');

INSERT INTO Cocinero (dni, id_pinche, anos_servicio) VALUES ('2222222222', 1, 5);
INSERT INTO Cocinero (dni, id_pinche, anos_servicio) VALUES ('3333333333', 1, 8);

INSERT INTO Prepara(id_plato, dni_cocinero) VALUES (1, '2222222222');
INSERT INTO Prepara(id_plato, dni_cocinero) VALUES (3, '2222222222');
INSERT INTO Prepara(id_plato, dni_cocinero) VALUES (2, '3333333333');
INSERT INTO Prepara(id_plato, dni_cocinero) VALUES (4, '3333333333');
