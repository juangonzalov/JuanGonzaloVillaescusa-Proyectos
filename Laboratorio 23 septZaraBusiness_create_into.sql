-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS ZaraBusiness;
USE ZaraBusiness;

-- Tabla de Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(100),
    email_cliente VARCHAR(100),
    ciudad VARCHAR(100),
    pais VARCHAR(100)
);

-- Tabla de Tiendas
CREATE TABLE Tiendas (
    id_tienda INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tienda VARCHAR(100),
    direccion VARCHAR(255),
    ciudad VARCHAR(100),
    pais VARCHAR(100)
);

-- Tabla de Empleados
CREATE TABLE Empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre_empleado VARCHAR(100),
    puesto VARCHAR(100),
    tienda_id INT,
    fecha_contratacion DATE,
    FOREIGN KEY (tienda_id) REFERENCES Tiendas(id_tienda)
);

-- Tabla de Prendas de Ropa
CREATE TABLE Prendas (
    id_prenda INT AUTO_INCREMENT PRIMARY KEY,
    tipo_prenda VARCHAR(100),
    talla VARCHAR(10),
    color VARCHAR(50),
    precio DECIMAL(10, 2)
);

-- Tabla de Compras
CREATE TABLE Compras (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha_compra DATE,
    monto_total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Insertar datos en la tabla Clientes
INSERT INTO Clientes (nombre_cliente, email_cliente, ciudad, pais)
VALUES
('Carlos Ramírez', 'carlos.ramirez@email.com', 'Madrid', 'España'),
('Laura González', 'laura.gonzalez@email.com', 'Barcelona', 'España'),
('Andrés García', 'andres.garcia@email.com', 'Valencia', 'España'),
('Lucía Martínez', 'lucia.martinez@email.com', 'Sevilla', 'España'),
('Miguel Torres', 'miguel.torres@email.com', 'Zaragoza', 'España');

-- Insertar datos en la tabla Tiendas
INSERT INTO Tiendas (nombre_tienda, direccion, ciudad, pais)
VALUES
('Zara Gran Vía', 'Calle Gran Vía, 32', 'Madrid', 'España'),
('Zara Portal de l\'Àngel', 'Portal de l\'Àngel, 10', 'Barcelona', 'España'),
('Zara Calle de Colón', 'Calle de Colón, 20', 'Valencia', 'España'),
('Zara Calle Sierpes', 'Calle Sierpes, 40', 'Sevilla', 'España'),
('Zara Paseo de la Independencia', 'Paseo de la Independencia, 5', 'Zaragoza', 'España');

-- Insertar datos en la tabla Empleados
INSERT INTO Empleados (nombre_empleado, puesto, tienda_id, fecha_contratacion)
VALUES
('Juan Pérez', 'Vendedor', 1, '2022-01-10'),
('María López', 'Gerente', 2, '2021-11-15'),
('Carlos Fernández', 'Vendedor', 3, '2023-02-01'),
('Ana García', 'Encargada', 4, '2023-05-25'),
('Luis Martínez', 'Vendedor', 5, '2023-06-10');

-- Insertar datos en la tabla Prendas
INSERT INTO Prendas (tipo_prenda, talla, color, precio)
VALUES
('Camiseta', 'M', 'Negro', 19.99),
('Pantalón', 'L', 'Azul', 39.99),
('Chaqueta', 'S', 'Rojo', 59.99),
('Falda', 'M', 'Verde', 29.99),
('Zapatos', '42', 'Negro', 49.99),
('Vestido', 'L', 'Blanco', 59.99),
('Camisa', 'M', 'Azul', 29.99),
('Abrigo', 'L', 'Gris', 89.99),
('Shorts', 'S', 'Rosa', 24.99),
('Sudadera', 'XL', 'Negro', 34.99);

-- Insertar datos en la tabla Compras
INSERT INTO Compras (id_cliente, fecha_compra, monto_total)
VALUES
(1, '2023-04-01', 100.50),
(2, '2023-05-15', 59.99),
(3, '2023-06-20', 75.00),
(4, '2023-07-18', 120.00),
(5, '2023-08-10', 99.99),
(1, '2023-09-01', 200.00),
(2, '2023-09-10', 150.00),
(3, '2023-09-15', 50.00),
(4, '2023-09-20', 90.00),
(5, '2023-09-25', 30.00);
SELECT*FROM clientes;
SELECT*FROM empleados;
SELECT*FROM tiendas;
SELECT*FROM prendas;
SELECT*FROM clientes WHERE nombre_cliente LIKE 'L%';
SELECT COUNT(*) AS total_clientes FROM clientes;
SELECT*FROM compras;
SELECT* FROM compras WHERE fecha_compra  > '2023-05-01';
UPDATE clientes SET email_cliente = 'nuevo@mail.com' WHERE id_cliente = 1;
DELETE FROM clientes WHERE id_cliente = 1;
SELECT * FROM prendas WHERE color = 'Negro';
SELECT * FROM tiendas WHERE ciudad = 'Madrid';
SELECT COUNT(*) AS prendas_caras
FROM prendas
WHERE precio > 50;
SELECT *
FROM empleados
WHERE tienda_id = 1;
SELECT *
FROM clientes
WHERE nombre_cliente LIKE '%Andrés%';
SELECT *
FROM compras
WHERE id_cliente = 2;
DELETE FROM compras
WHERE monto_total < 30;
SELECT *
FROM prendas
WHERE precio BETWEEN 20 AND 40;
SELECT *
FROM empleados
WHERE nombre_empleado LIKE '%a%';
SELECT *
FROM prendas
ORDER BY precio DESC
LIMIT 5;
SELECT *
FROM compras
WHERE id_cliente = 1 AND monto_total > 75;
SELECT *
FROM prendas
WHERE talla = 'M';
UPDATE prendas
SET talla = 'M'
WHERE id_prenda = 1;
SELECT *
FROM empleados
WHERE fecha_contratacion > '2022-01-01';
SELECT *
FROM tiendas
WHERE ciudad = 'Barcelona';
DELETE FROM empleados
WHERE id_empleado = 1;
SELECT *
FROM compras
WHERE fecha_compra < '2023-07-01';
SELECT *
FROM prendas
WHERE tipo_prenda LIKE '%eta';
SELECT *
FROM clientes
WHERE email_cliente NOT LIKE '%@hotmail.%';
SELECT COUNT(*) AS compras_sep_2023
FROM compras
WHERE fecha_compra >= '2023-09-01'
  AND fecha_compra <  '2023-10-01';
  UPDATE tiendas
SET direccion = 'Nueva dirección 123'
WHERE id_tienda = 1;
SELECT *
FROM prendas
WHERE tipo_prenda = 'camiseta' OR tipo_prenda LIKE 'camiseta%';
DELETE FROM prendas
WHERE precio < 20;
SELECT *
FROM tiendas
ORDER BY ciudad ASC;
SELECT *
FROM empleados
WHERE puesto = 'Vendedor';
SELECT COUNT(*) AS prendas_blancas
FROM prendas
WHERE color = 'Blanco';
SELECT *
FROM clientes
WHERE CHAR_LENGTH(nombre_cliente) > 10;
SELECT *
FROM compras
WHERE monto_total BETWEEN 50 AND 100;
SELECT *
FROM compras
ORDER BY fecha_compra DESC
LIMIT 3;
SELECT *
FROM curso
WHERE nombre_curso LIKE '%Digital%';
SELECT color, COUNT(*) AS cantidad
FROM prendas
GROUP BY color
ORDER BY cantidad DESC;
INSERT INTO tiendas (nombre_tienda, direccion, ciudad, pais)
SELECT 'Moda Sol', 'Calle Sol 10', 'Madrid', 'España'
WHERE NOT EXISTS (
  SELECT 1 FROM tiendas WHERE nombre_tienda='Moda Sol' AND ciudad='Madrid'
);

INSERT INTO tiendas (nombre_tienda, direccion, ciudad, pais)
SELECT 'Tendencia Norte', 'Av. Norte 25', 'Madrid', 'España'
WHERE NOT EXISTS (
  SELECT 1 FROM tiendas WHERE nombre_tienda='Tendencia Norte' AND ciudad='Madrid'
);
UPDATE clientes
SET nombre_cliente = 'Micaela Torres',
    email_cliente  = 'micaela.torres@tu-dominio.com'
WHERE nombre_cliente = 'Miguel Torres';
