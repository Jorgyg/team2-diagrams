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

