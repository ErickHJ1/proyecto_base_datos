
CREATE DATABASE Reservas
DEFAULT CHARACTER SET = 'utf8mb4';
USE pagina_hotel;
    -- Crear la tabla Transaccion
CREATE TABLE Transaccion (
    Numero_transaccion INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Fecha DATETIME NOT NULL,
    Metodo_Pago VARCHAR(50) NOT NULL,
    Coste INT NOT NULL
);

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

-- Crear la tabla Habitaciones
CREATE TABLE Habitaciones (
    ID_Habitacion INT PRIMARY KEY AUTO_INCREMENT,
    Precio DECIMAL(10, 2) NOT NULL,
    Capacidad INT NOT NULL,
    Disponibilidad BOOLEAN NOT NULL);

-- Insertar datos en la tabla Reservas
INSERT INTO Transaccion (Numero_transaccion, Fecha, Metodo_Pago, Coste)
VALUES 
(1, '2024-08-23 14:30:00', 'Tarjeta de Crédito', 150),
(2, '2024-08-24 09:15:00', 'Transferencia Bancaria', 200),
(3, '2024-08-24 16:45:00', 'Efectivo', 100);

-- Insertar datos en la tabla Habitaciones
INSERT INTO Habitaciones (Precio, Capacidad, Disponibilidad)
VALUES 
(75.00, 2, TRUE),
(120.00, 4, TRUE),
(90.00, 3, FALSE);

-- Insertar datos en la tabla Reservas
INSERT INTO Reservas (Llegada, Salida, Numero_huespedes,UsuarioID,ID_Habitacion)
VALUES 
('2024-07-24', '2024-08-26', 2,3,1),
('2024-08-25', '2024-08-30', 4,2,2),
('2024-08-26', '2024-08-27', 3,1,3);


SELECT * FROM Nuevas_reservas;
DROP VIEW Nuevas_reservas;
DROP TABLE reservas




DROP TABLE reservas;
DROP Table habitaciones;
DROP Table transaccion