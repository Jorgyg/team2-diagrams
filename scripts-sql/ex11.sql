DROP DATABASE IF EXISTS accidentes_geograficos;
CREATE DATABASE accidentes_geograficos;
USE accidentes_geograficos;

CREATE TABLE Ciudades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    extension INT,
    poblacion INT
);

CREATE TABLE Paises (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    extension INT,
    poblacion INT,
    id_ciudad INT,
    FOREIGN KEY (id_ciudad) REFERENCES Ciudades(id)
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
    FOREIGN KEY (id_acc_geo) REFERENCES Accidentes_geograficos(id),
    FOREIGN KEY (id_pais) REFERENCES Paises(id)
);

CREATE TABLE Rios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    longitud FLOAT
);

CREATE TABLE PasaPor (
    id_ciudad INT,
    id_rio INT,
    PRIMARY KEY (id_ciudad, id_rio),
    FOREIGN KEY (id_ciudad) REFERENCES Ciudades(id),
    FOREIGN KEY (id_rio) REFERENCES Rios(id)
);

CREATE TABLE Lagos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    extension FLOAT
);

CREATE TABLE Montañas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    altura FLOAT
);
