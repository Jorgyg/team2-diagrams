create database geografia;
use geografia;
create table comunidades (
	id int,
    poblacion int,
    superficie int,
    primary key(id)
);
create table provincias (
	codigo_postal int,
    nombre varchar(20),    
	poblacion int,
    superficie int,
    id_comunidad int,
    primary key(codigo_postal),
	FOREIGN KEY (id_comunidad) references comunidades(id) on delete cascade on update cascade
);
create table localidades (
	id int auto_increment,
    nombre varchar(20),    
	poblacion int,
    codigo_provincia int,
    primary key(id),
	FOREIGN KEY (codigo_provincia) references provincias(codigo_postal) on delete cascade on update cascade
);
create table es_capital_CA (
	id_ca int,
    id_localidad int,
    es_cap boolean,
	FOREIGN KEY (id_ca) references comunidades(id) on delete cascade on update cascade,
	FOREIGN KEY (id_localidad) references localidades(id) on delete cascade on update cascade
);
create table es_capital (
	id_localidad int,
    codigo_provincia int,
	FOREIGN KEY (id_localidad) references localidades(id) on delete cascade on update cascade,
	FOREIGN KEY (codigo_provincia) references provincias(codigo_postal) on delete cascade on update cascade
);




