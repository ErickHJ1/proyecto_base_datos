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
--UsuarioID tiene un INT tipo de dato de numeros, AUTO_INCREMENT que hara que los numeros vayan
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

--La tabla cuenta:
--CuentaID tiene un INT tipo de dato de numeros, AUTO_INCREMENT que hara que los numeros vayan
--aumentando despues del numero anterior, que sea una llave primaria y que no sea vacia.
--Telefono,Direccion y Pais son tipo VARCHAR que nos permite colocar letras,numeros y simbolos.


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

--La tabla Hoteles:
--HotelID tiene un INT tipo de dato de numeros, AUTO_INCREMENT que hara que los numeros vayan
--aumentando despues del numero anterior, que sea una llave primaria y que no sea vacia.
--Nombre,Direccion,Ciudad y Telefono son tipo VARCHAR que nos permite colocar letras,numeros y simbolos.
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

--La tabla Transaccion:
--Numero_transaccion tiene un INT tipo de dato de numeros, AUTO_INCREMENT que hara que los numeros vayan
--aumentando despues del numero anterior, que sea una llave primaria y que no sea vacia.
--Fecha Es del tipo date que nos permitira a la columna extraer una fecha.
--Metodo_Pago es de tipo VARCHAR que nos permite colocar letras,numeros y simbolos.
--Coste tiene un INT tipo de dato de  
numeros.

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

--La tabla Reservas:
--Reserva_id tiene un INT tipo de dato de numeros, AUTO_INCREMENT que hara que los numeros vayan
--aumentando despues del numero anterior, que sea una llave primaria y que no sea vacia.
--Llegada y salida son tipo date que nos permitira a la columna extraer una fecha.
--Numero_huespedes es INT tipo de dato de numeros.
--Estado Es de tipo booleano que recibira un true(1) o un false(0) y que al agregar un dato por defecto sea false(0).
--Numero_transaccion,UsuarioID Y ID_Habitacion serian llaves foraneas que corresponden a las llaves 
--primarias de las respectivas referencias las cuales contienen el nombre de la tabla.

-- Insertar datos en la tabla Reservas
INSERT INTO Reservas (Llegada, Salida, Numero_huespedes,UsuarioID,ID_Habitacion)
VALUES 
('2024-08-24', '2024-08-26', 1,3,1),
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

--La tabla Habitaciones:
--ID_Habitacion tiene un INT tipo de dato de numeros, AUTO_INCREMENT que hara que los numeros vayan
--aumentando despues del numero anterior, que sea una llave primaria y que no sea vacia.
--Precio son tipo DECIMAL que recibe (10,2) que el 10 serian la cantidad de digitos y el 2 la cantidad de digitos
--despues de la coma.
--Capacidad es INT tipo de dato de numeros.
--Disponibilidad Es de tipo booleano que recibira un true(1) o un false(0) y que al agregar un dato por defecto sea false(0).

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

--Este CreateProcedure nos permitira pasarle datos con sus respectivos datos y comience insertando los datos
--que pasaremos por medio del call para agregar una reserva nueva. 

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

CALL SolicitarReserva(2,3,6,"2024-07-28","2024-09-10")

SELECT * FROM reservas



--Cancelar una Reserva

--Este CreateProcedure llamado CancelarReserva nos permitira pasarle datos con sus respectivos datos
--En begin se hara un DELETE de Reservas en el cual se comparen y coincidan el id de habitacion y usuario
------------

DELIMITER //
CREATE PROCEDURE CancelarReserva(
    IN MyUsuarioID INT,
    In MyHabitacionID INT
)
BEGIN
    DELETE FROM Reservas WHERE ID_Habitacion = MyHabitacionID AND UsuarioID = MyUsuarioID;
END //
DELIMITER;
------
CALL `CancelarReserva`(3,1)

SELECT * FROM reservas;

-----------------------------------------------------------------------------------------------------------

--5)Vistas

--La vista llamada Nuevas_reservas Crea una vista que muestra un reporte de las reservas realizadas en el día actual.

