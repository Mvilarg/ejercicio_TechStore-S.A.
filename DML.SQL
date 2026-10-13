-- SECCION 1 

--CLIENTES ESPECIALES
INSERT INTO clientes (nombre, apellido, email, telefono) VALUES
('Laura', 'Gomez', 'laura.gomez@techstore', '555-0199');

-- PRODUCTOS EN LANZAMIENTO
INSERT INTO productos (nombre_producto, precio, stock, categoria_id) VALUES
('Teclado Mecánico RGB', 110.00, 10, 1),
('Monitor Gaming 27"', 350.00, 10, 1);

-- VENTA COMBINADA
INSERT INTO pedidos (cliente_id, estado) VALUES
(5, 'Completado');

INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad, precio_unitario) VALUES
(4,7,1,350),
(4,4,2,45);

-- SECCION 2

-- DESCUENTO SELECTIVO
UPDATE Productos
SET precio = precio * 0.90
WHERE categoria_id = 'Electrónica' AND precio > 500.00;

-- RESTABLECIMIENTO CRITICO
UPDATE Productos
SET stock = stock + 20
WHERE stock < 10;

-- ACTUALIZACION DE ESTADO
UPDATE Pedidos
SET estado = 'En Proceso'
WHERE estado = 'Pendiente' AND cliente_id = (SELECT cliente_id FROM Clientes WHERE nombre = 'Carlos Mendoza');