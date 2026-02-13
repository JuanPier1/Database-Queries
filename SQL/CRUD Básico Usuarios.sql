//CRUD: Create, Read, Update, Delete

//# MySQL
//Crear
CREATE TABLE usuario (
    idUser INT AUTO_INCREMENT PRIMARY KEY,
    nameUser VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    passw VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO usuario (nameUser, email, passw)
VALUES ('Nombre', 'correo@dominio.com', '123456');

//Leer
SELECT * FROM usuario; -- Todos
SELECT * FROM usuario WHERE id = 1; -- Por ID

//Actualizar
UPDATE usuario
SET nombre = 'Nombre', email = 'correo@dominio.com'
WHERE id = 1;

//Eliminar
DELETE FROM usuario WHERE id = 1;

//# SQL Server
//Crear
CREATE TABLE usuario (
    idUsuario INT IDENTITY(1,1) PRIMARY KEY,
    nombreUsuario VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    clave VARCHAR(255) NOT NULL,
    creado_el DATETIME DEFAULT GETDATE()
);

INSERT INTO usuario (nombre, correo, clave)
VALUES ('Nombre', 'correo@dominio.com', '123456');

SELECT * FROM usuario;
SELECT * FROM usuario WHERE id = 1;

DELETE FROM usuario WHERE id = 1;


//# PostgreSQL
//Crear
CREATE TABLE usuario (
    idUser SERIAL PRIMARY KEY,
    nameUser VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    passw VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO usuario (nameUser, email, passw)
VALUES ('Nombre', 'correo@dominio.com', '123456');

//Leer
SELECT * FROM usuario;
SELECT * FROM usuario WHERE id = 1;

//Actualizar
UPDATE usuario
SET nombre = 'Juan Pérez', email = 'juanp@email.com'
WHERE id = 1;

//Eliminar
DELETE FROM usuarios WHERE id = 1;
