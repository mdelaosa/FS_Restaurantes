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