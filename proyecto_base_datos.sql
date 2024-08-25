CREATE DATABASE proyecto_base_datos

use proyecto_base_datos;

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
