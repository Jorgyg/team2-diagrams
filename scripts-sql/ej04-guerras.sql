drop database guerras;
create database guerras;
use guerras;
create table guerras (
	id int auto_increment,
    nombre int,
    año_inicio date,
    año_final date,
    primary key(id)
);
create table bandos (
	id int auto_increment,
    nombre int,
    vencedor varchar(20),
    id_guerra int,
    primary key(id),
	FOREIGN KEY (id_guerra) references guerras(id) on delete cascade on update cascade
);
create table paises (
	id int auto_increment,
    nombre int,
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
    nombre int,
    inicio_indep date,
    fin_indep date,
    id_pais int,
    primary key(id),
    FOREIGN KEY (id_pais) references paises(id) on delete cascade on update cascade
);