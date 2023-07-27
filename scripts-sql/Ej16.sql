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
    id_mensaje_og int,
    num_respuestas int,
    username varchar(20),
    primary key (id, username),
    FOREIGN KEY (username) references usuarios(username) on delete cascade on update cascade,
    FOREIGN KEY (id_mensaje_og) references mensajes(id) on delete cascade on update cascade
);
create table hashtags (
	id int auto_increment PRIMARY KEY,
	nombre varchar(20),
    usos int
);

create table tendencias (
	id int auto_increment PRIMARY KEY,
	nombre varchar(20),
    usos int
);

CREATE TABLE mensaje_hashtag(
	id_mensaje int,
    id_hashtag int,
    PRIMARY KEY(id_mensaje, id_hashtag),
    FOREIGN KEY (id_mensaje) REFERENCES mensajes(id)
    on update cascade
    on delete cascade,
    FOREIGN KEY (id_hashtag) REFERENCES hashtags(id)
    on update cascade
    on delete cascade
);

CREATE TABLE mensaje_tendencia(
	id_mensaje int,
    id_tendencia int,
    PRIMARY KEY(id_mensaje, id_tendencia),
    FOREIGN KEY (id_mensaje) REFERENCES mensajes(id)
    on update cascade
    on delete cascade,
    FOREIGN KEY (id_tendencia) REFERENCES tendencias(id)
    on update cascade
    on delete cascade
);

INSERT INTO usuarios VALUES ('sgallego', 'Sergio Gallego', 'sgallego@gmail.com', '123456', 666159694, 15, 100, 250, 'España', '2002-07-26', '2002-07-26'),
('jdnavarro', 'Juan Diego Navarro', 'jdnavarro@gmail.com', 'jdn12', 000000000, 20, 20, 1000, 'España', '2000-01-01', '2002-07-26'),
('jgras', 'Jordi Gras', 'jgras@gmail.com', 'jg13', 000000000, 20, 20, 1000, 'España', '2000-01-01','2002-07-26'),
('mantonio', 'Manuel Antonio', 'mantonio@gmail.com', 'ma14', 000000000, 20, 20, 1000, 'España', '2000-01-01', '2002-07-26'),
('msantoro', 'Marco Santoro', 'msantoro@gmail.com', 'ms15', 000000000, 20, 20, 1000, 'España', '2000-01-01', '2002-07-26');

INSERT INTO mensajes (contenido, likes, visualizaciones, retwitts, bookmarks, citas, fecha, num_respuestas, username)
VALUES ('Mensaje 1', 23, 100, 50, 10, 23, '2023-07-26', 10, 'sgallego');
INSERT INTO mensajes (contenido, likes, visualizaciones, retwitts, bookmarks, citas, fecha, num_respuestas, username, id_mensaje_og) VALUES 
('Mensaje 1', 23, 100, 50, 10, 23, '2023-07-26', 10, 'sgallego', 1),
('Mensaje 2', 50, 80, 23, 11, 21, '2023-07-26', 0, 'jdnavarro', 2),
('Mensaje 3', 21, 20, 56, 56, 67, '2023-07-26', 2, 'jgras', 3),
('Mensaje 4', 9, 20, 78, 11, 99, '2023-07-26', 20, 'mantonio', 4),
('Mensaje 5', 67, 130, 89, 1, 100, '2023-07-26', 5, 'msantoro', 5);

INSERT INTO hashtags (nombre, usos) VALUES 
('#Elecciones', 1),
('#Accion', 1),
('#X', 20),
('#Twitter', 10),
('#Calor', 15),
('#RTX4060', 2);

INSERT INTO tendencias (nombre, usos) VALUES 
('PP', 234),
('Nintendo', 1506),
('TwitterX',356000),
('Salvame', 78000),
('Record', 2345),
('Conferencia', 1200);

INSERT INTO mensaje_hashtag VALUES (1,2),(3,4),(4,5);
INSERT INTO mensaje_tendencia VALUES (1,2),(3,4),(4,5);

SELECT * FROM usuarios;
SELECT * FROM mensajes;
SELECT * FROM hashtags;

UPDATE usuarios SET num_twitts=num_twitts*2 LIMIT 2;
UPDATE usuarios SET nombre='Sergio Gallego Gudiño' WHERE username='sgallego';
UPDATE usuarios SET seguidores=3000 WHERE username='jdnavarro';
UPDATE usuarios SET fecha_nacimiento='2002-07-09' WHERE username='jgras';

UPDATE mensajes SET contenido="He editado el mensaje, perdon" WHERE username="mantonio";
UPDATE mensajes SET contenido="No te preocupes" WHERE username="msantoro";

DELETE FROM mensajes WHERE id=1;
DELETE FROM mensajes WHERE id=2;
DELETE FROM hashtags WHERE id=1;
DELETE FROM usuarios WHERE username='msantoro';

SELECT * FROM usuarios;
SELECT * FROM mensajes;
SELECT * FROM mensaje_hashtag;
SELECT * FROM mensaje_tendencia;