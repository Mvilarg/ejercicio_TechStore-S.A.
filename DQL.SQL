-- TOTAL GASTADO

SELECT 
    CONCAT(c.nombre, ' ', c.apellido) AS nombre_completo, 
    SUM(dp.cantidad) AS total_articulos_comprados, 
    SUM(dp.cantidad * dp.precio_unitario) AS monto_total_acumulado
FROM Clientes c
INNER JOIN Pedidos p ON c.id_cliente = p.id_cliente
INNER JOIN Detalle_Pedidos dp ON p.id_pedido = dp.id_pedido
GROUP BY c.id_cliente, c.nombre, c.apellido
ORDER BY monto_total_acumulado DESC;

-- AUDITORIA
SELECT 
    p.nombre AS nombre_producto, 
    COALESCE(c.nombre, 'Sin Categoría Asignada') AS categoria
FROM Productos p
LEFT JOIN Categorias c ON p.id_categoria = c.id_categoria
LEFT JOIN Detalle_Pedidos dp ON p.id_producto = dp.id_producto
WHERE dp.id_producto IS NULL;

-- MAPEO CATEGORIAS
SELECT 
    p.id_pedido,
    dp.id_linea_pedido,
    pr.nombre AS producto,
    dp.cantidad,
    dp.precio_unitario
FROM Pedidos p
INNER JOIN Detalle_Pedidos dp ON p.id_pedido = dp.id_pedido
INNER JOIN Productos pr ON dp.id_producto = pr.id_producto
WHERE pr.precio > 100.00;

-- REPORTE ARTICULOS PREMIUM

SELECT 
    p.id_pedido,
    dp.id_linea_pedido,
    pr.nombre AS producto,
    dp.cantidad,
    dp.precio_unitario
FROM Pedidos p
INNER JOIN Detalle_Pedidos dp ON p.id_pedido = dp.id_pedido
INNER JOIN Productos pr ON dp.id_producto = pr.id_producto
WHERE pr.precio > 100.00;