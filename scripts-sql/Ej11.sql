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
