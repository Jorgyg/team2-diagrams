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
    on update cascade,
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