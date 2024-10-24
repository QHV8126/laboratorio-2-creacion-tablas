DROP TABLE IF EXISTS CitasServicios;
DROP TABLE IF EXISTS Citas;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Peluqueros;
DROP TABLE IF EXISTS Servicios;

CREATE OR REPLACE TABLE Servicios(
    id INT PRIMARY AUTO_INCREMENT,
    descripción VARCHAR(100) NOT NULL,
    duración INT NOT NULL,
    precio FLOAT NOT NULL
);

CREATE TABLE Peluqueros(
    id INT PRIMARY AUTO_INCREMENT,
    mail VARCHAR(100) NOT NULL,
    contraseña VARCHAR(100) NOT NULL UNIQUE,
    CHECK(CHAR_LENGHT(contraseña) => 8)
);

CREATE TABLE Clientes(
    id INT PRIMARY AUTO_INCREMENT,
    mail VARCHAR(100) UNIQUE NOT NULL,
    contraseña VARCHAR(100) NOT NULL,
    UNIQUE(mail)
);

CREATE TABLE Citas(
    id INT PRIMARY AUTO_INCREMENT,
    fechaHora DATETIME NOT NULL,
    duración INT NOT NULL,
    fechaPetición DATETIME NOT NULL,
    fechaConfirmación DATETIME,
    estado ENUM("Confirmado", "Por confirmar"),
    asistencia BOOL DEFAULT TRUE,
    idCliente INT NOT NULL,
    idPeluquero INT NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Clientes(id),
    FOREIGN KEY (idPeluquero) REFERENCES Peluqueros(id)
);

CREATE TABLE CitasServicios(
    id INT PRIMARY AUTO_INCREMENT,
    idCita INT NOT NULL,
    idServicio INT NOT NULL,
    FOREIGN KEY (idClita) REFERENCES Citas(id),
    FOREIGN KEY (idServicio) REFERENCES Servicios(id),
    UNIQUE(idCita, idServicio)
);