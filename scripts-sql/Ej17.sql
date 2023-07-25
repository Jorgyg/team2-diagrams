CREATE DATABASE horario_escolar;

USE horario_escolar;

CREATE TABLE horarios(
	id int auto_increment PRIMARY KEY,
    dia_semana varchar(60),
    hora int
);

CREATE TABLE aulas(
	codigo_aula int auto_increment PRIMARY KEY,
    nombre varchar(60),
    numero int,
    metros int,
    id_horario int,
    FOREIGN KEY(id_horario) REFERENCES horarios(id)
    on update cascade
);

CREATE TABLE ciclos(
	codigo_ciclos int auto_increment PRIMARY KEY,
    grado varchar(60),
	nombre varchar(60)
);

CREATE TABLE profesores(
	codigo_profesor int auto_increment PRIMARY KEY,
    numero_ss int,
    ano_antiguedad date,
    dni varchar(9),
    nombre varchar(60),
    telefono int,
    direccion varchar(100)
);

CREATE TABLE asignaturas(
	codigo_asignatura int auto_increment PRIMARY KEY,
    codigo_europeo int,
    nombre varchar(60),
    curso varchar(60),
    id_profesor int,
    anos_impartido int,
    FOREIGN KEY(id_profesor) REFERENCES profesores(codigo_profesor)
    on update cascade
);

ALTER TABLE asignaturas ADD COLUMN id_asignatura int;
ALTER TABLE asignaturas ADD FOREIGN KEY(id_asignatura) REFERENCES asignaturas(codigo_asignatura) ON UPDATE CASCADE;

CREATE TABLE imparte_ciclos(
	id_profesor int,
    id_ciclos int,
    anos_impartidos int,
    PRIMARY KEY(id_profesor, id_ciclos),
    FOREIGN KEY(id_profesor) REFERENCES profesores(codigo_profesor)
    on update cascade
    on delete cascade,
    FOREIGN KEY(id_ciclos) REFERENCES ciclos(codigo_ciclos)
    on update cascade
    on delete cascade
);

CREATE TABLE imparte_asignaturas(
	id_profesor int,
    id_asignatura int,
    anos_impartidos int,
    PRIMARY KEY(id_profesor, id_asignatura),
    FOREIGN KEY(id_profesor) REFERENCES profesores(codigo_profesor)
    on update cascade
    on delete cascade,
    FOREIGN KEY(id_asignatura) REFERENCES asignaturas(codigo_asignatura)
    on update cascade
    on delete cascade
);

CREATE TABLE ocupa(
	codigo_asignatura int,
    id_horario int,
    PRIMARY KEY(id_horario, codigo_asignatura),
    FOREIGN KEY(codigo_asignatura) REFERENCES asignaturas(codigo_asignatura)
	on update cascade
    on delete cascade,
    FOREIGN KEY(id_horario) REFERENCES horarios(id)
    on update cascade
    on delete cascade
);

CREATE TABLE se_imparte(
	codigo_asignatura int,
    codigo_ciclos int,
    PRIMARY KEY(codigo_asignatura, codigo_ciclos),
    FOREIGN KEY(codigo_asignatura) REFERENCES asignaturas(codigo_asignatura)
    on update cascade
    on delete cascade,
    FOREIGN KEY(codigo_ciclos) REFERENCES ciclos(codigo_ciclos)
    on update cascade
    on delete cascade
);