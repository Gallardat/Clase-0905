-- EJERCICIOS
/*

1 - Escriba un bloque de codigo PL/pgSQL que reciba una nota como parametro
    y notifique en la consola de mensaje las letras A,B,C,D,E o F segun el valor de la nota

*/
do $$
DECLARE nota int:=5;
BEGIN 
CASE nota
	WHEN 10 THEN 
		RAISE NOTICE 'A';
	WHEN 9 THEN
		RAISE NOTICE 'B';
	WHEN 8 THEN 
		RAISE NOTICE 'C';
	WHEN 7 THEN 
		RAISE NOTICE 'D';
	ELSE
		RAISE NOTICE 'F';
	END CASE;

END $$ language 'plpgsql';

/*
2 - Escriba un bloque de codigo PL/pgSQL que reciba un numero como parametro
    y muestre la tabla de multiplicar de ese numero.
*/
do $$
DECLARE num int:=5;
DECLARE resultado int;
DECLARE x int;
BEGIN 
for x in 1..10
loop
	resultado:=num*x;
	RAISE NOTICE 'El resultado es %', resultado;
end loop;

END $$ language 'plpgsql';

/*
3 - Escriba una funcion PL/pgSQL que convierta de dolares a moneda nacional.
    La funcion debe recibir dos parametros, cantidad de dolares y tasa de cambio.
    Al final debe retornar el monto convertido a moneda nacional.
*/


CREATE FUNCTION miFuncion(cant_dolares int, tasa_cambio int) returns int language plpgsql AS $$	
	DECLARE monto_convertido int;
	BEGIN
	monto_convertido:=cant_dolares *tasa_cambio;
	RETURN monto_convertido;
	END;$$
	
do $$
		
		DECLARE cant_dolares int:=5;
		DECLARE tasa_cambio int;
		BEGIN
		RAISE NOTICE'El cambio es %', miFuncion(4,5);
	
END $$ language 'plpgsql';

/*
4 - Escriba una funcion PL/pgSQL que reciba como parametro el monto de un prestamo,
    su duracion en meses y la tasa de interes, retornando el monto de la cuota a pagar.
    Aplicar el metodo de amortizacion frances.
*/
 
 CREATE FUNCTION miFuncionn(prestamo int, duracion int, interes int) returns int language plpgsql AS $$	
	
	BEGIN
	
	RETURN (prestamo *interes)/(1-(1+interes)^(-duracion));
	END;$$
	
do $$
		
		DECLARE prestamo int:=5;
		DECLARE duracion int:=4;
		DECLARE interes int:=3;
		BEGIN
		RAISE NOTICE'Resultado es %', miFuncionn(4,5,6);
	
END $$ language 'plpgsql';





