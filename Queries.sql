---Querys 

--2
SELECT  Nombre,COUNT(`Habitaciones`.disponibilidad) AS cant_habitaciones
FROM Hoteles INNER JOIN Habitaciones ON `Hoteles`.HotelID = `Habitaciones`.ID_Habitacion
INNER JOIN Reservas ON `Habitaciones`.ID_Habitacion = `Reservas`.ID_Habitacion 
WHERE Disponibilidad = TRUE AND Reservas.Salida < "2024-12-31" GROUP BY HotelID;
--3
SELECT Nombre FROM hoteles ;
--4
SELECT * FROM hoteles WHERE `Ciudad` LIKE "A%";
--5
SELECT * FROM hoteles WHERE `Ciudad` LIKE "%E";
SELECT CURRENT_DATE();