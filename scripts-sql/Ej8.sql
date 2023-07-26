CREATE DATABASE vuelos_database;

USE vuelos_database;

CREATE TABLE aviones(
	codigo int auto_increment PRIMARY KEY,
    numero_plazas int
);

CREATE TABLE clientes(
	dni varchar(9) PRIMARY KEY,
    nombre varchar(60),
    apellidos varchar(100),
    direccion varchar(200),
    telefono int,
    tarjeta_credito varchar(30)
);

CREATE TABLE  aeropuertos(
	codigo int auto_increment PRIMARY KEY,
    nombre varchar(60),
    localidad varchar(60),
	pais varchar(60)
);

CREATE TABLE vuelos(
	codigo int auto_increment PRIMARY KEY,
    fecha date,
    hora_salida time,
    hora_llegada time,
    codigo_avion int,
    aeropuerto_llegada int,
    aeropuerto_salida int,
    FOREIGN KEY(codigo_avion) REFERENCES aviones(codigo)
    on update cascade,
    FOREIGN KEY(aeropuerto_llegada)REFERENCES aeropuertos(codigo)
    on update cascade
    on delete cascade,
    FOREIGN KEY(aeropuerto_salida)REFERENCES aeropuertos(codigo)
    on update cascade
    on delete cascade
);

CREATE TABLE asientos(
	fila int,
    columna int,
    planta int,
    codigo_avion int,
    PRIMARY KEY(fila, columna, planta),
    FOREIGN KEY(codigo_avion) REFERENCES aviones(codigo)
);

CREATE INDEX idx_asientos_fila ON asientos (fila);
CREATE INDEX idx_asientos_columna ON asientos (columna);
CREATE INDEX idx_asientos_planta ON asientos (planta);

CREATE TABLE tarjeta_embarques (
    numero_reserva int PRIMARY KEY,
    dni_cliente varchar(9),
    dni_reserva varchar(9),
    fecha date,
    plazas int,
    fila_asiento int, 
    columna_asiento int,
    planta_asiento int,
    FOREIGN KEY (dni_cliente) REFERENCES clientes(dni)
	on update cascade
    on delete cascade,
    FOREIGN KEY (dni_reserva) REFERENCES clientes(dni)
    on update cascade
    on delete cascade,
    FOREIGN KEY (fila_asiento) REFERENCES asientos(fila)
    on update cascade,
    FOREIGN KEY (columna_asiento) REFERENCES asientos(columna)
    on update cascade,
    FOREIGN KEY (planta_asiento) REFERENCES asientos(planta)
    on update cascade
);

INSERT INTO aviones(numero_plazas) VALUE(50);
INSERT INTO aviones(numero_plazas) VALUE(60);
INSERT INTO aviones(numero_plazas) VALUE(75);

INSERT INTO clientes VALUES ('111111111', 'Sergio', 'Gallego', 'Calle1', '111111111', '111111111');
INSERT INTO clientes VALUES ('222222222', 'Jordi', 'Gras', 'Calle2', '222222222', '222222222');
INSERT INTO clientes VALUES ('333333333', 'Juan Diego', 'Navarro', 'Calle3', '333333333', '333333333');

INSERT INTO aeropuertos (nombre, localidad, pais) VALUES ('Aeropuerto1', 'Tarragona', 'España');
INSERT INTO aeropuertos (nombre, localidad, pais) VALUES ('Aeropuerto2', 'Madrid', 'España');
INSERT INTO aeropuertos (nombre, localidad, pais) VALUES ('Aeropuerto3', 'Andaluzia', 'España');

INSERT INTO vuelos (fecha, hora_salida, hora_llegada, codigo_avion, aeropuerto_llegada, aeropuerto_salida) VALUES ('2020-01-01', '23:59', '04:30', 1, 1, 2);
INSERT INTO vuelos (fecha, hora_salida, hora_llegada, codigo_avion, aeropuerto_llegada, aeropuerto_salida) VALUES ('2020-03-07', '00:59', '02:30', 2, 2, 3);
INSERT INTO vuelos (fecha, hora_salida, hora_llegada, codigo_avion, aeropuerto_llegada, aeropuerto_salida) VALUES ('2020-01-01', '21:59', '01:30', 3, 3, 1);

INSERT INTO asientos VALUES (1,1,1,1);
INSERT INTO asientos VALUES (2,2,2,2);
INSERT INTO asientos VALUES (3,3,3,3);

INSERT INTO tarjeta_embarques VALUES (1, '111111111', '111111111', '2020-01-01', 1, 1, 1, 1);
INSERT INTO tarjeta_embarques VALUES (2, '222222222', '222222222', '2020-03-07', 2, 2, 2, 2);
INSERT INTO tarjeta_embarques VALUES (3, '333333333', '333333333', '2020-01-01', 3, 3, 3, 3);

UPDATE aviones SET numero_plazas = 100 WHERE codigo=1;
UPDATE clientes SET apellidos = 'Gallego Gudiño' WHERE dni = '111111111';
UPDATE aeropuertos SET localidad = 'Valencia' WHERE codigo = 1;

DELETE FROM clientes WHERE dni = '111111111';
DELETE FROM aeropuertos WHERE codigo = 2;

SELECT * FROM clientes;
SELECT * FROM aeropuertos;
SELECT * FROM tarjeta_embarques;