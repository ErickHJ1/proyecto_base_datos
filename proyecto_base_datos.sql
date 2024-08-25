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


