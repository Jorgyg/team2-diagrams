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

insert into comunidades (poblacion,superficie) values 
(130000,60),
(200000,50),
(300000,73),
(6000,24),
(100500,66);
insert into provincias (codigo_postal,nombre,poblacion,superficie,id_comunidad) values 
(4000,'tarragona',132000,800,1),
(2000,'almeria',66000,850,3),
(0800,'madrid',100000,1000,2),
(1500,'a coruña',77000,900,4),
(1000,'valladolid',71000,800,5);
insert into localidades (nombre,poblacion,codigo_provincia) values 
('tarragona',132000,1),
('almeria',66000,2),
('madrid',100000,3),
('a coruña',77000,4),
('valladolid',71000,5);
insert into es_capital (id_localidad,codigo_provincia) values 
(1,4000),
(2,800),
(3,2000),
(4,1500);
insert into es_capital_CA (id_ca,id_localidad,es_cap) values 
(1,1,true),
(2,2,false),
(3,3,false),
(4,4,true);


