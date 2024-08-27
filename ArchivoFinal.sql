CREATE DATABASE proyecto_base_datos

use proyecto_base_datos;
--2)Esquema de base de datos
CREATE TABLE Usuarios(
    UsuarioID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Nombre VARCHAR(250),
    Apellido VARCHAR(250),
    Email VARCHAR(250) UNIQUE,
    Clave VARCHAR(250),
    Tipo_usuario ENUM("Cliente","Administrador")
);
--UsuarioID tiene un INT tipo de dato de numeros, AUTO_INCREMENT que hara que los numeros vayan.
--aunmentando despues del numero anterior, que sea una llave primaria y que no sea vacia.
--Nombre,Apellido,Email y Clave son de tipo VARCHAR que nos permite colocar letras,numeros y simbolos.
--Email tiene un UNIQUE que es una restriccion que asegura que las columnas tengan un valor unico.
--El ENUM es para que tipo_usuario no pueda guardar nada que no sea cliente o administrador.

INSERT INTO Usuarios (Nombre,Apellido,Email,Clave,Tipo_usuario) VALUES
("Daniel","Delgado","daniel@correo.com","clave1","cliente"),
("Keylor","Villalobos","keylor@correo.com","clave2","Administrador"),
("Erick", "Herrera","erick@correo.com","clave3","cliente");

SELECT * FROM Usuarios;

--------------------------------------------------------------------------------------------------------------

CREATE TABLE Cuenta(
    CuentaID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Telefono VARCHAR(250),
    Direccion VARCHAR(250),
    Pais VARCHAR(250)
);

INSERT INTO Cuenta(Telefono,Direccion,Pais) VALUES
("+506-6059-7129","20mts oeste de walmart de san jose centro","Costa Rica"),
("+506-7055-8528","100mts norte del centro comercial multi centro en desamparados","Costa Rica"),
("+506-8039-3127","80mts oeste del centro comercial san pedro cerca de la oficina de correos","Costa Rica");

SELECT * FROM Cuenta;

------------------------------------------------------------------------------------------------------------------

CREATE TABLE Hoteles(
    HotelID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Nombre VARCHAR(250),
    Direccion VARCHAR(250),
    Ciudad VARCHAR(250),
    Telefono VARCHAR(250)
);

INSERT INTO Hoteles(Nombre,Direccion,Ciudad,Telefono) VALUES
("Hotel Canarias","20mts oeste de parque de la paz","San jose","+506-3159-7129"),
("Hotel Escalante","Ubicado en el centro comercial multiflores","Heredia","+506-4255-8528"),
("Hotel san martin","Ubicados en el centro comercial plaza real","Alajuela","+506-8539-3127");

SELECT * FROM Hoteles;

---------------------------------------------------------------------------------------------------------------

    -- Crear la tabla Transaccion
CREATE TABLE Transaccion (
    Numero_transaccion INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Fecha DATETIME NOT NULL,
    Metodo_Pago VARCHAR(50) NOT NULL,
    Coste INT NOT NULL
);
-- Insertar datos en la tabla Reservas
INSERT INTO Transaccion (Numero_transaccion, Fecha, Metodo_Pago, Coste)
VALUES 
(1, '2024-08-23 14:30:00', 'Tarjeta de Crédito', 150),
(2, '2024-08-24 09:15:00', 'Transferencia Bancaria', 200),
(3, '2024-08-24 16:45:00', 'Efectivo', 100);

SELECT * FROM Transaccion;

------------------------------------------------------------------------------------------------------------

-- Crear la tabla Reservas
CREATE TABLE Reservas (
    Reserva_id INT PRIMARY KEY AUTO_INCREMENT,
    Llegada DATE NOT NULL,
    Salida DATE NOT NULL,
    Numero_huespedes INT NOT NULL,
    Numero_transaccion INT,
    Estado BOOLEAN DEFAULT 0,
    UsuarioID INT,
    ID_Habitacion INT,
    FOREIGN KEY (Numero_transaccion) REFERENCES Transaccion(Numero_transaccion),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (ID_Habitacion) REFERENCES Habitaciones(ID_Habitacion)
);

