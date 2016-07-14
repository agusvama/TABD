set search_path to banco;
--porcentaje de clientes por sexo--
select "sexo", count("sexo"), ((count("sexo")*100)/100000.0) as "porcentaje" from cliente
group by "sexo";
--porcentaje de clientes por rangos de edad --
select '15 a 17' as rango, 
count(date_part('year', age("fnacimiento"))) as cantidad,
round((count(date_part('year', age("fnacimiento")))*100)/100000.0,3) as porcentaje
from cliente
where date_part('year', age("fnacimiento")) >= 15 and
date_part('year', age("fnacimiento")) < 18

UNION
select '18 a 30' as rango, 
count(date_part('year', age("fnacimiento"))) as cantidad,
round((count(date_part('year', age("fnacimiento")))*100)/100000.0,3) as porcentaje
from cliente
where date_part('year', age("fnacimiento")) >= 18 and
date_part('year', age("fnacimiento")) < 31

UNION
select '31 a 40' as rango, 
count(date_part('year', age("fnacimiento"))) as cantidad,
round((count(date_part('year', age("fnacimiento")))*100)/100000.0,3) as porcentaje
from cliente
where date_part('year', age("fnacimiento")) >= 31 and
date_part('year', age("fnacimiento")) < 41

UNION
select '41 a 60' as rango, 
count(date_part('year', age("fnacimiento"))) as cantidad,
round((count(date_part('year', age("fnacimiento")))*100)/100000.0,3) as porcentaje
from cliente
where date_part('year', age("fnacimiento")) >= 41 and
date_part('year', age("fnacimiento")) < 60

UNION
select '60 o mas' as rango, 
count(date_part('year', age("fnacimiento"))) as cantidad,
round((count(date_part('year', age("fnacimiento")))*100)/100000.0,3) as porcentaje
from cliente
where date_part('year', age("fnacimiento")) >= 60
order by rango;

-- porcentaje de clientes por sexo y rangos de edad --
select 
'F' as sexo,
'15 a 17' as rango, 
count(date_part('year', age("fnacimiento"))) as cantidad,
round((count(date_part('year', age("fnacimiento")))*100)/100000.0,3) as porcentaje
from cliente
where date_part('year', age("fnacimiento")) >= 15 and
date_part('year', age("fnacimiento")) < 18 and
"sexo" = 'F'

UNION
select 
'M' as sexo,
'15 a 17' as rango, 
count(date_part('year', age("fnacimiento"))) as cantidad,
round((count(date_part('year', age("fnacimiento")))*100)/100000.0,3) as porcentaje
from cliente
where date_part('year', age("fnacimiento")) >= 15 and
date_part('year', age("fnacimiento")) < 18 and
"sexo" = 'M'

UNION
select 
'F' as sexo,
'18 a 30' as rango, 
count(date_part('year', age("fnacimiento"))) as cantidad,
round((count(date_part('year', age("fnacimiento")))*100)/100000.0,3) as porcentaje
from cliente
where date_part('year', age("fnacimiento")) >= 18 and
date_part('year', age("fnacimiento")) < 31 and
"sexo" = 'F'

UNION
select 
'M' as sexo,
'18 a 30' as rango, 
count(date_part('year', age("fnacimiento"))) as cantidad,
round((count(date_part('year', age("fnacimiento")))*100)/100000.0,3) as porcentaje
from cliente
where date_part('year', age("fnacimiento")) >= 18 and
date_part('year', age("fnacimiento")) < 31 and
"sexo" = 'M'

UNION
select 
'F' as sexo,
'31 a 40' as rango, 
count(date_part('year', age("fnacimiento"))) as cantidad,
round((count(date_part('year', age("fnacimiento")))*100)/100000.0,3) as porcentaje
from cliente
where date_part('year', age("fnacimiento")) >= 31 and
date_part('year', age("fnacimiento")) < 41 and
"sexo" = 'F'

UNION
select 
'M' as sexo,
'31 a 40' as rango, 
count(date_part('year', age("fnacimiento"))) as cantidad,
round((count(date_part('year', age("fnacimiento")))*100)/100000.0,3) as porcentaje
from cliente
where date_part('year', age("fnacimiento")) >= 31 and
date_part('year', age("fnacimiento")) < 41 and
"sexo" = 'M'

