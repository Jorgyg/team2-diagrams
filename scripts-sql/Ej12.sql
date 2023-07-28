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
insert into empresas (cif,nombre,direccion,telefono,codigo_empresa) values 
(0123456789,'tech-system','direccion1',666999888,1),
(0112344566,'orgSystems','direccion2',663258258,2),
(1122856123,'otraMasSystem','direccion3',654124784,3);
insert into profesion (codigo_profesion,nombre) values 
(1,'diseñador visual'),
(2,'analista'),
(3,'programador');
insert into proyectos (id,fecha_inicio,fecha_final,fecha_final_prevista,cif_empresa) values 
(1,'2022-02-27','2022-04-20','2022-03-31',0123456789),
(2,'2022-12-12','2023-01-24','2023-01-31',1122856123);
insert into trabajadores (codigo_trabajador,dni,nombre,apellidos,profesion,id_proyecto,horas_trabajadas,codigo_profesion) values 
(1,'147258369i','Pedro','Garcia Garcia','diseñador visual',1,113,1),
(2,'14582369r','Laura','Fernandez Perez','analista',1,33,1),
(3,'123458980t','Javier','Gonzalez Ruiz','programador',1,80,1);
update trabajadores set horas_trabajadas=120 where codigo_trabajador=1;
