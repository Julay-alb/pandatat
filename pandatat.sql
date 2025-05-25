CREATE DATABASE PandaTaT;
USE PandaTaT;

-- Tabla de roles
CREATE TABLE Roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla de usuarios
CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    rol_id INT,
    FOREIGN KEY (rol_id) REFERENCES Roles(id)
);

-- Tabla de estados de pedidos
CREATE TABLE Estado_pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    estado VARCHAR(50) NOT NULL
);

-- Tabla de pedidos
CREATE TABLE Pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    estado_id INT,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (estado_id) REFERENCES Estado_pedidos(id)
);



/*Llenar base de datos*/



-- Insertar roles
INSERT INTO Roles (nombre) VALUES 
('Administrador'), 
('Gerente de zona'), 
('Vendedor'), 
('Cliente');

-- Insertar usuarios
INSERT INTO Usuarios (nombre, email, password, rol_id) VALUES 
('Juan Pérez', 'juan@example.com', '123456', 1), 
('Ana Gómez', 'ana@example.com', 'abcdef', 2), 
('Carlos López', 'carlos@example.com', 'qwerty', 3), 
('Luis Torres', 'luis@example.com', '789xyz', 4);

-- Insertar estados de pedidos
INSERT INTO Estado_pedidos (estado) VALUES 
('Enviado'), 
('Cancelado'), 
('Pagado'), 
('Reenviado');

-- Insertar pedidos
INSERT INTO Pedidos (usuario_id, estado_id) VALUES 
(1, 3),  -- Pedido de Juan Pérez (Pagado)
(2, 1),  -- Pedido de Ana Gómez (Enviado)
(3, 2),  -- Pedido de Carlos López (Cancelado)
(4, 4);  -- Pedido de Luis Torres (Reenviado)


select * from pedidos;
