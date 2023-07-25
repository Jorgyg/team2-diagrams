CREATE DATABASE organigrama;

USE organigrama;

CREATE TABLE categorias(
	id int PRIMARY KEY,
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
    nombre_departamento int,
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

