set search_path to banco;
select * from cliente where "idCliente" = 1
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


--8.- clientes que pidieron prestamo a menos de 3 meses de ingresar al banco
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

--11.-Total de prestamos otorgados por mes.
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

--12.-Total del monto de prestamos otorgados por mes.
select '01-enero' as mes, sum("monto") as monto_total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 1
union
select '02-febrero' as mes, sum("monto") as monto_total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 2
union
select '03-marzo' as mes, sum("monto") as monto_total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 3
union
select '04-abril' as mes, sum("monto") as monto_total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 4
union
select '05-mayo' as mes, sum("monto") as monto_total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 5
union
select '06-junio' as mes, sum("monto") as monto_total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 6
union
select '07-julio' as mes, sum("monto") as monto_total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 7
union
select '08-agosto' as mes, sum("monto") as monto_total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 8
union
select '09-septiembre' as mes, sum("monto") as monto_total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 9
union
select '10-octubre' as mes, sum("monto") as monto_total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 10
union
select '11-noviembre' as mes, sum("monto") as monto_total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 11
union
select '12-diciembre' as mes, sum("monto") as monto_total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 12
order by mes


--13.-Total de ingresos en cuentas de ahorro y cuentas de inversión por cliente. (solo clientes que tienen ambas cuentas)
--SUM, movimiento.debe, movimiento inner join ahorro 
select c."idCliente", a."idAhorro", sum(m."debe")
from cliente c
inner join ahorro a
on c."idCliente" = a."idCliente"
inner join movimiento m
on a."idAhorro" = m."idAhorro"
group by c."idCliente", a."idAhorro"
order by c."idCliente"
limit 1000

--14.-Total de ingresos por intereses en créditos (prestamos)
--lo que gana el banco por intereses generados
select sum((p."monto"*0.15)+(p."monto"*0.04)) as ingresos
from prestamo p
--select p."idCliente", p."interes", p."interesmoratorio", p."monto", (p."monto"*0.15)+(p."monto"*0.04) as ganancia
--from prestamo p
--order by p."idCliente"
--limit 2000


--16.-¿Que sexo ahorra mas en cuentas de ahorro?
--cuanto ahorro hubo de todas las mujeres y todos los hombres
select  c."sexo", sum(m."debe") as ahorros_totales
from cliente c
inner join ahorro a
on c."idCliente" = a."idCliente"
inner join movimiento m
on a."idAhorro" = m."idAhorro"
group by c."sexo"
order by ahorros_totales DESC


--17.-¿Que sexo ahorra mas en cuentas de inversión?
select  c."sexo", sum(m."debe") as ahorros_totales
from cliente c
inner join ahorro a
on c."idCliente" = a."idCliente"
inner join movimiento m
on a."idAhorro" = m."idAhorro"
group by c."sexo"
order by ahorros_totales DES

