create database software;
use software;
create table empresas (
	cif int, 
    nombre varchar(20),
    direccion varchar(20),
    telefono int,
    codigo_empresa int,
    primary key(cif)
);
create table proyectos (
	id int auto_increment, 
    fecha_inicio date,
    fecha_final date,
    fecha_final_prevista date,
	cif_empresa int,
    primary key(id),
	FOREIGN KEY (cif_empresa) references empresas(cif) on delete cascade on update cascade
);
create table profesion (
	codigo_profesion int, 
    nombre varchar(20),
    primary key(codigo_profesion)
);
create table trabajadores (
	codigo_trabajador int, 
    dni varchar(20),
    nombre varchar(20),
    apellidos varchar(20),
    profesion varchar(20),
    id_proyecto int, 
    horas_trabajadas int,
    codigo_profesion int,
    primary key(codigo_trabajador),
	FOREIGN KEY (id_proyecto) references proyectos(id) on delete cascade on update cascade,
	FOREIGN KEY (codigo_profesion) references profesion(codigo_profesion) on delete cascade on update cascade
);
