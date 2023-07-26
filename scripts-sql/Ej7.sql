CREATE DATABASE organigrama;

USE organigrama;

CREATE TABLE categorias(
	id int auto_increment PRIMARY KEY,
    nombre varchar(60),
    fecha_inicio DATE,
    fecha_final DATE
);

CREATE TABLE empleados(
	dni varchar(9) PRIMARY KEY,
    num_seguridad_social int,
    codigo_trabajador int UNIQUE,
    nombre varchar(60),
    apellidos varchar(100),
    direccion varchar(200),
    telefono int,
    id_departamento int,
    nombre_departamento varchar(60),
    id_empl_responsable varchar(9),
    FOREIGN KEY(id_empl_responsable) REFERENCES empleados(dni)
    on update cascade
);

CREATE TABLE contratos(
	dni varchar(9) PRIMARY KEY,
    fecha_inicio date,
    fecha_final date,
    id_categorias int,
    FOREIGN KEY(dni) references empleados(dni)
    on update cascade
    on delete cascade,
    FOREIGN KEY(id_categorias) REFERENCES categorias(id)
    on update cascade
);

CREATE TABLE departamentos(
	id int auto_increment PRIMARY KEY,
    nombre varchar(60),
    dni_coordinador varchar(9),
    FOREIGN KEY(dni_coordinador) REFERENCES empleados(dni)
    on update cascade
);

CREATE TABLE nominas(
	id int auto_increment,
    fecha date,
    salario int,
    categoria_empleado varchar(60),
    dni_contrato varchar(9),
    PRIMARY KEY(id, dni_contrato),
    FOREIGN KEY(dni_contrato) REFERENCES contratos(dni)
    on update cascade
    on delete cascade
);

INSERT INTO categorias (nombre, fecha_inicio, fecha_final) VALUES ('jefe', '2020-02-02', '2300-01-01');
INSERT INTO categorias (nombre, fecha_inicio, fecha_final) VALUES ('supervisor', '2018-02-02', '2300-01-01');
INSERT INTO categorias (nombre, fecha_inicio, fecha_final) VALUES ('director', '2008-02-02', '2300-01-01');

INSERT INTO empleados (dni, num_seguridad_social, codigo_trabajador, nombre, apellidos, direccion, telefono, id_departamento, nombre_departamento) VALUES ('123456789', 67890, 23, 'Sergio', 'Gallego', 'Calle 1', 111111111, 1, 'Contabilidad');
INSERT INTO empleados VALUES ('234567890', 78901, 34, 'Jordi', 'Gras', 'Calle 2', 222222222, 2, 'RRHH', '123456789');
INSERT INTO empleados VALUES ('345678901', 89012, 45, 'Joan Diego', 'Navarro', 'Calle 3', 333333333, 3, 'Administracion', '234567890');

INSERT INTO contratos VALUES ('123456789', '2020-02-02', '2300-01-01', 1);
INSERT INTO contratos VALUES ('234567890', '2018-02-02', '2300-01-01', 2);
INSERT INTO contratos VALUES ('345678901', '2008-02-02', '2300-01-01', 3);

INSERT INTO departamentos (nombre, dni_coordinador) VALUES ('Contabilidad', '123456789');
INSERT INTO departamentos (nombre, dni_coordinador) VALUES ('RRHH', '234567890');
INSERT INTO departamentos (nombre, dni_coordinador) VALUES ('Administracion', '345678901');

INSERT INTO nominas (fecha, salario, categoria_empleado, dni_contrato) VALUES ('2020-02-02', 2000, 'jefe', '123456789');
INSERT INTO nominas (fecha, salario, categoria_empleado, dni_contrato) VALUES ('2018-02-02', 1500, 'supervisor', '234567890');
INSERT INTO nominas (fecha, salario, categoria_empleado, dni_contrato) VALUES ('2008-02-02', 1000, 'director', '345678901');

UPDATE categorias SET fecha_inicio = '2008-02-02' WHERE id=1;
UPDATE contratos SET fecha_final = '2023-05-06' WHERE dni='123456789';
UPDATE departamentos SET nombre='Recursos Humanos' WHERE id=2;

DELETE FROM nominas WHERE dni_contrato = '123456789';
DELETE FROM departamentos WHERE id=2;

SELECT * FROM empleados;
SELECT * FROM categorias;
SELECT * FROM nominas;