--18.-¿En que mes ahorran mas las mujeres?
select c."sexo" as sexo, '01-enero' as mes, sum(m."debe") as monto_total_ahorro
from cliente c
inner join ahorro a
on c."idCliente" = a."idCliente"
inner join movimiento m
on a."idAhorro" = m."idAhorro"
where date_part('month', a."fcontratacion") = 1 and c."sexo" = 'F'
group by sexo
union
select c."sexo" as sexo, '02-febrero' as mes, sum(m."debe") as monto_total_ahorro
from cliente c
inner join ahorro a
on c."idCliente" = a."idCliente"
inner join movimiento m
on a."idAhorro" = m."idAhorro"
where date_part('month', a."fcontratacion") = 2 and c."sexo" = 'F'
group by sexo
union
select c."sexo" as sexo, '03-marzo' as mes, sum(m."debe") as monto_total_ahorro
from cliente c
inner join ahorro a
on c."idCliente" = a."idCliente"
inner join movimiento m
on a."idAhorro" = m."idAhorro"
where date_part('month', a."fcontratacion") = 3 and c."sexo" = 'F'
group by sexo
union
select c."sexo" as sexo, '04-abril' as mes, sum(m."debe") as monto_total_ahorro
from cliente c
inner join ahorro a
on c."idCliente" = a."idCliente"
inner join movimiento m
on a."idAhorro" = m."idAhorro"
where date_part('month', a."fcontratacion") = 4 and c."sexo" = 'F'
group by sexo
union
select c."sexo" as sexo, '05-mayo' as mes, sum(m."debe") as monto_total_ahorro
from cliente c
inner join ahorro a
on c."idCliente" = a."idCliente"
inner join movimiento m
on a."idAhorro" = m."idAhorro"
where date_part('month', a."fcontratacion") = 5 and c."sexo" = 'F'
group by sexo
union
select c."sexo" as sexo, '06-junio' as mes, sum(m."debe") as monto_total_ahorro
from cliente c
inner join ahorro a
on c."idCliente" = a."idCliente"
inner join movimiento m
on a."idAhorro" = m."idAhorro"
where date_part('month', a."fcontratacion") = 6 and c."sexo" = 'F'
group by sexo
union
select c."sexo" as sexo, '07-julio' as mes, sum(m."debe") as monto_total_ahorro
from cliente c
inner join ahorro a
on c."idCliente" = a."idCliente"
inner join movimiento m
on a."idAhorro" = m."idAhorro"
where date_part('month', a."fcontratacion") = 7 and c."sexo" = 'F'
group by sexo
union
select c."sexo" as sexo, '08-agosto' as mes, sum(m."debe") as monto_total_ahorro
from cliente c
inner join ahorro a
on c."idCliente" = a."idCliente"
inner join movimiento m
on a."idAhorro" = m."idAhorro"
where date_part('month', a."fcontratacion") = 8 and c."sexo" = 'F'
group by sexo
union
select c."sexo" as sexo, '09-septiembre' as mes, sum(m."debe") as monto_total_ahorro
from cliente c
inner join ahorro a
on c."idCliente" = a."idCliente"
inner join movimiento m
on a."idAhorro" = m."idAhorro"
where date_part('month', a."fcontratacion") = 9 and c."sexo" = 'F'
group by sexo
union
select c."sexo" as sexo, '10-octubre' as mes, sum(m."debe") as monto_total_ahorro
from cliente c
inner join ahorro a
on c."idCliente" = a."idCliente"
inner join movimiento m
on a."idAhorro" = m."idAhorro"
where date_part('month', a."fcontratacion") = 10 and c."sexo" = 'F'
group by sexo
union
select c."sexo" as sexo, '11-noviembre' as mes, sum(m."debe") as monto_total_ahorro
from cliente c
inner join ahorro a
on c."idCliente" = a."idCliente"
inner join movimiento m
on a."idAhorro" = m."idAhorro"
where date_part('month', a."fcontratacion") = 11 and c."sexo" = 'F'
group by sexo
union
select c."sexo" as sexo, '12-diciembre' as mes, sum(m."debe") as monto_total_ahorro
from cliente c
inner join ahorro a
on c."idCliente" = a."idCliente"
inner join movimiento m
on a."idAhorro" = m."idAhorro"
where date_part('month', a."fcontratacion") = 12 and c."sexo" = 'F'
group by sexo
order by monto_total_ahorro DESC
limit 1

--19.-¿En que mes piden mas prestamos los hombres?
select c."sexo" as sexo, '01-enero' as mes, count(p."idPrestamo") as prestamos_requeridos_por_hombres
from prestamo p
inner join cliente c
on c."idCliente" = p."idCliente"
where c."sexo" = 'M' and date_part('month', p."fcontratacion") = 1
group by c."sexo"
union
select c."sexo" as sexo, '02-febrero' as mes, count(p."idPrestamo") as prestamos_requeridos_por_hombres
from prestamo p
inner join cliente c
on c."idCliente" = p."idCliente"
where c."sexo" = 'M' and date_part('month', p."fcontratacion") = 2
group by c."sexo"
union
select c."sexo" as sexo, '03-marzo' as mes, count(p."idPrestamo") as prestamos_requeridos_por_hombres
from prestamo p
inner join cliente c
on c."idCliente" = p."idCliente"
where c."sexo" = 'M' and date_part('month', p."fcontratacion") = 3
group by c."sexo"
union
select c."sexo" as sexo, '04-abril' as mes, count(p."idPrestamo") as prestamos_requeridos_por_hombres
from prestamo p
inner join cliente c
on c."idCliente" = p."idCliente"
where c."sexo" = 'M' and date_part('month', p."fcontratacion") = 4
group by c."sexo"
union
select c."sexo" as sexo, '05-mayo' as mes, count(p."idPrestamo") as prestamos_requeridos_por_hombres
from prestamo p
inner join cliente c
on c."idCliente" = p."idCliente"
where c."sexo" = 'M' and date_part('month', p."fcontratacion") = 5
group by c."sexo"
union
select c."sexo" as sexo, '06-junio' as mes, count(p."idPrestamo") as prestamos_requeridos_por_hombres
from prestamo p
inner join cliente c
on c."idCliente" = p."idCliente"
where c."sexo" = 'M' and date_part('month', p."fcontratacion") = 6
group by c."sexo"
union
select c."sexo" as sexo, '07-julio' as mes, count(p."idPrestamo") as prestamos_requeridos_por_hombres
from prestamo p
inner join cliente c
on c."idCliente" = p."idCliente"
where c."sexo" = 'M' and date_part('month', p."fcontratacion") = 7
group by c."sexo"
union
select c."sexo" as sexo, '08-agosto' as mes, count(p."idPrestamo") as prestamos_requeridos_por_hombres
from prestamo p
inner join cliente c
on c."idCliente" = p."idCliente"
where c."sexo" = 'M' and date_part('month', p."fcontratacion") = 8
group by c."sexo"
union
select c."sexo" as sexo, '09-septiembre' as mes, count(p."idPrestamo") as prestamos_requeridos_por_hombres
from prestamo p
inner join cliente c
on c."idCliente" = p."idCliente"
where c."sexo" = 'M' and date_part('month', p."fcontratacion") = 9
group by c."sexo"
union
select c."sexo" as sexo, '10-octubre' as mes, count(p."idPrestamo") as prestamos_requeridos_por_hombres
from prestamo p
inner join cliente c
on c."idCliente" = p."idCliente"
where c."sexo" = 'M' and date_part('month', p."fcontratacion") = 10
group by c."sexo"
union
select c."sexo" as sexo, '11-noviembre' as mes, count(p."idPrestamo") as prestamos_requeridos_por_hombres
from prestamo p
inner join cliente c
on c."idCliente" = p."idCliente"
where c."sexo" = 'M' and date_part('month', p."fcontratacion") = 11
group by c."sexo"
union
select c."sexo" as sexo, '12-diciembre' as mes, count(p."idPrestamo") as prestamos_requeridos_por_hombres
from prestamo p
inner join cliente c
on c."idCliente" = p."idCliente"
where c."sexo" = 'M' and date_part('month', p."fcontratacion") = 12
group by c."sexo"
order by prestamos_requeridos_por_hombres DESC
limit 1

