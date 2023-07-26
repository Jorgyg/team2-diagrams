drop database red_social;
create database red_social;
use red_social;
create table contactos (
	id int auto_increment, 
    nombre varchar(20),
    comentario varchar(20),
    primary key(id)
);
create table usuarios (
	id int auto_increment, 
    contraseña varchar(20),
    nombre varchar(20),
    apellidos varchar(20),
    foto varchar(20),
    email varchar(20),
    telefono int,
	esCelebridad boolean,
    id_contactos int, 
    primary key(id),	
    FOREIGN KEY (id_contactos) references contactos(id) on delete cascade on update cascade
);
create table bloqueados (
	id int auto_increment, 
    id_usuario int, 
    primary key(id),
	FOREIGN KEY (id_usuario) references usuarios(id) on delete cascade on update cascade
);
create table grupos (
	id int auto_increment, 
    nombre varchar(20),
    foto varchar(20),
    primary key(id)
);
create table tiene_cg (
	id_contactos int, 
    id_grupos int, 
    primary key(id_contactos,id_grupos),
    FOREIGN KEY (id_contactos) references contactos(id) on delete cascade on update cascade,
    FOREIGN KEY (id_grupos) references grupos(id) on delete cascade on update cascade
);

INSERT INTO 
