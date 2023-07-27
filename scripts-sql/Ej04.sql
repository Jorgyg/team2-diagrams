create database guerras;
use guerras;
create table guerras (
	id int auto_increment,
    nombre varchar(100),
    año_inicio date,
    año_final date,
    primary key(id)
);
create table bandos (
	id int auto_increment,
    nombre varchar(100),
    vencedor varchar(20),
    id_guerra int,
    primary key(id),
	FOREIGN KEY (id_guerra) references guerras(id) on delete cascade on update cascade
);
create table paises (
	id int auto_increment,
    nombre varchar(100),
    primary key(id)
);
create table participan (
	id_bando int,
    id_pais int,
	FOREIGN KEY (id_bando) references bandos(id) on delete cascade on update cascade,
	FOREIGN KEY (id_pais) references paises(id) on delete cascade on update cascade
);
create table periodos_independientes (
	id int auto_increment,
    nombre varchar(100),
    inicio_indep date,
    fin_indep date,
    id_pais int,
    primary key(id),
    FOREIGN KEY (id_pais) references paises(id) on delete cascade on update cascade
);

INSERT INTO guerras (nombre, año_inicio, año_final) VALUES ('Guerra del acantilado', '1987-04-05','1989-06-07');
INSERT INTO guerras (nombre, año_inicio, año_final) VALUES ('Guerra del Norte', '1870-02-03','1880-06-07');
INSERT INTO guerras (nombre, año_inicio, año_final) VALUES ('Guerra de la Montaña', '1890-02-03','1900-06-07');

INSERT INTO bandos (nombre, vencedor, id_guerra) VALUES ('Elegidos', 'Rusia', 1);
INSERT INTO bandos (nombre, vencedor, id_guerra) VALUES ('MantaKana', 'India', 3);

INSERT INTO paises (nombre) VALUES ('Rusia');
INSERT INTO paises (nombre) VALUES ('Japon');
INSERT INTO paises (nombre) VALUES ('India');

INSERT INTO participan VALUES (1, 1);
INSERT INTO participan VALUES (1, 2);
INSERT INTO participan VALUES (2, 2);

INSERT INTO periodos_independientes(nombre, inicio_indep, fin_indep, id_pais) VALUES ('periodo1', '2002-02-02', '2002-03-04', 1);
INSERT INTO periodos_independientes(nombre, inicio_indep, fin_indep, id_pais) VALUES ('periodo2', '2002-02-02', '2002-03-04', 2);
INSERT INTO periodos_independientes(nombre, inicio_indep, fin_indep, id_pais) VALUES ('periodo3', '2002-02-02', '2002-03-04', 3);

UPDATE guerras SET nombre = 'Guerra del Sud' WHERE id=2;
UPDATE bandos SET nombre= 'Seleccionados' WHERE id=1;
UPDATE paises SET nombre= 'Indiana' WHERE id=3;

DELETE FROM participan WHERE id_bando = 1 AND id_pais = 1;
