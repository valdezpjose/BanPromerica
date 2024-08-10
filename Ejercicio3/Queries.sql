-- Caso 1

SELECT p.NombreProyecto, prod.NombreProducto
FROM Proyectos p
JOIN Productos prod ON p.CodigoProyecto = prod.CodigoProyecto
WHERE p.CodigoProyecto = 1;

-- Caso 2

SELECT p.NombreProyecto, prod.NombreProducto, msg.Mensaje
FROM Mensajes msg
JOIN Productos prod ON msg.CodigoProducto = prod.CodigoProducto
JOIN Proyectos p ON prod.CodigoProyecto = p.CodigoProyecto;

-- Caso 3
SELECT p.NombreProyecto, 
       CASE 
           WHEN COUNT(DISTINCT prod.CodigoProducto) = (SELECT COUNT(*) 
                                                       FROM Productos 
                                                       WHERE CodigoProyecto = p.CodigoProyecto)
           THEN 'TODOS' 
           ELSE STRING_AGG(prod.NombreProducto, ', ')
       END AS NombreProducto, 
       msg.Mensaje
FROM Mensajes msg
JOIN Productos prod ON msg.CodigoProducto = prod.CodigoProducto
JOIN Proyectos p ON prod.CodigoProyecto = p.CodigoProyecto
GROUP BY p.NombreProyecto, msg.Mensaje;

