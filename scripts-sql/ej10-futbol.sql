create database futbol;
use futbol;
create table temporadas (
	id int auto_increment,
    fecha date,
    primary key(id)
);
create table partidos (
	id int auto_increment,
    estadio varchar(20),
    hora date,
    id_temp int,
    primary key(id),
	FOREIGN KEY (id_temp) references temporadas(id) on delete cascade on update cascade
);
create table equipos (
	id int auto_increment,
    nombre varchar(20),
    estadio varchar(20),
    primary key(id)
);
create table partidos_tiene_equipos (
	id_partido int,
    id_equipo_1 int,
    id_equipo_2 int,
	FOREIGN KEY (id_partido) references partidos(id) on delete cascade on update cascade,
	FOREIGN KEY (id_equipo_1) references equipos(id) on delete cascade on update cascade,
	FOREIGN KEY (id_equipo_2) references equipos(id) on delete cascade on update cascade
);
create table jugadores (
	dni varchar(20),
    nombre varchar(20),
    apellidos varchar(20),
    edad int,
    id_equipo int,
    primary key(dni),
	FOREIGN KEY (id_equipo) references equipos(id) on delete cascade on update cascade
);
create table entrenadores (
	dni varchar(20),
    nombre varchar(20),
    apellidos varchar(20),
    edad int,
    titulo varchar(20),
    id_equipo int,
    primary key(dni),
	FOREIGN KEY (id_equipo) references equipos(id) on delete cascade on update cascade
);
