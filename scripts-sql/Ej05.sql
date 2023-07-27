CREATE DATABASE almacen1;

USE almacen1;

CREATE TABLE piezas(
    letras varchar(10),
    numeros int,
    descripcion varchar(200),
    precio int,
    letra_pieza_padre varchar(10),
    numero_pieza_padre int,
    PRIMARY KEY(letras, numeros),
    FOREIGN KEY(letra_pieza_padre, numero_pieza_padre) 
    REFERENCES piezas(letras, numeros)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE almacenes(
	numero int auto_increment PRIMARY KEY,
    descripcion varchar(200),
    direccion varchar(200)
);

CREATE TABLE estanterias(
	letras varchar(10) PRIMARY KEY,
	numero_almacen int,
    FOREIGN KEY(numero_almacen) REFERENCES almacenes(numero)
    on update cascade
);

CREATE TABLE guardan(
    letras_piezas varchar(10),
    numeros_piezas int,
    letras_estanterias varchar(10),
    PRIMARY KEY(letras_piezas, numeros_piezas, letras_estanterias),
    FOREIGN KEY(letras_piezas, numeros_piezas) REFERENCES piezas(letras, numeros)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY(letras_estanterias) REFERENCES estanterias(letras)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

INSERT INTO piezas (letras, numeros, descripcion, precio) VALUES ('A', 1, 'DESC1', 1);
INSERT INTO piezas (letras, numeros, descripcion, precio) VALUES ('B', 1, 'DESC2', 2);
INSERT INTO piezas (letras, numeros, descripcion, precio) VALUES ('C', 1, 'DESC3', 3);
INSERT INTO piezas VALUES ('A', 2, 'DESC3', 3, 'A', 1);
INSERT INTO piezas VALUES ('C', 2, 'DESC3', 3, 'C', 1);

INSERT INTO almacenes (descripcion, direccion) VALUES ('DESC1', 'DIR1');
INSERT INTO almacenes (descripcion, direccion) VALUES ('DESC2', 'DIR2');
INSERT INTO almacenes (descripcion, direccion) VALUES ('DESC3', 'DIR3');

INSERT INTO estanterias VALUES ('A', 1);
INSERT INTO estanterias VALUES ('B', 2);
INSERT INTO estanterias VALUES ('C', 3);

UPDATE piezas SET descripcion = 'Esta es la descripcion de la pieza A numero 1' WHERE letras='A' AND numeros=1;
UPDATE piezas SET descripcion = 'Esta es la descripcion de la pieza C numero 2' WHERE letras='C' AND numeros=2;

DELETE FROM estanterias WHERE letra = 'A';
