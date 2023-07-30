CREATE DATABASE menu_diario;
USE menu_diario;
CREATE TABLE Menus (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    num_personas INT,
    platos_totales INT,
    dia_temperatura INT
);

CREATE TABLE Platos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    num_plato INT,
    nombre VARCHAR(60),
    descripcion TEXT
);

CREATE TABLE Tiene (
    id_menus INT,
    id_platos INT,
    PRIMARY KEY (id_menus, id_platos),
    FOREIGN KEY (id_menus) REFERENCES Menus(id)
    on delete cascade,
    FOREIGN KEY (id_platos) REFERENCES Platos(id)
    on delete cascade
);

INSERT INTO Menus (fecha, num_personas, platos_totales, dia_temperatura) VALUES
('2023-07-30', 4, 3, 1),
('2023-07-31', 2, 2, 2),
('2023-08-01', 5, 4, 3),
('2023-08-02', 3, 3, 1),
('2023-08-03', 6, 5, 2);

INSERT INTO Platos (num_plato, nombre, descripcion) VALUES
(1, 'Spaghetti Carbonara', 'Pasta italiana con salsa de huevo, queso, panceta y pimienta negra.'),
(2, 'Pollo al Curry', 'Pollo cocinado en una mezcla de especias y leche de coco, típico de la cocina india.'),
(3, 'Ensalada César', 'Ensalada con lechuga romana, pollo, crutones, queso parmesano y aderezo César.'),
(4, 'Sushi Variado', 'Variedad de sushi que incluye nigiri, maki y sashimi.'),
(5, 'Tacos de Carnitas', 'Tacos mexicanos con cerdo cocido lentamente y aderezos al gusto.');

INSERT INTO Tiene (id_menus, id_platos) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 2),
(2, 4),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(4, 3),
(4, 4),
(4, 5),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5);

UPDATE Menus
SET num_personas = 8, platos_totales = 6
WHERE id = 3;

UPDATE Platos
SET nombre = 'Salmón Teriyaki', descripcion = 'Salmón glaseado con salsa teriyaki y acompañado de arroz y verduras al wok.'
WHERE id = 4;