--La View Nuevas_reservas tiene como alias un select que tomara las columnas Llegada,Salida
--Numero_huespedes y Numero_transaccion de Reservas donde Date que tomara la columna Llegada y que se 
--compara con la fecha de el dia de hoy
----------------
CREATE View Nuevas_reservas AS
SELECT Llegada, Salida, Numero_huespedes, Numero_transaccion FROM Reservas
WHERE DATE(Llegada) = CURRENT_DATE;   
SELECT * FROM nuevas_reservas;

---------------------------------------------------------------------------------------------------------

--6)Trigger:

--Este trigger tiene como funcion que antes de agregarse una nueva reserva cambiar el estado que estaba en Default
--como False(0) con new lo pasaremos a true(1)

----------------
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

--Estos indices nos permitiran optimizar la busqueda de Los Nombres,Direcciones y Telefonos de los Hoteles.
CREATE INDEX Nombres on Hoteles(Nombre);
ALTER Table Hoteles ADD INDEX Hoteles(Direccion);
CREATE INDEX Telefonos on Hoteles(Telefono);

SHOW INDEX FROM hoteles;


--8)Consultas SQL (Queries):
----------------

--A)Consulta para obtener los hoteles con mayor número de reservas.

--En esta consulta se selecciona La columna del nombre y con el count contaremos las Ids de Reservas con un 
--alias llamado Cant_Reservas de Hoteles el cual usaremos un Inner Join que nos permite unir las columnas con 
--coincidencias entre ellas de habitaciones y Reservas las cuales se agruparan por la HotelID.
-------------------------------
SELECT Nombre,COUNT(`Reservas`.Reserva_id) AS cant_Reservas
FROM Hoteles INNER JOIN Habitaciones ON `Hoteles`.HotelID = `Habitaciones`.ID_Habitacion
INNER JOIN Reservas ON `Habitaciones`.ID_Habitacion = `Reservas`.ID_Habitacion 
GROUP BY HotelID;
SELECT * FROM reservas;

----------------------------------------------------------------

--B)Consulta para contar cuántas habitaciones disponibles hay en un hotel específico en una fecha dada.

--En esta consulta se seleccionan las columnas Nombre y un count que contiene las disponibilidades de las habitaciones
--con un alias Cant_habitaciones de Hoteles, con Inner Join de Habitaciones hacemos que se junten al buscar las coicidencias de HotelID
--y ID_Habitacion, con el Inner Join de Reservas en la ID_Habitacion de Habitaciones y la de Reservas
--donde la disponibilidad sea igual a True(1) y Reservas.Salida sea mayor que la fecha especifica y se agrupe
--por el HotelID
SELECT Nombre,COUNT(`Habitaciones`.disponibilidad) AS cant_habitaciones
FROM Hoteles INNER JOIN Habitaciones ON `Hoteles`.HotelID = `Habitaciones`.ID_Habitacion
INNER JOIN Reservas ON `Habitaciones`.ID_Habitacion = `Reservas`.ID_Habitacion 
WHERE Disponibilidad = TRUE AND Reservas.Salida > "2024-08-31" GROUP BY HotelID;

----------------------------------------------------------------

--C)Consulta para buscar hoteles por nombre.
SELECT Nombre FROM hoteles ;

--D)Consulta para buscar hoteles cuya ubicación comienza con un texto específico.
SELECT * FROM hoteles WHERE `Ciudad` LIKE "A%";

----------------------------------------------------------------

--E)Consulta para buscar hoteles cuya ubicación termina con un texto específico.
SELECT * FROM hoteles WHERE `Ciudad` LIKE "%E";

----------------------------------------------------------------

--Consulta para obtener las reservas de un cliente (por email) realizadas en el mes anterior.

--En esta consulta de seleccionan todas las columnas de Reservas representado con el alias "r" y se 
--utiliza un join entre la tabla Reservas y Usuarios los cuales se combinaran las filas donde coincidan
--ambas tablas donde el Email de la tabla usuarios sea igual al correo deseado y que toma en cuenta
--el mes y año los sean iguales a el mes actual con un intervalo de 1 mes

SELECT r.*
FROM Reservas r
JOIN Usuarios u ON r.UsuarioID = u.UsuarioID
WHERE u.Email = "Erick@correo.com"
  AND MONTH(r.Llegada) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH)
  AND YEAR(r.Llegada) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH);

