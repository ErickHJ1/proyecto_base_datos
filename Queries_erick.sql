--querie para hotel sin reservas desde hace un mes
SELECT Nombre, HotelID
FROM hoteles 
RIGHT JOIN reservas ON HotelID = ID_Habitacion
WHERE Llegada IS NULL
   OR Llegada < DATE_SUB(CURDATE(), INTERVAL 1 MONTH);


--querie para hotel con mayor ocupacion en el ultimo mes
SELECT 
    Nombre, 
    COUNT(Reserva_id) AS TotalReservas
FROM 
    Hoteles h
JOIN 
    Reservas  ON h.HotelID = HotelID
WHERE 
    Llegada BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE()
GROUP BY 
    HotelID
ORDER BY 
    TotalReservas DESC
LIMIT 1;

-- Calcular el número de reservas por día
SELECT COUNT(*) AS total_reservas, DATE(Llegada) AS fecha
FROM Reservas
GROUP BY DATE(Llegada);

-- Calcular el promedio de reservas diarias
SELECT AVG(total_reservas) AS promedio_reservas_diarias
FROM (
    SELECT COUNT(*) AS total_reservas
    FROM Reservas
    GROUP BY DATE(Llegada)
) AS subquery;


SELECT r.*
FROM Reservas r
JOIN Usuarios u ON r.UsuarioID = u.UsuarioID
WHERE u.Email = "keylor@correo.com"
  AND MONTH(r.Llegada) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH)
  AND YEAR(r.Llegada) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH);