-- Insertar datos en la tabla Reservas
INSERT INTO Reservas (Llegada, Salida, Numero_huespedes,UsuarioID,ID_Habitacion)
VALUES 
('2024-08-24', '2024-08-26', 2,3,1),
('2024-08-25', '2024-08-30', 4,2,2),
('2024-08-26', '2024-08-27', 3,1,3);

SELECT * FROM Reservas;

---------------------------------------------------------------------------------------------------------------

-- Crear la tabla Habitaciones
CREATE TABLE Habitaciones (
    ID_Habitacion INT PRIMARY KEY AUTO_INCREMENT,
    Precio DECIMAL(10, 2) NOT NULL,
    Capacidad INT NOT NULL,
    Disponibilidad BOOLEAN NOT NULL
);

-- Insertar datos en la tabla Habitaciones
INSERT INTO Habitaciones (Precio, Capacidad, Disponibilidad)
VALUES 
(75.00, 2, TRUE),
(120.00, 4, TRUE),
(90.00, 3, FALSE);

SELECT * FROM Habitaciones;

---------------------------------------------------------------------------------------------------------------

--4)Stored Procedures:

----------------

--Solicitar una reserva

DELIMITER //
CREATE PROCEDURE SolicitarReserva(
    IN HabitacionID INT,
    IN MyUsuarioID INT,
    IN MyNumero_huespedes INT,
    IN FechaLlegada DATE,
    IN FechaSalida DATE
)
BEGIN
    INSERT INTO Reservas(ID_Habitacion,UsuarioID,Numero_huespedes,Llegada,Salida)
    VALUES (HabitacionID,MyUsuarioID,MyNumero_huespedes,FechaLlegada,FechaSalida);
END //
DELIMITER;

CALL SolicitarReserva(1,1,6,"2024-08-27","2024-09-10")

SELECT * FROM reservas

--Cancelar una Reserva
------------

DELIMITER //
CREATE PROCEDURE CancelarReserva(
    IN MyUsuarioID INT
)
BEGIN
    DELETE FROM Reservas WHERE UsuarioID = MyUsuarioID;
END //
DELIMITER;
------
CALL `CancelarReserva`(1)

SELECT * FROM reservas;

-----------------------------------------------------------------------------------------------------------

--5)Vistas
CREATE View Nuevas_reservas AS
SELECT Llegada, Salida, Numero_huespedes, Numero_transaccion FROM Reservas
WHERE DATE(Llegada) = CURRENT_DATE;   
SELECT * FROM nuevas_reservas;

---------------------------------------------------------------------------------------------------------

--6)Trigger:

DELIMITER //
CREATE TRIGGER actualizar_reserva
BEFORE INSERT ON Reservas
FOR EACH ROW
BEGIN
    SET NEW.estado = 1;
END; //
DELIMITER //
DROP Trigger actualizar_reserva;

-------------------------------------------------------------------------------------------------------

--7)Indices
CREATE INDEX Nombres on Hoteles(Nombre);
ALTER Table Hoteles ADD INDEX Hoteles(Direccion);
CREATE INDEX Telefonos on Hoteles(Telefono);

SHOW INDEX FROM hoteles;


--8)Consultas SQL (Queries):
----------------

--C)Consulta para buscar hoteles por nombre.
SELECT Nombre FROM hoteles ;

--D)Consulta para buscar hoteles cuya ubicación comienza con un texto específico.
SELECT * FROM hoteles WHERE `Ciudad` LIKE "A%";

--E)Consulta para buscar hoteles cuya ubicación termina con un texto específico.
SELECT * FROM hoteles WHERE `Ciudad` LIKE "%E";
