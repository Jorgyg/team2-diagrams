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
    hora_salida date,
    hora_llegada date,
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
	on update cascade,
    FOREIGN KEY (dni_reserva) REFERENCES clientes(dni)
    on update cascade,
    FOREIGN KEY (fila_asiento) REFERENCES asientos(fila)
    on update cascade,
    FOREIGN KEY (columna_asiento) REFERENCES asientos(columna)
    on update cascade,
    FOREIGN KEY (planta_asiento) REFERENCES asientos(planta)
    on update cascade
);