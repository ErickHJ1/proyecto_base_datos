DELIMITER //
CREATE PROCEDURE CancelarReserva(
    IN MyUsuarioID INT,
)
BEGIN
    DELETE FROM Reservas WHERE `UsuarioID` = MyUsuarioID;
END //
DELIMITER;