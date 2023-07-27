CREATE DATABASE recetas_cocina;

USE recetas_cocina;

CREATE TABLE categorias(
	id int auto_increment PRIMARY KEY,
    nombre varchar(60),
    descripcion varchar(200)
);

CREATE TABLE cocineros(
	id int auto_increment PRIMARY KEY,
    nombre varchar(60)
);

CREATE TABLE recetas(
	id int auto_increment PRIMARY KEY,
    nombre varchar(60),
    tiempo_preparacion int,
    tiempo_coccion int,
    id_cocinero int,
    id_categoria int,
    FOREIGN KEY(id_cocinero) REFERENCES cocineros(id)
    on update cascade
    on delete cascade,
    FOREIGN KEY(id_categoria) REFERENCES categorias(id)
    on update cascade
);

CREATE TABLE pasos(
	orden int auto_increment,
    descripcion varchar(200),
    id_receta int,
    PRIMARY KEY (orden, id_receta),
    FOREIGN KEY(id_receta) REFERENCES recetas(id)
    on update cascade
    on delete cascade
);

CREATE TABLE ingredientes(
	id int auto_increment PRIMARY KEY,
    nombre varchar(60)
);

CREATE TABLE utiliza(
	id_ingrediente int,
    id_receta int,
    cantidad int,
    PRIMARY KEY (id_ingrediente, id_receta),
    FOREIGN KEY(id_ingrediente) REFERENCES ingredientes(id)
    on update cascade
    on delete cascade,
    FOREIGN KEY(id_receta) REFERENCES recetas(id)
	on update cascade
    on delete cascade
);

INSERT INTO categorias (nombre, descripcion) VALUES ('Primer plato', 'Aquí van los primeros platos del menú');
INSERT INTO categorias (nombre, descripcion) VALUES ('Segundo plato', 'Aquí van los segundos platos del menú');
INSERT INTO categorias (nombre, descripcion) VALUES ('Postre', 'Aquí van los postres del menú');

INSERT INTO cocineros (nombre) VALUES ('Sergio Gallego');
INSERT INTO cocineros (nombre) VALUES ('Jordi Gras');
INSERT INTO cocineros (nombre) VALUES ('Juan Diego Navarro');

INSERT INTO recetas (nombre, tiempo_preparacion, tiempo_coccion, id_categoria) VALUES ('Tortilla de patatas', 23, 10, 2);
INSERT INTO recetas (nombre, tiempo_preparacion, tiempo_coccion, id_cocinero, id_categoria) VALUES ('Macarrones', 40, 10, 1, 2);
INSERT INTO recetas (nombre, tiempo_preparacion, tiempo_coccion, id_cocinero, id_categoria) VALUES ('Helado de frambuesa', 30, 0, 3, 3);

INSERT INTO pasos (descripcion, id_receta) VALUES ('PASO1', 1);
INSERT INTO pasos (descripcion, id_receta) VALUES ('PASO2', 1);
INSERT INTO pasos (descripcion, id_receta) VALUES ('PASO3', 1);
INSERT INTO pasos (descripcion, id_receta) VALUES ('PASO1', 2);
INSERT INTO pasos (descripcion, id_receta) VALUES ('PASO2', 2);
INSERT INTO pasos (descripcion, id_receta) VALUES ('PASO3', 2);
INSERT INTO pasos (descripcion, id_receta) VALUES ('PASO1', 3);
INSERT INTO pasos (descripcion, id_receta) VALUES ('PASO2', 3);
INSERT INTO pasos (descripcion, id_receta) VALUES ('PASO3', 3);

INSERT INTO ingredientes (nombre) VALUES ('Patatas');
INSERT INTO ingredientes (nombre) VALUES ('Huevos');
INSERT INTO ingredientes (nombre) VALUES ('Pasta macarrones');
INSERT INTO ingredientes (nombre) VALUES ('Salsa tomate');
INSERT INTO ingredientes (nombre) VALUES ('Frambuesa');

INSERT INTO utiliza VALUES (1, 1, 3);
INSERT INTO utiliza VALUES (1, 2, 3);
INSERT INTO utiliza VALUES (2, 1, 2);
INSERT INTO utiliza VALUES (2, 2, 2);
INSERT INTO utiliza VALUES (3, 1, 20);

UPDATE cocineros SET nombre = "Sergio Gallego Gudiño" WHERE id=1;
UPDATE ingredientes SET nombre = 'Salsa de tomate' WHERE id=4;
UPDATE pasos SET descripcion = 'Dale la vuelta a la tortilla' WHERE orden = 3 and id_receta = 1;

DELETE FROM cocineros WHERE id=3;
DELETE FROM utiliza WHERE id_ingrediente = 1 and id_receta = 1;

SELECT * FROM cocineros;
SELECT * FROM pasos;
SELECT * FROM utiliza;
