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

INSERT INTO horarios (dia_semana, hora) VALUES ('Lunes', 8);
INSERT INTO horarios (dia_semana, hora) VALUES ('Martes', 10);
INSERT INTO horarios (dia_semana, hora) VALUES ('Miércoles', 12);
INSERT INTO horarios (dia_semana, hora) VALUES ('Jueves', 14);
INSERT INTO horarios (dia_semana, hora) VALUES ('Viernes', 16);

INSERT INTO aulas (nombre, numero, metros, id_horario) VALUES ('Aula A', 101, 50, 1);
INSERT INTO aulas (nombre, numero, metros, id_horario) VALUES ('Aula B', 102, 60, 2);
INSERT INTO aulas (nombre, numero, metros, id_horario) VALUES ('Aula C', 103, 55, 3);
INSERT INTO aulas (nombre, numero, metros, id_horario) VALUES ('Aula D', 104, 45, 4);
INSERT INTO aulas (nombre, numero, metros, id_horario) VALUES ('Aula E', 105, 70, 5);

INSERT INTO ciclos (grado, nombre) VALUES ('Grado 1', 'Ciclo 1');
INSERT INTO ciclos (grado, nombre) VALUES ('Grado 2', 'Ciclo 2');
INSERT INTO ciclos (grado, nombre) VALUES ('Grado 3', 'Ciclo 3');
INSERT INTO ciclos (grado, nombre) VALUES ('Grado 4', 'Ciclo 4');
INSERT INTO ciclos (grado, nombre) VALUES ('Grado 5', 'Ciclo 5');

INSERT INTO profesores (numero_ss, ano_antiguedad, dni, nombre, telefono, direccion) VALUES (123456789, '2020-01-01', '12345678A', 'Juan Pérez', 987654321, 'Calle Principal 123');
INSERT INTO profesores (numero_ss, ano_antiguedad, dni, nombre, telefono, direccion) VALUES (987654321, '2015-05-15', '98765432B', 'María Gómez', 654321987, 'Avenida Secundaria 456');
INSERT INTO profesores (numero_ss, ano_antiguedad, dni, nombre, telefono, direccion) VALUES (456789123, '2018-10-20', '45678912C', 'Carlos Ramírez', 789456123, 'Plaza Docente 789');
INSERT INTO profesores (numero_ss, ano_antiguedad, dni, nombre, telefono, direccion) VALUES (789456123, '2019-03-25', '78945612D', 'Laura Torres', 123456789, 'Paseo Profesor 101');
INSERT INTO profesores (numero_ss, ano_antiguedad, dni, nombre, telefono, direccion) VALUES (654321987, '2017-07-10', '65432198E', 'Pedro Martínez', 456789123, 'Carrera Maestro 202');

INSERT INTO asignaturas (codigo_europeo, nombre, curso, id_profesor, anos_impartido) VALUES (111, 'Matemáticas', 'Primero', 1, 3);
INSERT INTO asignaturas (codigo_europeo, nombre, curso, id_profesor, anos_impartido) VALUES (222, 'Lengua Española', 'Segundo', 2, 2);
INSERT INTO asignaturas (codigo_europeo, nombre, curso, id_profesor, anos_impartido) VALUES (333, 'Ciencias Naturales', 'Tercero', 3, 1);
INSERT INTO asignaturas (codigo_europeo, nombre, curso, id_profesor, anos_impartido) VALUES (444, 'Historia', 'Cuarto', 4, 4);
INSERT INTO asignaturas (codigo_europeo, nombre, curso, id_profesor, anos_impartido) VALUES (555, 'Inglés', 'Quinto', 5, 5);

INSERT INTO imparte_ciclos (id_profesor, id_ciclos, anos_impartidos) VALUES (1, 1, 3);
INSERT INTO imparte_ciclos (id_profesor, id_ciclos, anos_impartidos) VALUES (2, 2, 2);
INSERT INTO imparte_ciclos (id_profesor, id_ciclos, anos_impartidos) VALUES (3, 3, 1);
INSERT INTO imparte_ciclos (id_profesor, id_ciclos, anos_impartidos) VALUES (4, 4, 4);
INSERT INTO imparte_ciclos (id_profesor, id_ciclos, anos_impartidos) VALUES (5, 5, 5);

INSERT INTO imparte_asignaturas (id_profesor, id_asignatura, anos_impartidos) VALUES (1, 1, 3);
INSERT INTO imparte_asignaturas (id_profesor, id_asignatura, anos_impartidos) VALUES (2, 2, 2);
INSERT INTO imparte_asignaturas (id_profesor, id_asignatura, anos_impartidos) VALUES (3, 3, 1);
INSERT INTO imparte_asignaturas (id_profesor, id_asignatura, anos_impartidos) VALUES (4, 4, 4);
INSERT INTO imparte_asignaturas (id_profesor, id_asignatura, anos_impartidos) VALUES (5, 5, 5);

INSERT INTO ocupa (codigo_asignatura, id_horario) VALUES (1, 1);
INSERT INTO ocupa (codigo_asignatura, id_horario) VALUES (2, 2);
INSERT INTO ocupa (codigo_asignatura, id_horario) VALUES (3, 3);
INSERT INTO ocupa (codigo_asignatura, id_horario) VALUES (4, 4);
INSERT INTO ocupa (codigo_asignatura, id_horario) VALUES (5, 5);

INSERT INTO se_imparte (codigo_asignatura, codigo_ciclos) VALUES (1, 1);
INSERT INTO se_imparte (codigo_asignatura, codigo_ciclos) VALUES (2, 2);
INSERT INTO se_imparte (codigo_asignatura, codigo_ciclos) VALUES (3, 3);
INSERT INTO se_imparte (codigo_asignatura, codigo_ciclos) VALUES (4, 4);
INSERT INTO se_imparte (codigo_asignatura, codigo_ciclos) VALUES (5, 5);

update horarios set hora = 14 where id = 2;
update aulas set metros = 200 where codigo_aula = 3;
update imparte_ciclos set anos_impartidos = 2 where id_profesor = 3 and id_ciclos = 4;

delete from ocupa where codigo_asignatura = 3 and id_horario = 3;
delete from se_imparte where codigo_asignatura = 3 and codigo_ciclos = 3;
delete from profesores where codigo_profesor = 1;