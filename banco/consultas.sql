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


--clientes que tienen cta inversion, cta ahorro, sin prestamos
select 'con inversiones, cta ahorro y sin prestamos' as personas,
count(DISTINCT(c."idCliente")) as cantidad
from cliente c
left JOIN prestamo p
on c."idCliente" = p."idCliente"
inner join ahorro a
on c."idCliente" = a."idCliente"
inner join movimiento m
on a."idAhorro" = m."idAhorro"
where p."idCliente" is null and  a."idCliente" is null

--total de clientes que tienen cta inversion y ningun prestamo
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

--clientes que pidieron un prestamos a menos de 3 meses de ingresar al banco

select distinct("idCliente") as clientes, min("fcontratacion") from prestamo as fecha
group by clientes
order by clientes;

select "idCliente", min("fcontratacion") as fecha
from prestamo
where "idCliente" = 1
group by "idCliente"

select "idCliente", min("fcontratacion") as fecha
from ahorro
where "idCliente" = 1
group by "idCliente"
order by fecha
--limit 1;

select distinct("idAhorro") as clientes,min("fmovimiento") from movimiento as fecha
group by clientes
order by clientes;

select * from movimiento
order by "idAhorro"