----------------------------------------------------------------

-- Calcular el número de reservas por día

--En esta consulta se hace un count que indica cuantas reservas hay por fecha
SELECT COUNT(*) AS total_reservas, DATE(Llegada) AS fecha
FROM Reservas
GROUP BY DATE(Llegada);


----------------------------------------------------------------

-- Calcular el promedio de reservas diarias

--Esta parte del código cuenta el número de reservas (COUNT(*)) para cada día (GROUP BY DATE(Llegada)).
--El resultado es una lista de días con el total de reservas para cada uno.
--La consulta principal toma los resultados de la subconsulta (que es una lista de totales diarios de reservas) y calcula el promedio de esos totales (AVG(total_reservas)).
--El resultado final es el promedio diario de reservas, etiquetado como promedio_diario.
SELECT AVG(total_reservas) AS promedio_diario
FROM (
    SELECT COUNT(*) AS total_reservas
    FROM Reservas
    GROUP BY DATE(Llegada)
) AS subquery;

----------------------------------------------------------------

--Consulta para identificar el hotel con la mayor ocupación en el mes anterior.

--h.Nombre: Selecciona el nombre del hotel.
--COUNT(r.ID_Habitacion) AS NumeroDeReservas: Cuenta el número de reservas por habitación y lo etiqueta como NumeroDeReservas.
--JOIN: Realiza una unión entre las tablas hoteles (alias h) y reservas (alias r).
--ON h.HotelID = r.ID_Habitacion: La unión se basa en que HotelID de la tabla hoteles coincide con ID_Habitacion de la tabla reservas.
--r.Llegada: Filtra las reservas cuya fecha de llegada está dentro del mes anterior.
--DATE_FORMAT(CURDATE() - INTERVAL 1 MONTH, ‘%Y-%m-01’): Calcula el primer día del mes anterior.
--(CURDATE() - INTERVAL 1 MONTH): Calcula la fecha actual menos un mes.
--GROUP BY h.Nombre: Agrupa los resultados por el nombre del hotel.
--ORDER BY NumeroDeReservas DESC: Ordena los resultados en orden descendente según el número de reservas.
SELECT h.Nombre, COUNT(r.ID_Habitacion) AS NumeroDeReservas
FROM hoteles h
JOIN reservas r ON h.HotelID = r.ID_Habitacion
WHERE r.Llegada BETWEEN DATE_FORMAT(CURDATE() - INTERVAL 1 MONTH, '%Y-%m-01') AND (CURDATE() - INTERVAL 1 MONTH)
GROUP BY h.Nombre
ORDER BY NumeroDeReservas DESC;

----------------------------------------------------------------

--Consulta para listar los hoteles que tienen habitaciones disponibles pero no han sido reservadas en el último mes.

--SELECT Nombre, COUNT(Reserva_id) AS TotalReservas: Selecciona el nombre del hotel y cuenta el número de reservas (Reserva_id) para cada hotel. El resultado de la cuenta se almacena en una columna llamada TotalReservas.
--FROM Hoteles h JOIN Reservas ON h.HotelID = HotelID: Realiza una unión (JOIN) entre las tablas Hoteles y Reservas donde el HotelID de ambas tablas coincida.
--WHERE Llegada BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE(): Filtra las reservas cuya fecha de llegada (Llegada) esté dentro del último mes, desde la fecha actual (CURDATE()) hasta un mes atrás (DATE_SUB(CURDATE(), INTERVAL 1 MONTH)).
-- GROUP BY HotelID: Agrupa los resultados por HotelID, lo que permite contar las reservas para cada hotel individualmente.
-- ORDER BY TotalReservas DESC: Ordena los resultados en orden descendente según el número total de reservas (TotalReservas).
-- LIMIT 1: Limita el resultado a solo una fila, es decir, el hotel con el mayor número de reservas en el último mes.
SELECT Nombre,COUNT(Reserva_id) AS TotalReservas
FROM Hoteles h
JOIN Reservas  ON h.HotelID = HotelID
WHERE Llegada BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE()
GROUP BY HotelID
ORDER BY TotalReservas DESC
LIMIT 1;

SELECT * FROM reservas;
