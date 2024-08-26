
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
    FOREIGN KEY (Numero_transaccion) REFERENCES Transaccion(Numero_transaccion)
    Numero_transaccion DEFAULT 10,
    Estado BOOLEAN DEFAULT 0,
    UsuarioID INT,
    ID_Habitacion INT,
    FOREIGN KEY (Numero_transaccion) REFERENCES Transaccion(Numero_transaccion),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (ID_Habitacion) REFERENCES Habitaciones(ID_Habitacion)
);

-- Crear la tabla Habitaciones
CREATE TABLE Habitaciones (
    ID_Habiitacion INT PRIMARY KEY AUTO_INCREMENT,
    Precio DECIMAL(10, 2) NOT NULL,
    Capacidad INT NOT NULL,
    Disponibilidad BOOLEAN NOT NULL
@@ -43,14 +47,8 @@ VALUES
(90.00, 3, FALSE);

-- Insertar datos en la tabla Reservas
INSERT INTO Reservas (Llegada, Salida, Numero_huespedes, Numero_transaccion)
VALUES 
('2024-08-24', '2024-08-26', 2, 1),
('2024-08-26', '2024-08-30', 4, 2),
('2024-08-30', '2024-09-02', 3, 3);

CREATE View [Nuevas_reservas] AS
SELECT Precio,Capacidad,Disponibilidad FROM Habitaciones
WHERE Precio = 90.00

SELECT * FROM [Nuevas_reservas];