CREATE DATABASE inmuebles_database;

USE inmuebles_database;

CREATE TABLE clientes(
	dni varchar(9) PRIMARY KEY,
    codigo_personal int,
    nombre varchar(60),
    apellidos varchar(60),
    telefono_fijo int,
    telefono_movil int
);

CREATE TABLE trabajadores(
	dni varchar(9) PRIMARY KEY,
    codigo_personal int,
    nombre varchar(60),
    apellidos varchar(60),
    telefono_fijo int,
    telefono_movil int,
    dni_cliente varchar(9),
    FOREIGN KEY (dni_cliente) REFERENCES clientes(dni)
	on update cascade
    on delete cascade
);

CREATE TABLE inmuebles(
	id int PRIMARY KEY,
    codigo_compra int,
    fecha date,
    valor_compra int,
    titulares varchar(100),
    dni_cliente varchar(9),
    FOREIGN KEY (dni_cliente) REFERENCES clientes(dni)
);

CREATE TABLE alquileres(
	id int PRIMARY KEY,
    num_alquiler int,
    codigo_personal int,
    id_inmueble int,
    FOREIGN KEY(id_inmueble) REFERENCES inmuebles(id)
);

CREATE TABLE pagos(
	id int PRIMARY KEY,
    año int,
    mes int,
    valor_alquiler int
);

CREATE TABLE requieren(
	id_pagos int,
    id_alquileres int,
    PRIMARY KEY(id_pagos, id_alquileres),
    FOREIGN KEY(id_pagos) REFERENCES pagos(id)
    on update cascade
    on delete cascade,
    FOREIGN KEY(id_alquileres) REFERENCES alquileres(id)
    on update cascade
    on delete cascade
);

CREATE TABLE pisos(
	codigo_especial int,
    id_inmueble int,
    PRIMARY KEY(codigo_especial, id_inmueble),
    FOREIGN KEY(id_inmueble) REFERENCES inmuebles(id)
);

CREATE TABLE garajes(
	num_garaje int,
    planta int,
    codigo_piso int,
    id_inmueble int PRIMARY KEY,
    FOREIGN KEY(id_inmueble) REFERENCES inmuebles(id)
    on update cascade
    on delete cascade,
    FOREIGN KEY(codigo_piso) REFERENCES pisos(codigo_especial)
    on update cascade
);

CREATE TABLE locales(
	uso varchar(50),
    tiene_servicio boolean,
    id_inmueble int PRIMARY KEY,
    FOREIGN KEY(id_inmueble) REFERENCES inmuebles(id)
    on update cascade
    on delete cascade
);

