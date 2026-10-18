DROP DATABASE IF EXISTS franquicias;
CREATE DATABASE franquicias CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE franquicias;

-- TABLAS
CREATE TABLE restaurantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(255) NOT NULL,
    responsable VARCHAR(255) NOT NULL,
    abierto BOOLEAN
);

CREATE TABLE mesas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    restaurante_id INT NOT NULL,
    numero_mesa INT NOT NULL,
    numero_comensales INT NOT NULL,
    FOREIGN KEY (restaurante_id) REFERENCES restaurantes(id) ON DELETE CASCADE
);

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    telefono VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE favoritos (
    cliente_id INT NOT NULL,
    restaurante_id INT NOT NULL,
    PRIMARY KEY (cliente_id, restaurante_id),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE,
    FOREIGN KEY (restaurante_id) REFERENCES restaurantes(id) ON DELETE CASCADE
);

CREATE TABLE reservas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mesa_id INT NOT NULL,
    cliente_id INT NOT NULL,
    fecha_hora DATETIME NOT NULL,
    UNIQUE (mesa_id, fecha_hora),
    FOREIGN KEY (mesa_id) REFERENCES mesas(id) ON DELETE CASCADE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);

-- DATOS
INSERT INTO restaurantes (nombre, direccion, telefono, responsable, abierto) VALUES
('Restaurante 1', 'Calle Mayor 1', '911111111', 'Responsable 1', 1),
('Restaurante 2', 'Calle Menor 2', '922222222', 'Responsable 2', 0),
('Restaurante 3', 'Calle Central 3', '9333333333', 'Responsable 3', 0),
('Restaurante 4', 'Calle Arriba 4', '944444444', 'Responsable 4', 1),
('Restaurante 5', 'Calle Abajo 5', '955555555', 'Responsable 5', 1),
('Restaurante 6', 'Calle Estación 6', '966666666', 'Responsable 6', 1),
('Restaurante 7', 'Plaza Pequeña 7', '977777777', 'Responsable 7', 1),
('Restaurante 8', 'Plaza Grande 8', '988888888', 'Responsable 8', 1),
('Restaurante 9', 'Plaza Ayuntamiento 9', '999999999', 'Responsable 9', 1),
('Restaurante 7', 'Calle del Puerto 10', '900000000', 'Responsable 10', 0);

INSERT INTO mesas (restaurante_id, numero_mesa, numero_comensales) VALUES
(1, 1, 1), 
(1, 2, 4), 
(1, 3, 2),
(2, 1, 4),
(2, 2, 6),
(3, 1, 2),
(3, 2, 4),
(3, 3, 10),
(4, 1, 4),
(4, 2, 4),
(5, 1, 2),
(5, 2, 4),
(5, 3, 6),
(6, 1, 4),
(6, 2, 6),
(7, 1, 2),
(7, 2, 4),
(8, 1, 4),
(8, 2, 4),
(9, 1, 1),
(9, 2, 2),
(10, 1, 6),
(10, 2, 4),
(10, 3, 10);

INSERT INTO clientes (nombre, telefono, email) VALUES
('Cliente 1', '611111111', 'cliente1@email.com'),
('Cliente 2', '622222222', 'cliente2@email.com'),
('Cliente 3', '633333333', 'cliente3@email.com'),
('Cliente 4', '644444444', 'cliente4@email.com'),
('Cliente 5', '655555555', 'cliente5@email.com'),
('Cliente 6', '666666666', 'cliente6@email.com'),
('Cliente 7', '677777777', 'cliente7@email.com'),
('Cliente 8', '688888888', 'cliente8@email.com'),
('Cliente 9', '699999999', 'cliente9@email.com'),
('Cliente 10', '600000000', 'cliente10@email.com');

INSERT INTO favoritos (cliente_id, restaurante_id) VALUES
(1, 1), (1, 2),
(2, 3), (2, 4),
(3, 1), (3, 5),
(4, 6), (4, 7),
(5, 8), (5, 9),
(6, 10), (6, 1),
(7, 2), (7, 3),
(8, 4), (8, 5),
(9, 6), (9, 7),
(10, 8), (10, 10);

INSERT INTO reservas (mesa_id, cliente_id, fecha_hora) VALUES
(1, 1, '2026-11-20 14:00:00'),
(2, 2, '2026-11-20 14:30:00'),
(3, 3, '2026-11-20 21:00:00'),
(1, 4, '2026-11-21 15:00:00'),
(4, 5, '2026-11-20 13:30:00'),
(5, 6, '2026-11-21 21:30:00'),
(4, 1, '2026-11-22 14:00:00'),
(6, 7, '2026-11-20 20:30:00'),
(8, 8, '2026-11-21 14:00:00'),
(7, 9, '2026-11-22 15:00:00'),
(9, 10, '2026-11-20 22:00:00'),
(10, 2, '2026-11-21 13:30:00'),
(11, 3, '2026-11-20 14:15:00'),
(12, 4, '2026-11-21 21:00:00'),
(13, 5, '2026-11-22 14:30:00'),
(14, 6, '2026-11-20 15:00:00'),
(15, 7, '2026-11-21 20:45:00'),
(16, 8, '2026-11-20 13:45:00'),
(17, 9, '2026-11-22 21:15:00'),
(18, 10, '2026-11-21 14:00:00'),
(19, 1, '2026-11-22 22:00:00'),
(20, 2, '2026-11-20 14:00:00'),
(21, 3, '2026-11-21 21:30:00'),
(22, 4, '2026-11-20 21:00:00'),
(24, 5, '2026-11-20 21:30:00'),
(24, 5, '2026-11-21 14:30:00');
