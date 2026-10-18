DROP DATABASE IF EXISTS franquicias;
CREATE DATABASE franquicias CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE franquicias;

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


