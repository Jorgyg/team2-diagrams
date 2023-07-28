DROP DATABASE IF EXISTS accidentes_geograficos;
CREATE DATABASE accidentes_geograficos;
USE accidentes_geograficos;

CREATE TABLE Paises (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    extension INT,
    poblacion INT
);

CREATE TABLE Ciudades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    extension INT,
    poblacion INT,
    id_pais INT,
	FOREIGN KEY (id_pais) REFERENCES Paises(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE Accidentes_geograficos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    posicion_h FLOAT,
    posicion_v FLOAT
);

CREATE TABLE EsEn (
    id_acc_geo INT,
    id_pais INT,
    PRIMARY KEY (id_acc_geo, id_pais),
    FOREIGN KEY (id_acc_geo) REFERENCES Accidentes_geograficos(id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_pais) REFERENCES Paises(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Rios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    longitud FLOAT,
    id_acc_geo INT,
    FOREIGN KEY (id_acc_geo) REFERENCES Accidentes_geograficos(id)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PasaPor (
    id_ciudad INT,
    id_rio INT,
    PRIMARY KEY (id_ciudad, id_rio),
    FOREIGN KEY (id_ciudad) REFERENCES Ciudades(id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_rio) REFERENCES Rios(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Lagos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    extension FLOAT,
    id_acc_geo INT,
    FOREIGN KEY (id_acc_geo) REFERENCES Accidentes_geograficos(id)
     ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Montañas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    altura FLOAT,
    id_acc_geo INT,
    FOREIGN KEY (id_acc_geo) REFERENCES Accidentes_geograficos(id)
     ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO Paises (nombre, extension, poblacion) VALUES ('País X', 10000, 50000000);
INSERT INTO Paises (nombre, extension, poblacion) VALUES ('País Y', 8000, 40000000);

INSERT INTO Ciudades (nombre, extension, poblacion, id_pais) VALUES ('Ciudad A', 500, 1000000, 2);
INSERT INTO Ciudades (nombre, extension, poblacion, id_pais) VALUES ('Ciudad B', 300, 800000, 1);

INSERT INTO Accidentes_geograficos (nombre, posicion_h, posicion_v) VALUES ('Accidente 1', 40.5, 70.2);
INSERT INTO Accidentes_geograficos (nombre, posicion_h, posicion_v) VALUES ('Accidente 2', 35.2, -80.1);
INSERT INTO Accidentes_geograficos (nombre, posicion_h, posicion_v) VALUES ('Accidente 3', 38.7, 65.8);
INSERT INTO Accidentes_geograficos (nombre, posicion_h, posicion_v) VALUES ('Accidente 4', 900.7, 200);

INSERT INTO Rios(id_acc_geo, longitud) VALUES (1, 300);
INSERT INTO Montañas(id_acc_geo, altura) VALUES (2, 250);
INSERT INTO Lagos(id_acc_geo, extension) VALUES (3, 20);
INSERT INTO Rios(id_acc_geo, longitud) VALUES (4, 1000);

INSERT INTO PasaPor(id_ciudad, id_rio) VALUES (1,2);
INSERT INTO PasaPor(id_ciudad, id_rio) VALUES (2,1);

DELETE FROM Accidentes_geograficos WHERE id = 1;