--20.- ¿Que ejecutivos prestan mas dinero, los hombres o las mujeres?
set search_path to banco
select count(p."idEjecutivo") as eje_hombres
from prestamo p
inner join ejecutivo e
on p."idEjecutivo" = e."idEjecutivo"
where e.sexo = 'M'
union
select count(p."idEjecutivo") as eje_mujeres
from prestamo p
inner join ejecutivo e
on p."idEjecutivo" = e."idEjecutivo"
where e.sexo = 'F'

--22.- ¿En que mes prestan mas dinero los ejecutivos?
select '01-enero' as mes, sum("monto") as total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 1
union
select '02-febrero' as mes, sum("monto") as total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 2
union
select '03-marzo' as mes, sum("monto") as total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 3
union
select '04-abril' as mes, sum("monto") as total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 4
union
select '05-mayo' as mes, sum("monto") as total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 5
union
select '06-junio' as mes, sum("monto") as total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 6
union
select '07-julio' as mes, sum("monto") as total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 7
union
select '08-agosto' as mes, sum("monto") as total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 8
union
select '09-septiembre' as mes, sum("monto") as total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 9
union
select '10-octubre' as mes, sum("monto") as total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 10
union
select '11-noviembre' as mes, sum("monto") as total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 11
union
select '12-diciembre' as mes, sum("monto") as total_prestamos
from prestamo
where date_part('month', "fcontratacion") = 12
order by mes DESC
limit 1

--23.- ¿En que mes prestan mas dinero los ejecutivos menores de 30 años?
select '01-enero' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 1 and date_part('year', age(e."fnacimiento")) < 30
union
select '02-febrero' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 2 and date_part('year', age(e."fnacimiento")) < 30
union
select '03-marzo' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 3 and date_part('year', age(e."fnacimiento")) < 30
union
select '04-abril' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 4 and date_part('year', age(e."fnacimiento")) < 30
union
select '05-mayo' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 5 and date_part('year', age(e."fnacimiento")) < 30
union
select '06-junio' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 6 and date_part('year', age(e."fnacimiento")) < 30
union
select '07-julio' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 7 and date_part('year', age(e."fnacimiento")) < 30
union
select '08-agosto' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 8 and date_part('year', age(e."fnacimiento")) < 30
union
select '09-septiembre' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 9 and date_part('year', age(e."fnacimiento")) < 30
union
select '10-octubre' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 10 and date_part('year', age(e."fnacimiento")) < 30
union
select '11-noviembre' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 11 and date_part('year', age(e."fnacimiento")) < 30
union
select '12-diciembre' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 12 and date_part('year', age(e."fnacimiento")) < 30
order by total_prestamos DESC
limit 1

