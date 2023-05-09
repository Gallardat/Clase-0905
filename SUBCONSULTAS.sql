
--Subconsultas

-- Obtener los productos cuyo precio unitario sea mayor al precio promedio de la tabla de productos
SELECT product_id, unit_price FROM products WHERE unit_price >(SELECT avg(unit_price) FROM products)
-- Obtener los productos cuya cantidad en stock sea menor al promedio de cantidad en stock de toda la tabla de productos.
SELECT product_id, product_name FROM products WHERE units_in_stock <(SELECT AVG(units_in_stock) FROM products)
-- Obtener los productos cuya cantidad en Inventario (UnitsInStock) sea menor a la cantidad mínima del detalle de ordenes (Order Details)
SELECT product_id,product_name,units_in_stock FROM products WHERE units_in_stock <(SELECT min(quantity) FROM order_details)
SELECT min(quantity) FROM order_details 
select units_in_stock from products;
--OBTENER LOS PRODUCTOS CUYA CATEGORIA SEA IGUAL A LAS CATEGORIAS DE LOS PRODUCTOS CON PROVEEDOR 1.
SELECT product_id,category_id FROM products WHERE category_id IN(SELECT category_id FROM products WHERE category_id=1 )


-- Subconsultas correlacionadas 

--Obtener el número de empleado y el apellido para aquellos empleados que tengan menos de 100 ordenes.
SELECT employee_id, last_name 
FROM employees as emple 
WHERE 100 >(SELECT COUNT(order_id) 
			FROM orders 
			WHERE employee_id=emple.employee_id )
--Obtener la clave de cliente y el nombre de la empresa para aquellos clientes que tengan más de 20 ordenes
SELECT customer_id,company_name 
FROM customers as custm 
WHERE 20<(SELECT COUNT(order_id) 
		  FROM orders 
		  WHERE customer_id=custm.customer_id)
--Obtener el productoid, el nombre del producto, el proveedor de la tabla de productos para aquellos productos que se hayan vendido menos de 100 unidades (Consultarlo en la tabla de Orders details).
SELECT product_id,product_name,supplier_id 
FROM products as produc 
WHERE 100>(SELECT COUNT(product_id) 
		   FROM order_details
		   WHERE product_id=produc.product_id )
--Obtener los datos del empleado IDEmpleado y nombre completo De aquellos que tengan mas de 100 ordenes
SELECT employee_id, CONCAT(first_name,'',last_name) 
FROM employees as emple 
WHERE 100<(SELECT COUNT(order_id) 
		   FROM orders 
		   WHERE employee_id=emple.employee_id)
--Obtener los datos de Producto ProductId, ProductName, UnitsinStock, UnitPrice (Tabla Products) de los productos que la sumatoria de la cantidad (Quantity) de orders details sea mayor a 450
SELECT product_id,product_name,units_in_stock,unit_price 
FROM products 
WHERE product_id IN (SELECT product_id 
FROM order_details GROUP BY product_id HAVING COUNT (quantity)>450)
SELECT product_id,product_name,units_in_stock,unit_price FROM products as pro WHERE 450<(SELECT SUM(quantity) FROM order_details WHERE product_id=pro.product_id )
--Obtener la clave de cliente y el nombre de la empresa para aquellos clientes que tengan más de 20 ordenes.
SELECT customer_id,company_name FROM customers as cust WHERE  20<(SELECT COUNT(order_id) FROM orders WHERE customer_id=cust.customer_id)

--insert

--Insertar un registro en la tabla de Categorias, únicamente se quiere insertar la información del CategoryName y la descripción los Papelería y papelería escolar
SELECT * FROM CATEGORIES;
INSERT INTO categories(category_id,category_name,description)VALUES(9,'Papeleria','papelería escolar')
--Dar de alta un producto con Productname, SupplierId, CategoryId, UnitPrice, UnitsInStock Como esta tabla tiene dos clave foraneas hay que ver los datos a dar de alta
INSERT INTO products(product_id,product_name,supplier_id,category_id,unit_price,units_in_stock,discontinued)VALUES(78,'lapiz',27,9,4,23,1)
--Dar de alta un empleado con LastName, FistName, Title, BrithDate
select * from employees;
INSERT INTO employees(employee_id,last_name,first_name,title,birth_date)VALUES(10,'Gallardo','Daniela','Programador','05-10-93')
--Dar de alta una orden, CustomerId, Employeeid, Orderdate, ShipVia Como esta tabla tiene dos clave foraneas hay que ver los datos a dar de alta
SELECT * FROM orders;
SELECT * FROM customers; 
SELECT * FROM order_details; 
select count(*) from order_details;
select count(order_id) from orders;
INSERT INTO orders(order_id,customer_id,employee_id,order_date,ship_via)VALUES(832,'ANTON',3,'12,04,2020',3)
--Dar de alta un Order details, con todos los datos
INSERT INTO order_details(order_id,product_id,unit_price,quantity,discount)VALUES(832,3,4,5,0)
--update

-- Cambiar el CategoryName a Verduras de la categoria 10
select * from categories;
UPDATE categories SET category_name='Verduras' WHERE category_id=10;
-- Actualizar los precios de la tabla de Productos para incrementarlos un 10%
UPDATE products set unit_price=unit_price*1.1; 
--ACTUALIZAR EL PRODUCTNAME DEL PRODUCTO 80 A ZANAHORIA ECOLOGICA
UPDATE products SET product_name='Zanahoria ecologica' WHERE product_id=78
select * from products;
--ACTUALIZAR EL FIRSTNAME DEL EMPLOYEE 10 A ROSARIO
select * from employees;
UPDATE employees SET first_name='ROSARIO' WHERE employee_id=10
--ACTUALIZAR EL ORDERS DETAILS DE LA 11079 PARA QUE SU CANTIDAD SEA 10
UPDATE order_details SET quantity='10' WHERE order_id=11079;	

--Delete

--diferencia entre delete y truncate
--BORRAR EL EMPLEADO 10
DELETE FROM employees WHERE employee_id=10

