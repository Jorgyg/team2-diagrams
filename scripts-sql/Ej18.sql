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
    on update cascade
    on delete cascade
);

CREATE TABLE alquileres(
	id int PRIMARY KEY,
    num_alquiler int,
    codigo_personal int,
    id_inmueble int,
    FOREIGN KEY(id_inmueble) REFERENCES inmuebles(id)
    on update cascade
    on delete cascade
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
    on update cascade
    on delete cascade
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

INSERT INTO clientes (dni, codigo_personal, nombre, apellidos, telefono_fijo, telefono_movil) VALUES ('12345678A', 1001, 'Juan', 'Gómez', 912345678, 601234567);
INSERT INTO clientes (dni, codigo_personal, nombre, apellidos, telefono_fijo, telefono_movil) VALUES ('98765432B', 1002, 'María', 'López', 911111111, 602222222);
INSERT INTO clientes (dni, codigo_personal, nombre, apellidos, telefono_fijo, telefono_movil) VALUES ('45678912C', 1003, 'Carlos', 'Martínez', 913333333, 603333333);
INSERT INTO clientes (dni, codigo_personal, nombre, apellidos, telefono_fijo, telefono_movil) VALUES ('78945612D', 1004, 'Laura', 'Torres', 914444444, 604444444);
INSERT INTO clientes (dni, codigo_personal, nombre, apellidos, telefono_fijo, telefono_movil) VALUES ('65432198E', 1005, 'Pedro', 'Ramírez', 915555555, 605555555);

INSERT INTO trabajadores (dni, codigo_personal, nombre, apellidos, telefono_fijo, telefono_movil, dni_cliente) VALUES ('10000001X', 2001, 'Ana', 'Pérez', 910000000, 600000001, '12345678A');
INSERT INTO trabajadores (dni, codigo_personal, nombre, apellidos, telefono_fijo, telefono_movil, dni_cliente) VALUES ('20000002Y', 2002, 'Luis', 'García', 920000000, 610000001, '98765432B');
INSERT INTO trabajadores (dni, codigo_personal, nombre, apellidos, telefono_fijo, telefono_movil, dni_cliente) VALUES ('30000003Z', 2003, 'Elena', 'Rodríguez', 930000000, 620000001, '45678912C');
INSERT INTO trabajadores (dni, codigo_personal, nombre, apellidos, telefono_fijo, telefono_movil, dni_cliente) VALUES ('40000004W', 2004, 'Javier', 'Sánchez', 940000000, 630000001, '78945612D');
INSERT INTO trabajadores (dni, codigo_personal, nombre, apellidos, telefono_fijo, telefono_movil, dni_cliente) VALUES ('50000005V', 2005, 'Isabel', 'Gómez', 950000000, 640000001, '65432198E');

INSERT INTO inmuebles (id, codigo_compra, fecha, valor_compra, titulares, dni_cliente) VALUES (1, 10001, '2022-01-15', 200000, 'Juan Gómez', '12345678A');
INSERT INTO inmuebles (id, codigo_compra, fecha, valor_compra, titulares, dni_cliente) VALUES (2, 10002, '2021-11-05', 180000, 'María López', '98765432B');
INSERT INTO inmuebles (id, codigo_compra, fecha, valor_compra, titulares, dni_cliente) VALUES (3, 10003, '2023-02-20', 250000, 'Carlos Martínez', '45678912C');
INSERT INTO inmuebles (id, codigo_compra, fecha, valor_compra, titulares, dni_cliente) VALUES (4, 10004, '2020-08-10', 300000, 'Laura Torres', '78945612D');
INSERT INTO inmuebles (id, codigo_compra, fecha, valor_compra, titulares, dni_cliente) VALUES (5, 10005, '2022-06-30', 220000, 'Pedro Ramírez', '65432198E');

INSERT INTO alquileres (id, num_alquiler, codigo_personal, id_inmueble) VALUES (1, 5001, 2001, 1);
INSERT INTO alquileres (id, num_alquiler, codigo_personal, id_inmueble) VALUES (2, 5002, 2002, 2);
INSERT INTO alquileres (id, num_alquiler, codigo_personal, id_inmueble) VALUES (3, 5003, 2003, 3);
INSERT INTO alquileres (id, num_alquiler, codigo_personal, id_inmueble) VALUES (4, 5004, 2004, 4);
INSERT INTO alquileres (id, num_alquiler, codigo_personal, id_inmueble) VALUES (5, 5005, 2005, 5);

INSERT INTO pagos (id, año, mes, valor_alquiler) VALUES (1, 2023, 7, 800);
INSERT INTO pagos (id, año, mes, valor_alquiler) VALUES (2, 2023, 8, 850);
INSERT INTO pagos (id, año, mes, valor_alquiler) VALUES (3, 2023, 9, 900);
INSERT INTO pagos (id, año, mes, valor_alquiler) VALUES (4, 2023, 10, 950);
INSERT INTO pagos (id, año, mes, valor_alquiler) VALUES (5, 2023, 11, 1000);

INSERT INTO pisos (codigo_especial, id_inmueble) VALUES (1001, 1);
INSERT INTO pisos (codigo_especial, id_inmueble) VALUES (1002, 2);
INSERT INTO pisos (codigo_especial, id_inmueble) VALUES (1003, 3);
INSERT INTO pisos (codigo_especial, id_inmueble) VALUES (1004, 4);
INSERT INTO pisos (codigo_especial, id_inmueble) VALUES (1005, 5);

INSERT INTO garajes (num_garaje, planta, codigo_piso, id_inmueble) VALUES (1, 0, 1001, 1);
INSERT INTO garajes (num_garaje, planta, codigo_piso, id_inmueble) VALUES (2, -1, 1002, 2);
INSERT INTO garajes (num_garaje, planta, codigo_piso, id_inmueble) VALUES (3, 2, 1003, 3);
INSERT INTO garajes (num_garaje, planta, codigo_piso, id_inmueble) VALUES (4, 1, 1004, 4);
INSERT INTO garajes (num_garaje, planta, codigo_piso, id_inmueble) VALUES (5, 3, 1005, 5);

INSERT INTO locales (uso, tiene_servicio, id_inmueble) VALUES ('Oficina', true, 1);
INSERT INTO locales (uso, tiene_servicio, id_inmueble) VALUES ('Tienda', true, 2);
INSERT INTO locales (uso, tiene_servicio, id_inmueble) VALUES ('Restaurante', false, 3);
INSERT INTO locales (uso, tiene_servicio, id_inmueble) VALUES ('Cafetería', true, 4);
INSERT INTO locales (uso, tiene_servicio, id_inmueble) VALUES ('Gimnasio', true, 5);

INSERT INTO requieren (id_pagos, id_alquileres) VALUES (1, 1);
INSERT INTO requieren (id_pagos, id_alquileres) VALUES (2, 2);
INSERT INTO requieren (id_pagos, id_alquileres) VALUES (3, 3);
INSERT INTO requieren (id_pagos, id_alquileres) VALUES (4, 4);
INSERT INTO requieren (id_pagos, id_alquileres) VALUES (5, 5);

update clientes set nombre = 'Ivan' where dni = '12345678A';
update locales set uso = 'Bar' where id_inmueble = 3;
delete from pagos where id = 3;
delete from clientes where dni = '45678912C';
delete from locales where id_inmueble = 4;

select * from clientes;
select * from inmuebles;
select * from requieren;