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

insert into equipos (id,nombre,estadio) values 
(1,'real madrid','santiago bernabeu'),
(2,'fc barcelona','camp nou'),
(3,'at madrid','metropolitano'),
(4,'sevilla','sanchez pijuan');
insert into jugadores (dni,nombre,apellidos,edad,id_equipo) values 
('1234567a','dani','carvajal',31,1),
('2345678b','pedri','gonzalez',20,2),
('3456789c','alvaro','morata',30,3);
insert into entrenadores (dni,nombre,apellidos,edad,titulo,id_equipo) values 
('4567891d','carlo','ancelotti',64,'champions',1),
('5678901e','xavi','hernandez',40,'liga',2),
('6789123f','pep','guardiola',50,'champions',3);
insert into temporadas (id,fecha) values 
(1,'2023-04-21');
insert into partidos (id,estadio,hora,id_temp) values 
(1,'santiago bernabeu','2023-04-21',1);
insert into partidos_tiene_equipos (id_partido,id_equipo_1,id_equipo_2) values 
(1,1,2);