--24.- ¿En que mes prestan mas dinero los ejecutivos mayores de 30 años?
select '01-enero' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 1 and date_part('year', age(e."fnacimiento")) >= 30
union
select '02-febrero' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 2 and date_part('year', age(e."fnacimiento")) >= 30
union
select '03-marzo' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 3 and date_part('year', age(e."fnacimiento")) >= 30
union
select '04-abril' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 4 and date_part('year', age(e."fnacimiento")) >= 30
union
select '05-mayo' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 5 and date_part('year', age(e."fnacimiento")) >= 30
union
select '06-junio' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 6 and date_part('year', age(e."fnacimiento")) >= 30
union
select '07-julio' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 7 and date_part('year', age(e."fnacimiento")) >= 30
union
select '08-agosto' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 8 and date_part('year', age(e."fnacimiento")) >= 30
union
select '09-septiembre' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 9 and date_part('year', age(e."fnacimiento")) >= 30
union
select '10-octubre' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 10 and date_part('year', age(e."fnacimiento")) >= 30
union
select '11-noviembre' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 11 and date_part('year', age(e."fnacimiento")) >= 30
union
select '12-diciembre' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 12 and date_part('year', age(e."fnacimiento")) >= 30
order by total_prestamos DESC
--limit 1


--25.- ¿En que mes prestan mas dinero los ejecutivos menores de 30 años y de sexo femenino?
select '01-enero' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 1 and date_part('year', age(e."fnacimiento")) < 30
and e."sexo" = 'F'
union
select '02-febrero' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 2 and date_part('year', age(e."fnacimiento")) < 30
and e."sexo" = 'F'
union
select '03-marzo' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 3 and date_part('year', age(e."fnacimiento")) < 30
and e."sexo" = 'F'
union
select '04-abril' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 4 and date_part('year', age(e."fnacimiento")) < 30
and e."sexo" = 'F'
union
select '05-mayo' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 5 and date_part('year', age(e."fnacimiento")) < 30
and e."sexo" = 'F'
union
select '06-junio' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 6 and date_part('year', age(e."fnacimiento")) < 30
and e."sexo" = 'F'
union
select '07-julio' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 7 and date_part('year', age(e."fnacimiento")) < 30
and e."sexo" = 'F'
union
select '08-agosto' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 8 and date_part('year', age(e."fnacimiento")) < 30
and e."sexo" = 'F'
union
select '09-septiembre' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 9 and date_part('year', age(e."fnacimiento")) < 30
and e."sexo" = 'F'
union
select '10-octubre' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 10 and date_part('year', age(e."fnacimiento")) < 30
and e."sexo" = 'F'
union
select '11-noviembre' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 11 and date_part('year', age(e."fnacimiento")) < 30
and e."sexo" = 'F'
union
select '12-diciembre' as mes, sum("monto") as total_prestamos
from prestamo p, ejecutivo e
where date_part('month', p."fcontratacion") = 12 and date_part('year', age(e."fnacimiento")) < 30
and e."sexo" = 'F'
order by total_prestamos DESC
limit 1


--28.-¿Que cantidad promedio de le presta a los clientes que no tienen cuentas de ahorro?
select c."idCliente", a."idAhorro", p."idPrestamo", p."monto"
from cliente c
left join ahorro a
on c."idCliente" = a."idCliente"
inner join prestamo p
on c."idCliente" = p."idCliente"
where a."idCliente" is NULL --and a."idCliente" = p."idCliente"
order by c."idCliente"

select 'clientes sin cta ahorro' as personas, round(avg(p."monto")) as promedio_prestamos
from cliente c
left join ahorro a
on c."idCliente" = a."idCliente"
inner join prestamo p
on c."idCliente" = p."idCliente"
where a."idCliente" is NULL --and a."idCliente" = p."idCliente"


--29.-¿Se le presta mas a los cliente con cuentas de ahorro o a los que no tiene cuentas de ahorro?
select 'clientes CON cta ahorro' as personas, sum(p."monto") as total_prestamos
from cliente c
inner join ahorro a
on c."idCliente" = a."idCliente"
inner join prestamo p
on c."idCliente" = p."idCliente"
--where a."idCliente" is NULL --and a."idCliente" = p."idCliente"
union
select 'clientes SIN cta ahorro' as personas, sum(p."monto") as total_prestamos
from cliente c
left join ahorro a
on c."idCliente" = a."idCliente"
inner join prestamo p
on c."idCliente" = p."idCliente"
where a."idCliente" is NULL --and a."idCliente" = p."idCliente"
order by total_prestamos DESC


--30.-¿Se le presta mas dinero a los clientes que solo tienen cuentas de ahorro o 
--a los que solo tienen cuentas de inversión?
select 'clientes CON cta ahorro' as personas, sum(p."monto") as total_prestamos
from cliente c
inner join ahorro a
on c."idCliente" = a."idCliente"
inner join prestamo p
on c."idCliente" = p."idCliente"
union
select 'clientes CON cta ahorro e inversion' as personas, sum(p."monto") as total_prestamos
from cliente c
inner join ahorro a
on c."idCliente" = a."idCliente"
inner join movimiento m
on a."idAhorro" = m."idAhorro"
inner join prestamo p
on c."idCliente" = p."idCliente"
order by total_prestamos DESC

select * from cliente
where "idCliente" = 87726
select * from ahorro
where "idAhorro" <= 10

--