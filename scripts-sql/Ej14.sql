create database red_social;
use red_social;
create table contactos (
	id int auto_increment, 
    nombre varchar(20),
    comentario varchar(400),
    primary key(id)
);
create table usuarios (
	id int auto_increment, 
    contraseña varchar(20),
    nombre varchar(20),
    apellidos varchar(20),
    foto varchar(400),
    email varchar(60),
    telefono varchar(60),
	esCelebridad boolean,
    id_contactos int, 
    primary key(id),	
    FOREIGN KEY (id_contactos) references contactos(id) on delete cascade on update cascade
);
create table bloqueados (
	id int auto_increment, 
    id_usuario int, 
    primary key(id),
	FOREIGN KEY (id_usuario) references usuarios(id) on delete cascade on update cascade
);
create table grupos (
	id int auto_increment, 
    nombre varchar(20),
    foto varchar(20),
    primary key(id)
);
create table tiene_cg (
	id_contactos int, 
    id_grupos int, 
    primary key(id_contactos,id_grupos),
    FOREIGN KEY (id_contactos) references contactos(id) on delete cascade on update cascade,
    FOREIGN KEY (id_grupos) references grupos(id) on delete cascade on update cascade
);

insert into contactos (nombre, comentario) values ('Dianne', 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.');
insert into contactos (nombre, comentario) values ('Laird', 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.');
insert into contactos (nombre, comentario) values ('Maude', 'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.');
insert into contactos (nombre, comentario) values ('Parsifal', 'In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.');
insert into contactos (nombre, comentario) values ('Malvina', 'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.');

insert into usuarios (contraseña, nombre, apellidos, foto, email, telefono, esCelebridad, id_contactos) values ('zA0=GvlJIUfo', 'Erl', 'Casa', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 'ecasa0@abc.net.au', '712-368-3258', true, 1);
insert into usuarios (contraseña, nombre, apellidos, foto, email, telefono, esCelebridad, id_contactos) values ('nG6(''0|mfWUl7/', 'Anabal', 'Tackett', 'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'atackett1@cloudflare.com', '708-730-8784', false, 2);
insert into usuarios (contraseña, nombre, apellidos, foto, email, telefono, esCelebridad, id_contactos) values ('hM5<_3=,&N', 'Jacques', 'Oldroyde', 'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.', 'joldroyde2@dell.com', '550-169-3191', false, 3);
insert into usuarios (contraseña, nombre, apellidos, foto, email, telefono, esCelebridad, id_contactos) values ('jD9~W)MFOG''', 'Crystal', 'Harses', 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 'charses3@amazon.co.uk', '865-877-4138', false, 4);
insert into usuarios (contraseña, nombre, apellidos, foto, email, telefono, esCelebridad, id_contactos) values ('iV3{iciy+OFn~O3', 'Dyanne', 'McGrale', 'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque.', 'dmcgrale4@mediafire.com', '742-976-9614', true, 5);

insert into bloqueados(id_usuario) values(1);
insert into bloqueados(id_usuario) values(3);
insert into bloqueados(id_usuario) values(5);

insert into grupos(nombre, foto) values('Clase', 'foto1');
insert into grupos(nombre, foto) values('Trabajo', 'foto2');
insert into grupos(nombre, foto) values('Familia', 'foto3');

insert into tiene_cg values(1, 1);
insert into tiene_cg values(2, 1);
insert into tiene_cg values(3, 1);
insert into tiene_cg values(4, 2);
insert into tiene_cg values(5, 3);

update contactos set nombre = 'Malvinas' where id = 3;
update usuarios set nombre = 'Manolo' where id = 2;
update grupos set nombre = 'Clases Matematicas' where id = 1;
update bloqueados set id_usuario = 2 where id = 1;

delete from usuarios where id = 5;
delete from bloqueados where id = '3';
delete from tiene_cg where id_contactos = 3 and id_grupos = 1;

select * from usuarios;
select * from grupos;
select * from tiene_cg;