UNION
select 
'F' as sexo,
'41 a 60' as rango, 
count(date_part('year', age("fnacimiento"))) as cantidad,
round((count(date_part('year', age("fnacimiento")))*100)/100000.0,3) as porcentaje
from cliente
where date_part('year', age("fnacimiento")) >= 41 and
date_part('year', age("fnacimiento")) < 60 and
"sexo" = 'F'

UNION
select 
'M' as sexo,
'41 a 60' as rango, 
count(date_part('year', age("fnacimiento"))) as cantidad,
round((count(date_part('year', age("fnacimiento")))*100)/100000.0,3) as porcentaje
from cliente
where date_part('year', age("fnacimiento")) >= 41 and
date_part('year', age("fnacimiento")) < 60 and
"sexo" = 'M'

UNION
select 
'F' as sexo,
'60 o mas' as rango, 
count(date_part('year', age("fnacimiento"))) as cantidad,
round((count(date_part('year', age("fnacimiento")))*100)/100000.0,3) as porcentaje
from cliente
where date_part('year', age("fnacimiento")) >= 60 and
"sexo" = 'F'

UNION
select 
'M' as sexo,
'60 o mas' as rango, 
count(date_part('year', age("fnacimiento"))) as cantidad,
round((count(date_part('year', age("fnacimiento")))*100)/100000.0,3) as porcentaje
from cliente
where date_part('year', age("fnacimiento")) >= 60 and
"sexo" = 'M'
order by rango, sexo;


--total de clientes que han pedido un credito por rango de edad--

select '15 a 17' as rango, count(DISTINCT(c."idCliente"))
from cliente c
NATURAL JOIN prestamo p
where date_part('year', age("fnacimiento")) >= 15 and
date_part('year', age("fnacimiento")) < 18

UNION
select '18 a 30' as rango, count(DISTINCT(c."idCliente"))
from cliente c
NATURAL JOIN prestamo p
where date_part('year', age("fnacimiento")) >= 18 and
date_part('year', age("fnacimiento")) < 31

UNION
select '31 a 40' as rango, count(DISTINCT(c."idCliente"))
from cliente c
NATURAL JOIN prestamo p
where date_part('year', age("fnacimiento")) >= 31 and
date_part('year', age("fnacimiento")) < 41

UNION
select '41 a 60' as rango, count(DISTINCT(c."idCliente"))
from cliente c
NATURAL JOIN prestamo p
where date_part('year', age("fnacimiento")) >= 41 and
date_part('year', age("fnacimiento")) < 60

UNION
select '60 o mas' as rango, count(DISTINCT(c."idCliente"))
from cliente c
NATURAL JOIN prestamo p
where date_part('year', age("fnacimiento")) >= 60
group by rango
order by rango

--total de clientes que han pedido prestamo, tienen cta ahorro, y de inversion(movimiento)
--sum clientes, que figuren en las 3 tables

select 'con prestamos, ahorros e inversiones' as personas,
count(DISTINCT(c."idCliente")) as cantidad
from cliente c
inner JOIN prestamo p
on c."idCliente" = p."idCliente"
inner join ahorro a
on c."idCliente" = a."idCliente"
inner join movimiento m
on a."idAhorro" = m."idAhorro"

--clientes que tienen cta inversion y ningun prestamo
select c."idCliente", a."idAhorro", m."idMovimiento"
from cliente c--, movimiento m, ahorro a
left join prestamo p
on c."idCliente" = p."idCliente"
inner join ahorro a
on c."idCliente" = a."idCliente"
inner join movimiento m
on a."idAhorro" = m."idAhorro"
where p."idCliente" is NULL
order by c."idCliente"
--cliente que no tiene prestamos, ni inversion, solo cta ahorro: 63837
--select * from ahorro where "idCliente" = 63837
--select * from movimiento where "idAhorro" = 54562 or "idAhorro" = 66693

