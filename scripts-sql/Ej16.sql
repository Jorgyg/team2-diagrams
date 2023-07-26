drop database twitter;
create database twitter;
use twitter;
create table usuarios (
	username varchar(20),
    nombre varchar(50),
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
    contenido varchar(255),
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

INSERT INTO usuarios VALUES ('sgallego', 'Sergio Gallego', 'sgallego@gmail.com', '123456', 666159694, 15, 100, 250, 'España', '2002-07-26', '2002-07-26');
INSERT INTO usuarios VALUES ('jdnavarro', 'Juan Diego Navarro', 'jdnavarro@gmail.com', 'jdn12', 000000000, 20, 20, 1000, 'España', '2000-01-01', '2002-07-26');
INSERT INTO usuarios VALUES ('jgras', 'Jordi Gras', 'jgras@gmail.com', 'jg13', 000000000, 20, 20, 1000, 'España', '2000-01-01','2002-07-26');
INSERT INTO usuarios VALUES ('mantonio', 'Manuel Antonio', 'mantonio@gmail.com', 'ma14', 000000000, 20, 20, 1000, 'España', '2000-01-01', '2002-07-26');
INSERT INTO usuarios VALUES ('msantoro', 'Marco Santoro', 'msantoro@gmail.com', 'ms15', 000000000, 20, 20, 1000, 'España', '2000-01-01', '2002-07-26');

INSERT INTO mensajes (contenido, likes, visualizaciones, retwitts, bookmarks, citas, fecha, num_respuestas, username) VALUES ('Mensaje 1', 23, 100, 50, 10, 23, '2023-07-26', 10, 'sgallego');
INSERT INTO mensajes (contenido, likes, visualizaciones, retwitts, bookmarks, citas, fecha, num_respuestas, username) VALUES ('Mensaje 2', 50, 80, 23, 11, 21, '2023-07-26', 0, 'jdnavarro');
INSERT INTO mensajes (contenido, likes, visualizaciones, retwitts, bookmarks, citas, fecha, num_respuestas, username) VALUES ('Mensaje 3', 21, 20, 56, 56, 67, '2023-07-26', 2, 'jgras');
INSERT INTO mensajes (contenido, likes, visualizaciones, retwitts, bookmarks, citas, fecha, num_respuestas, username) VALUES ('Mensaje 4', 9, 20, 78, 11, 99, '2023-07-26', 20, 'mantonio');
INSERT INTO mensajes (contenido, likes, visualizaciones, retwitts, bookmarks, citas, fecha, num_respuestas, username) VALUES ('Mensaje 5', 67, 130, 89, 1, 100, '2023-07-26', 5, 'msantoro');

INSERT INTO hashtags VALUES ('#Elecciones', 1, 1);
INSERT INTO hashtags VALUES ('#Accion', 1, 1);
INSERT INTO hashtags VALUES ('#X', 20, 2);
INSERT INTO hashtags VALUES ('#Twitter', 10, 3);
INSERT INTO hashtags VALUES ('#Calor', 15, 4);
INSERT INTO hashtags VALUES ('#RTX4060', 2, 5);

INSERT INTO tiene VALUES (1,2);
INSERT INTO tiene VALUES (3,4);
INSERT INTO tiene VALUES (4,5);

SELECT * FROM usuarios;
SELECT * FROM mensajes;
SELECT * FROM tiene;
SELECT * FROM hashtag;

UPDATE usuarios SET num_twitts=num_twitts*2 LIMIT 2;
UPDATE usuarios SET nombre='Sergio Gallego Gudiño' WHERE username='sgallego';
UPDATE usuarios SET seguidores=3000 WHERE username='jdnavarro';
UPDATE usuarios SET fecha_nacimiento='2002-07-09' WHERE username='jgras';

UPDATE mensajes SET contenido="He editado el mensaje, perdon" WHERE username="mantonio";
UPDATE mensajes SET contenido="No te preocupes" WHERE username="msantoro";

DELETE FROM mensajes WHERE id=1;
DELETE FROM mensajes WHERE id=2;
DELETE FROM hashtags WHERE id_mensajes=1;
DELETE FROM usuarios WHERE username='msantoro';

SELECT * FROM usuarios;
SELECT * FROM mensajes;
SELECT * FROM tiene;
SELECT * FROM hashtag;