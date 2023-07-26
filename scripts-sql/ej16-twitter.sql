drop database twitter;
create database twitter;
use twitter;
create table usuarios (
	username varchar(20),
    nombre varchar(20),
	email varchar(20),
	contaseña varchar(20),
    telefono int,
    num_twitts int,
    seguidores int,
    siguiendo int,
    ubicacion varchar(20),
    fecha_nacimiento date,
    fecha_creacion date,
    primary key(username)
);
create table mensajes (
	id int auto_increment,
    contenido varchar(20),
	likes int,
	visualizaciones int,
    retwitts int,
    bookmarks int,
    citas varchar(20),
    fecha date,
    num_respuestas int,
    username varchar(20),
    primary key (id),
    FOREIGN KEY (username) references usuarios(username) on delete cascade on update cascade
);
create table hashtags (
	nombre varchar(20),
    usos varchar(20),	
    id_mensajes int,
    primary key(nombre),
	FOREIGN KEY (id_mensajes) references mensajes(id) on delete cascade on update cascade
);
create table tiene (
	id_mensajes_comentario int,
    id_mensajes_twit int,
	FOREIGN KEY (id_mensajes_comentario) references mensajes(id) on delete cascade on update cascade,
    FOREIGN KEY (id_mensajes_twit) references mensajes(id) on delete cascade on update cascade
);