--TOTAL de clientes que tienen cta inversion y ningun prestamo
select 'con inversiones y sin prestamos' as personas,
count(DISTINCT(c."idCliente")) as cantidad
from cliente c
left JOIN prestamo p
on c."idCliente" = p."idCliente"
inner join ahorro a
on c."idCliente" = a."idCliente"
inner join movimiento m
on a."idAhorro" = m."idAhorro"
where p."idCliente" is null;

--clientes que tienen cta ahorro, inversion y ningun prestamo
select c."idCliente", a."idAhorro", m."idMovimiento"
from cliente c--, movimiento m, ahorro a
left join prestamo p
on c."idCliente" = p."idCliente"
inner join ahorro a
on c."idCliente" = a."idCliente"
inner join movimiento m
on a."idAhorro" = m."idAhorro"
where p."idCliente" is NULL
order by c."idCliente"

--TOTAL clientes que tienen cta inversion, cta ahorro, sin prestamos
select 'cta de ahorro, inversiones y sin prestamos' as personas,
count(DISTINCT(c."idCliente")) as cantidad
from cliente c
left JOIN prestamo p
on c."idCliente" = p."idCliente"
inner join ahorro a
on c."idCliente" = a."idCliente"
inner join movimiento m
on a."idAhorro" = m."idAhorro"
where p."idCliente" is null;


--clientes que pidieron prestamo a menos de 3 meses de ingresar al banco
--3 meses = 90 dias
select c."idCliente", "fafiliacion",
"fcontratacion" as fecha_prestamo,
"fcontratacion"-"fafiliacion" as days_from_afiliacion_to_first_prestamo
from cliente c, prestamo p
where 
c."idCliente" = p."idCliente" and "fcontratacion"-"fafiliacion" < 90
group by c."idCliente", p."fcontratacion"
order by c."idCliente"

--TOTAL de clientes que pidieron prestamo a menos de 3 meses de ingresar al banco
SELECT 'tienen prestamos a menos de 3 meses de ingresar al banco' AS personas,
COUNT(DISTINCT(c."idCliente")) AS cantidad
FROM cliente c
INNER JOIN prestamo p
ON c."idCliente" = p."idCliente"
WHERE
"fcontratacion"-"fafiliacion" < 90

--Clientes que pueden cubrir el saldo de su préstamo con su cuenta de ahorro.
select 
p."idCliente", p."monto" as monto_prestamo, m."debe"-m."haber" as monto_ahorro, a."idAhorro"
from
prestamo p
inner join ahorro a
on p."idCliente" = a."idCliente"
inner join movimiento m
on a."idAhorro" = m."idAhorro"
where ("debe"-"haber")-p."monto" >= 0
order by p."idCliente"

--TOTAL Clientes que pueden cubrir el saldo de su préstamo con su cuenta de ahorro.
SELECT 'pueden pagar su prestamo con su cuenta de ahorro' AS personas,
COUNT(DISTINCT(p."idCliente")) AS cantidad
from
prestamo p
inner join ahorro a
on p."idCliente" = a."idCliente"
inner join movimiento m
on a."idAhorro" = m."idAhorro"
where ("debe"-"haber")-p."monto" >= 0

--Total de prestamos otorgados por mes.
select '01-enero' as mes, count("idPrestamo") as total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 1
union
select '02-febrero' as mes, count("idPrestamo") as total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 2
union
select '03-marzo' as mes, count("idPrestamo") as total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 3
union
select '04-abril' as mes, count("idPrestamo") as total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 4
union
select '05-mayo' as mes, count("idPrestamo") as total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 5
union
select '06-junio' as mes, count("idPrestamo") as total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 6
union
select '07-julio' as mes, count("idPrestamo") as total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 7
union
select '08-agosto' as mes, count("idPrestamo") as total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 8
union
select '09-septiembre' as mes, count("idPrestamo") as total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 9
union
select '10-octubre' as mes, count("idPrestamo") as total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 10
union
select '11-noviembre' as mes, count("idPrestamo") as total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 11
union
select '12-diciembre' as mes, count("idPrestamo") as total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 12
order by mes

--Total del monto de prestamos otorgados por mes.
select '01-enero' as mes, sum("idPrestamo") as monto_total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 1