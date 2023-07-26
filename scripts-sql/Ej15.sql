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
