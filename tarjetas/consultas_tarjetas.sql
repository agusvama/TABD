set search_path to tarjeta;

--1.- Porcentaje de clientes por sexo.
select "sexo", count("sexo"), ((count("sexo")*100)/100000.0) as "porcentaje" from cliente
group by "sexo";

--2.- Porcentaje de clientes en los siguientes rangos de edad:
--15 a 17
--18 a 30
--31 a 40
-- 41 a 61
-- 61 o mas
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

--3.- Porcentaje de clientes por sexo y rangos de edad.
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

--4.- Numero de clientes por limites de consumo (Ejemplo: limite de credito 10000 - 300 clientes, limite de
--crédito 20000 - 400 clientes. usar los siguientes rangos.
-- 0 a 3000
--3001-5000
--5001-10000
--10000-25000
--25001-50000
--50001-100000
--100001 en adelante.

select '0 a 3000' as "limite de credito",  count("idAhorro") as "clientes"
from tarjeta_datos
where "limite" between 0 and 3000
union
select '3001 a 5000' as "limite de credito",  count("idAhorro") as "clientes"
from tarjeta_datos
where "limite" between 3001 and 5000
union
select '5001 a 10000' as "limite de credito",  count("idAhorro") as "clientes"
from tarjeta_datos
where "limite" between 5001 and 10000
union
select '10001 a 25000' as "limite de credito",  count("idAhorro") as "clientes"
from tarjeta_datos
where "limite" between 10001 and 25000
union
select '25001 a 50000' as "limite de credito",  count("idAhorro") as "clientes"
from tarjeta_datos
where "limite" between 25001 and 50000
union
select '50001 a 100000' as "limite de credito",  count("idAhorro") as "clientes"
from tarjeta_datos
where "limite" between 50001 and 100000
union
select '100001 en adelante' as "limite de credito",  count("idAhorro") as "clientes"
from tarjeta_datos
where "limite" >= 100001
order by "limite de credito"

--5.- Porcentaje y numero de tarjetas otorgadas por mes.
--select min("fechaEmision"), max("fechaEmision")
--from tarjeta_datos
select 'enero 94' as mes, count("idAhorro") as "tarjetas", round((count("idAhorro") *100)/50000.0) as porcentaje
from tarjeta_datos
where date_part('year', "fechaEmision") = 1994
union
select 'enero 95' as mes, count("idAhorro") as "tarjetas", round((count("idAhorro") *100)/50000.0) as porcentaje
from tarjeta_datos
where date_part('year', "fechaEmision") = 1995
union
select 'enero 96' as mes, count("idAhorro") as "tarjetas", round((count("idAhorro") *100)/50000.0) as porcentaje
from tarjeta_datos
where date_part('year', "fechaEmision") = 1996
union
select 'enero 97' as mes, count("idAhorro") as "tarjetas", round((count("idAhorro") *100)/50000.0) as porcentaje
from tarjeta_datos
where date_part('year', "fechaEmision") = 1997
union
select 'enero 98' as mes, count("idAhorro") as "tarjetas", round((count("idAhorro") *100)/50000.0) as porcentaje
from tarjeta_datos
where date_part('year', "fechaEmision") = 1998
union
select 'enero 99' as mes, count("idAhorro") as "tarjetas", round((count("idAhorro") *100)/50000.0) as porcentaje
from tarjeta_datos
where date_part('year', "fechaEmision") = 1999
union
select 'enero 00' as mes, count("idAhorro") as "tarjetas", round((count("idAhorro") *100)/50000.0) as porcentaje
from tarjeta_datos
where date_part('year', "fechaEmision") = 2000
union
select 'enero 01' as mes, count("idAhorro") as "tarjetas", round((count("idAhorro") *100)/50000.0) as porcentaje
from tarjeta_datos
where date_part('year', "fechaEmision") = 2001
union
select 'enero 02' as mes, count("idAhorro") as "tarjetas", round((count("idAhorro") *100)/50000.0) as porcentaje
from tarjeta_datos
where date_part('year', "fechaEmision") = 2002
union
select 'enero 03' as mes, count("idAhorro") as "tarjetas", round((count("idAhorro") *100)/50000.0) as porcentaje
from tarjeta_datos
where date_part('year', "fechaEmision") = 2003
union
select 'enero 04' as mes, count("idAhorro") as "tarjetas", round((count("idAhorro") *100)/50000.0) as porcentaje
from tarjeta_datos
where date_part('year', "fechaEmision") = 2004
union
select 'enero 05' as mes, count("idAhorro") as "tarjetas", round((count("idAhorro") *100)/50000.0) as porcentaje
from tarjeta_datos
where date_part('year', "fechaEmision") = 2005
union
select 'enero 06' as mes, count("idAhorro") as "tarjetas", round((count("idAhorro") *100)/50000.0) as porcentaje
from tarjeta_datos
where date_part('year', "fechaEmision") = 2006
union
select 'enero 07' as mes, count("idAhorro") as "tarjetas", round((count("idAhorro") *100)/50000.0) as porcentaje
from tarjeta_datos
where date_part('year', "fechaEmision") = 2007
union
select 'enero 08' as mes, count("idAhorro") as "tarjetas", round((count("idAhorro") *100)/50000.0) as porcentaje
from tarjeta_datos
where date_part('year', "fechaEmision") = 2008
union
select 'enero 09' as mes, count("idAhorro") as "tarjetas", round((count("idAhorro") *100)/50000.0) as porcentaje
from tarjeta_datos
where date_part('year', "fechaEmision") = 2009
union
select 'enero 10' as mes, count("idAhorro") as "tarjetas", round((count("idAhorro") *100)/50000.0) as porcentaje
from tarjeta_datos
where date_part('year', "fechaEmision") = 2010
union
select 'enero 11' as mes, count("idAhorro") as "tarjetas", round((count("idAhorro") *100)/50000.0) as porcentaje
from tarjeta_datos
where date_part('year', "fechaEmision") = 2011
union
select 'enero 12' as mes, count("idAhorro") as "tarjetas", round((count("idAhorro") *100)/50000.0) as porcentaje
from tarjeta_datos
where date_part('year', "fechaEmision") = 2012
union
select 'enero 13' as mes, count("idAhorro") as "tarjetas", round((count("idAhorro") *100)/50000.0) as porcentaje
from tarjeta_datos
where date_part('year', "fechaEmision") = 2013
union
select 'enero 14' as mes, count("idAhorro") as "tarjetas", round((count("idAhorro") *100)/50000.0) as porcentaje
from tarjeta_datos
where date_part('year', "fechaEmision") = 2014
union
select 'enero 15' as mes, count("idAhorro") as "tarjetas", round((count("idAhorro") *100)/50000.0) as porcentaje
from tarjeta_datos
where date_part('year', "fechaEmision") = 2015
union
select 'enero 16' as mes, count("idAhorro") as "tarjetas", round((count("idAhorro") *100)/50000.0) as porcentaje
from tarjeta_datos
where date_part('year', "fechaEmision") = 2016
union
select 'enero 17' as mes, count("idAhorro") as "tarjetas", round((count("idAhorro") *100)/50000.0) as porcentaje
from tarjeta_datos
where date_part('year', "fechaEmision") = 2017

--UPDATE tarjeta_datos SET "fechaEmision" = '2016/01/01' WHERE "fechaEmision" = '2017/01/01'

--6.- ¿Quien usa mas veces su TC las mujeres o los hombres?
select c."idCliente", c.sexo, tc."idTarjeta", o.operacion
from cliente c
inner join tarjeta_credito tc
on c."idAhorro" = tc."idAhorro"
inner join operacion o
on tc."idTarjeta" = o."idTarjeta"
limit 10

select 'F' as sexo, count(o."idTarjeta")
from tarjeta_credito tc
inner join cliente c
on tc."idAhorro"  = c."idAhorro"
inner join operacion o
on tc."idTarjeta" = o."idTarjeta"
where c.sexo = 'F'

UNION
select 'M' as sexo, count(o."idTarjeta")
from tarjeta_credito tc
inner join cliente c
on tc."idAhorro"  = c."idAhorro"
inner join operacion o
on tc."idTarjeta" = o."idTarjeta"
where c.sexo = 'M'


--7.- ¿Quien gasta mas con TC las mujeres o los hombres?
--select * from operacion where operacion > 0, sexo = F, M, inner join: tc, cliente, operacion
select 'F' as sexo, count(o."idTarjeta")
from tarjeta_credito tc
inner join cliente c
on tc."idAhorro"  = c."idAhorro"
inner join operacion o
on tc."idTarjeta" = o."idTarjeta"
where c.sexo = 'F' and operacion < 0

UNION
select 'M' as sexo, count(o."idTarjeta")
from tarjeta_credito tc
inner join cliente c
on tc."idAhorro"  = c."idAhorro"
inner join operacion o
on tc."idTarjeta" = o."idTarjeta"
where c.sexo = 'M'and operacion < 0

--8.- Gasto promedio de las tarjetas de crédito por mes.
select '01-enero' as mes, avg(operacion)
from operacion
where operacion < 0 and date_part('month', fecha_operacion) = 1
UNION
select '02-febrero' as mes, avg(operacion)
from operacion
where operacion < 0 and date_part('month', fecha_operacion) = 2
UNION
select '03-marzo' as mes, avg(operacion)
from operacion
where operacion < 0 and date_part('month', fecha_operacion) = 3
UNION
select '04-abril' as mes, avg(operacion)
from operacion
where operacion < 0 and date_part('month', fecha_operacion) = 4
UNION
select '05-mayo' as mes, avg(operacion)
from operacion
where operacion < 0 and date_part('month', fecha_operacion) = 5
UNION
select '06-junio' as mes, avg(operacion)
from operacion
where operacion < 0 and date_part('month', fecha_operacion) = 6
UNION
select '07-julio' as mes, avg(operacion)
from operacion
where operacion < 0 and date_part('month', fecha_operacion) = 7
UNION
select '08-agosto' as mes, avg(operacion)
from operacion
where operacion < 0 and date_part('month', fecha_operacion) = 8
UNION
select '09-septiembre' as mes, avg(operacion)
from operacion
where operacion < 0 and date_part('month', fecha_operacion) = 9
UNION
select '10-octubre' as mes, avg(operacion)
from operacion
where operacion < 0 and date_part('month', fecha_operacion) = 10
UNION
select '11-noviembre' as mes, avg(operacion)
from operacion
where operacion < 0 and date_part('month', fecha_operacion) = 11
UNION
select '12-diciembre' as mes, avg(operacion)
from operacion
where operacion < 0 and date_part('month', fecha_operacion) = 12
--group by "idTarjeta"

--9.- Gasto promedio de las tarjetas de crédito por mes y por sexo.
--select * from operacion
select '01-enero' as mes, 'M' as sexo, avg(operacion)
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 1 and c.sexo = 'M'
UNION
select '01-enero' as mes, 'F' as sexo, avg(operacion)
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 1 and c.sexo = 'F'

UNION
select '02-febrero' as mes, 'M' as sexo, avg(operacion)
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 2 and c.sexo = 'M'
UNION
select '02-febrero' as mes, 'F' as sexo, avg(operacion)
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 2 and c.sexo = 'F'

UNION
select '03-marzo' as mes, 'M' as sexo, avg(operacion)
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 3 and c.sexo = 'M'
UNION
select '03-marzo' as mes, 'F' as sexo, avg(operacion)
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 3 and c.sexo = 'F'

UNION
select '04-abril' as mes, 'M' as sexo, avg(operacion)
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 4 and c.sexo = 'M'
UNION
select '04-abril' as mes, 'F' as sexo, avg(operacion)
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 4 and c.sexo = 'F'

UNION
select '05-mayo' as mes, 'M' as sexo, avg(operacion)
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 5 and c.sexo = 'M'
UNION
select '05-mayo' as mes, 'F' as sexo, avg(operacion)
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 5 and c.sexo = 'F'

UNION
select '06-junio' as mes, 'M' as sexo, avg(operacion)
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 6 and c.sexo = 'M'
UNION
select '06-junio' as mes, 'F' as sexo, avg(operacion)
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 6 and c.sexo = 'F'

UNION
select '07-julio' as mes, 'M' as sexo, avg(operacion)
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 7 and c.sexo = 'M'
UNION
select '07-julio' as mes, 'F' as sexo, avg(operacion)
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 7 and c.sexo = 'F'

UNION
select '08-agosto' as mes, 'M' as sexo, avg(operacion)
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 8 and c.sexo = 'M'
UNION
select '08-agosto' as mes, 'F' as sexo, avg(operacion)
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 8 and c.sexo = 'F'

UNION
select '09-septiembre' as mes, 'M' as sexo, avg(operacion)
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 9 and c.sexo = 'M'
UNION
select '09-septiembre' as mes, 'F' as sexo, avg(operacion)
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 9 and c.sexo = 'F'

UNION
select '10-octubre' as mes, 'M' as sexo, avg(operacion)
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 10 and c.sexo = 'M'
UNION
select '10-octubre' as mes, 'F' as sexo, avg(operacion)
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 10 and c.sexo = 'F'

UNION
select '11-noviembre' as mes, 'M' as sexo, avg(operacion)
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 11 and c.sexo = 'M'
UNION
select '11-noviembre' as mes, 'F' as sexo, avg(operacion)
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 11 and c.sexo = 'F'

UNION
select '12-diciembre' as mes, 'M' as sexo, avg(operacion)
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 12 and c.sexo = 'M'
UNION
select '12-diciembre' as mes, 'F' as sexo, avg(operacion)
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 12 and c.sexo = 'F'
order by mes

--10.- Gasto promedio de las tarjetas de crédito por mes, sexo y rango de edad.
--select date_part('year', age(fnacimiento)) as edad
--from cliente
--where date_part('year', age(fnacimiento)) BETWEEN 18 and 30

select '01-enero' as mes, 'M' as sexo, '15 a 17' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 1 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 15 and 17
UNION
select '01-enero' as mes, 'F' as sexo, '15 a 17' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 1 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 15 and 17

UNION
select '01-enero' as mes, 'M' as sexo, '18 a 31' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 1 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 18 and 31
UNION
select '01-enero' as mes, 'F' as sexo, '18 a 31' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 1 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 18 and 31

UNION
select '01-enero' as mes, 'M' as sexo, '31 a 40' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 1 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 31 and 40
UNION
select '01-enero' as mes, 'F' as sexo, '31 a 40' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 1 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 31 and 40

UNION
select '01-enero' as mes, 'M' as sexo, '41 a 61' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 1 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 41 and 61
UNION
select '01-enero' as mes, 'F' as sexo, '41 a 61' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 1 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 41 and 61

UNION
select '01-enero' as mes, 'M' as sexo, '61 o mas' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 1 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) > 61
UNION
select '01-enero' as mes, 'F' as sexo, '61 o mas' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 1 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) > 61

--ahora la misma consulta, cambiando el mes a febrero
UNION
select '02-febrero' as mes, 'M' as sexo, '15 a 17' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 2 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 15 and 17
UNION
select '02-febrero' as mes, 'F' as sexo, '15 a 17' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 2 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 15 and 17

UNION
select '02-febrero' as mes, 'M' as sexo, '18 a 31' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 2 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 18 and 31
UNION
select '02-febrero' as mes, 'F' as sexo, '18 a 31' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 2 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 18 and 31

UNION
select '02-febrero' as mes, 'M' as sexo, '31 a 40' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 2 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 31 and 40
UNION
select '02-febrero' as mes, 'F' as sexo, '31 a 40' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 2 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 31 and 40

UNION
select '02-febrero' as mes, 'M' as sexo, '41 a 61' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 2 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 41 and 61
UNION
select '02-febrero' as mes, 'F' as sexo, '41 a 61' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 2 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 41 and 61

UNION
select '02-febrero' as mes, 'M' as sexo, '61 o mas' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 2 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) > 61
UNION
select '02-febrero' as mes, 'F' as sexo, '61 o mas' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 2 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) > 61

--ahora la misma consulta, cambiando el mes a marzo
UNION
select '03-marzo' as mes, 'M' as sexo, '15 a 17' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 3 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 15 and 17
UNION
select '03-marzo' as mes, 'F' as sexo, '15 a 17' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 3 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 15 and 17

UNION
select '03-marzo' as mes, 'M' as sexo, '18 a 31' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 3 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 18 and 31
UNION
select '03-marzo' as mes, 'F' as sexo, '18 a 31' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 3 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 18 and 31

UNION
select '03-marzo' as mes, 'M' as sexo, '31 a 40' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 3 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 31 and 40
UNION
select '03-marzo' as mes, 'F' as sexo, '31 a 40' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 3 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 31 and 40

UNION
select '03-marzo' as mes, 'M' as sexo, '41 a 61' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 3 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 41 and 61
UNION
select '03-marzo' as mes, 'F' as sexo, '41 a 61' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 3 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 41 and 61

UNION
select '03-marzo' as mes, 'M' as sexo, '61 o mas' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 3 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) > 61
UNION
select '03-marzo' as mes, 'F' as sexo, '61 o mas' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 3 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) > 61

--misma consulta, mes abril
UNION
select '04-abril' as mes, 'M' as sexo, '15 a 17' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 4 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 15 and 17
UNION
select '04-abril' as mes, 'F' as sexo, '15 a 17' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 4 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 15 and 17

UNION
select '04-abril' as mes, 'M' as sexo, '18 a 31' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 4 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 18 and 31
UNION
select '04-abril' as mes, 'F' as sexo, '18 a 31' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 4 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 18 and 31

UNION
select '04-abril' as mes, 'M' as sexo, '31 a 40' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 4 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 31 and 40
UNION
select '04-abril' as mes, 'F' as sexo, '31 a 40' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 4 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 31 and 40

UNION
select '04-abril' as mes, 'M' as sexo, '41 a 61' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 4 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 41 and 61
UNION
select '04-abril' as mes, 'F' as sexo, '41 a 61' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 4 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 41 and 61

UNION
select '04-abril' as mes, 'M' as sexo, '61 o mas' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 4 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) > 61
UNION
select '04-abril' as mes, 'F' as sexo, '61 o mas' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 4 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) > 61

--mayo
UNION
select '05-mayo' as mes, 'M' as sexo, '15 a 17' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 5 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 15 and 17
UNION
select '05-mayo' as mes, 'F' as sexo, '15 a 17' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 5 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 15 and 17

UNION
select '05-mayo' as mes, 'M' as sexo, '18 a 31' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 5 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 18 and 31
UNION
select '05-mayo' as mes, 'F' as sexo, '18 a 31' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 5 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 18 and 31

UNION
select '05-mayo' as mes, 'M' as sexo, '31 a 40' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 5 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 31 and 40
UNION
select '05-mayo' as mes, 'F' as sexo, '31 a 40' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 5 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 31 and 40

UNION
select '05-mayo' as mes, 'M' as sexo, '41 a 61' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 5 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 41 and 61
UNION
select '05-mayo' as mes, 'F' as sexo, '41 a 61' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 5 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 41 and 61

UNION
select '05-mayo' as mes, 'M' as sexo, '61 o mas' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 5 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) > 61
UNION
select '05-mayo' as mes, 'F' as sexo, '61 o mas' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 5 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) > 61

--junio
UNION
select '06-junio' as mes, 'M' as sexo, '15 a 17' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 6 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 15 and 17
UNION
select '06-junio' as mes, 'F' as sexo, '15 a 17' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 6 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 15 and 17

UNION
select '06-junio' as mes, 'M' as sexo, '18 a 31' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 6 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 18 and 31
UNION
select '06-junio' as mes, 'F' as sexo, '18 a 31' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 6 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 18 and 31

UNION
select '06-junio' as mes, 'M' as sexo, '31 a 40' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 6 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 31 and 40
UNION
select '06-junio' as mes, 'F' as sexo, '31 a 40' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 6 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 31 and 40

UNION
select '06-junio' as mes, 'M' as sexo, '41 a 61' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 6 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 41 and 61
UNION
select '06-junio' as mes, 'F' as sexo, '41 a 61' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 6 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 41 and 61

UNION
select '06-junio' as mes, 'M' as sexo, '61 o mas' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 6 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) > 61
UNION
select '06-junio' as mes, 'F' as sexo, '61 o mas' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 6 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) > 61

--julio
UNION
select '07-julio' as mes, 'M' as sexo, '15 a 17' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 7 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 15 and 17
UNION
select '07-julio' as mes, 'F' as sexo, '15 a 17' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 7 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 15 and 17

UNION
select '07-julio' as mes, 'M' as sexo, '18 a 31' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 7 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 18 and 31
UNION
select '07-julio' as mes, 'F' as sexo, '18 a 31' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 7 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 18 and 31

UNION
select '07-julio' as mes, 'M' as sexo, '31 a 40' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 7 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 31 and 40
UNION
select '07-julio' as mes, 'F' as sexo, '31 a 40' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 7 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 31 and 40

UNION
select '07-julio' as mes, 'M' as sexo, '41 a 61' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 7 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 41 and 61
UNION
select '07-julio' as mes, 'F' as sexo, '41 a 61' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 7 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 41 and 61

UNION
select '07-julio' as mes, 'M' as sexo, '61 o mas' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 7 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) > 61
UNION
select '07-julio' as mes, 'F' as sexo, '61 o mas' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 7 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) > 61

--agosto
UNION
select '08-agosto' as mes, 'M' as sexo, '15 a 17' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 8 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 15 and 17
UNION
select '08-agosto' as mes, 'F' as sexo, '15 a 17' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 8 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 15 and 17

UNION
select '08-agosto' as mes, 'M' as sexo, '18 a 31' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 8 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 18 and 31
UNION
select '08-agosto' as mes, 'F' as sexo, '18 a 31' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 8 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 18 and 31

UNION
select '08-agosto' as mes, 'M' as sexo, '31 a 40' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 8 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 31 and 40
UNION
select '08-agosto' as mes, 'F' as sexo, '31 a 40' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 8 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 31 and 40

UNION
select '08-agosto' as mes, 'M' as sexo, '41 a 61' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 8 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 41 and 61
UNION
select '08-agosto' as mes, 'F' as sexo, '41 a 61' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 8 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 41 and 61

UNION
select '08-agosto' as mes, 'M' as sexo, '61 o mas' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 8 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) > 61
UNION
select '08-agosto' as mes, 'F' as sexo, '61 o mas' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 8 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) > 61

--septiembre
UNION
select '09-septiembre' as mes, 'M' as sexo, '15 a 17' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 9 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 15 and 17
UNION
select '09-septiembre' as mes, 'F' as sexo, '15 a 17' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 9 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 15 and 17

UNION
select '09-septiembre' as mes, 'M' as sexo, '18 a 31' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 9 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 18 and 31
UNION
select '09-septiembre' as mes, 'F' as sexo, '18 a 31' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 9 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 18 and 31

UNION
select '09-septiembre' as mes, 'M' as sexo, '31 a 40' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 9 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 31 and 40
UNION
select '09-septiembre' as mes, 'F' as sexo, '31 a 40' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 9 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 31 and 40

UNION
select '09-septiembre' as mes, 'M' as sexo, '41 a 61' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 9 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 41 and 61
UNION
select '09-septiembre' as mes, 'F' as sexo, '41 a 61' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 9 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 41 and 61

UNION
select '09-septiembre' as mes, 'M' as sexo, '61 o mas' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 9 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) > 61
UNION
select '09-septiembre' as mes, 'F' as sexo, '61 o mas' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 9 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) > 61

--octubre
UNION
select '10-octubre' as mes, 'M' as sexo, '15 a 17' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 10 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 15 and 17
UNION
select '10-octubre' as mes, 'F' as sexo, '15 a 17' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 10 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 15 and 17

UNION
select '10-octubre' as mes, 'M' as sexo, '18 a 31' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 10 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 18 and 31
UNION
select '10-octubre' as mes, 'F' as sexo, '18 a 31' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 10 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 18 and 31

UNION
select '10-octubre' as mes, 'M' as sexo, '31 a 40' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 10 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 31 and 40
UNION
select '10-octubre' as mes, 'F' as sexo, '31 a 40' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 10 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 31 and 40

UNION
select '10-octubre' as mes, 'M' as sexo, '41 a 61' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 10 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 41 and 61
UNION
select '10-octubre' as mes, 'F' as sexo, '41 a 61' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 10 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 41 and 61

UNION
select '10-octubre' as mes, 'M' as sexo, '61 o mas' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 10 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) > 61
UNION
select '10-octubre' as mes, 'F' as sexo, '61 o mas' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 10 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) > 61

--noviembre
UNION
select '11-noviembre' as mes, 'M' as sexo, '15 a 17' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 11 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 15 and 17
UNION
select '11-noviembre' as mes, 'F' as sexo, '15 a 17' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 11 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 15 and 17

UNION
select '11-noviembre' as mes, 'M' as sexo, '18 a 31' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 11 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 18 and 31
UNION
select '11-noviembre' as mes, 'F' as sexo, '18 a 31' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 11 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 18 and 31

UNION
select '11-noviembre' as mes, 'M' as sexo, '31 a 40' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 11 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 31 and 40
UNION
select '11-noviembre' as mes, 'F' as sexo, '31 a 40' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 11 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 31 and 40

UNION
select '11-noviembre' as mes, 'M' as sexo, '41 a 61' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 11 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 41 and 61
UNION
select '11-noviembre' as mes, 'F' as sexo, '41 a 61' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 11 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 41 and 61

UNION
select '11-noviembre' as mes, 'M' as sexo, '61 o mas' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 11 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) > 61
UNION
select '11-noviembre' as mes, 'F' as sexo, '61 o mas' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 11 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) > 61

--diciembre
UNION
select '12-diciembre' as mes, 'M' as sexo, '15 a 17' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 12 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 15 and 17
UNION
select '12-diciembre' as mes, 'F' as sexo, '15 a 17' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 12 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 15 and 17

UNION
select '12-diciembre' as mes, 'M' as sexo, '18 a 31' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 12 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 18 and 31
UNION
select '12-diciembre' as mes, 'F' as sexo, '18 a 31' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 12 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 18 and 31

UNION
select '12-diciembre' as mes, 'M' as sexo, '31 a 40' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 12 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 31 and 40
UNION
select '12-diciembre' as mes, 'F' as sexo, '31 a 40' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 12 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 31 and 40

UNION
select '12-diciembre' as mes, 'M' as sexo, '41 a 61' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 12 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) BETWEEN 41 and 61
UNION
select '12-diciembre' as mes, 'F' as sexo, '41 a 61' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 12 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) BETWEEN 41 and 61

UNION
select '12-diciembre' as mes, 'M' as sexo, '61 o mas' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 12 and c.sexo = 'M'
and date_part('year', age(c.fnacimiento)) > 61
UNION
select '12-diciembre' as mes, 'F' as sexo, '61 o mas' as rango_edad, avg(operacion) as gasto_promedio_tc
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join cliente c
on tc."idCliente" = c."idCliente"
where operacion < 0 and date_part('month', fecha_operacion) = 12 and c.sexo = 'F'
and date_part('year', age(c.fnacimiento)) > 61

order by mes, rango_edad

--11.- Clientes que liquidan su cuenta antes de su fecha de corte.
--select * from tarjeta_datos where limite < 0
--UPDATE tarjeta_datos SET limite = 1500 WHERE limite < 0
--select tc."idCliente", td."idAhorro", --o.fecha_operacion, td.fcorte_dia, 
----o.operacion, 
--td.limite, --(limite-500)/ 5 as cta_ahorro,
--sum(o.operacion) as debe--- monto cta. ahorro = (limite-500)/5
--from operacion o
--inner join tarjeta_credito tc
--on o."idTarjeta" = tc."idTarjeta"
--inner join tarjeta_datos td
--on tc."idAhorro" = td."idAhorro"
--where fcorte_dia < date_part('day', fecha_operacion) --and (limite+operacion) > 0
----and operacion > 0
--and tc."idCliente" = 28
--group by tc."idCliente", td."idAhorro", o.fecha_operacion
--order by tc."idCliente" 

set search_path to tarjeta_credito
select tc.id_cliente, td.id_ahorro, td.limite, sum(o.operacion) as estado_cta
from operacion o
inner join tarjeta tc
on o.id_tarjeta = tc.id_tarjeta
inner join tarjeta_datos td
on tc.id_ahorro = td.id_ahorro
where fcorte_dia < date_part('day', fecha_operacion) --operaciones anteriores a su fecha de corte
--and tc."idCliente" = 28
group by tc.id_cliente, td.id_ahorro
having sum(o.operacion) > 0 			--cliente no ha hecho depositos que liquiden sus gastos
order by tc.id_cliente

select t.id_cliente, o.operacion
from tarjeta t
inner join operacion o
on t.id_tarjeta = o.id_tarjeta

select *
from tarjeta
where id_cliente = 42211

select *
from operacion
where id_tarjeta = '4973 6047 8585 9945'

select o.id_tarjeta, o.id_operacion, sum(operacion) as saldo, 
o.fecha_operacion, td.fecha_corte
from operacion o, tarjeta_datos td
where o.id_tarjeta = '4973 6047 8585 9945'
and td.id_tarjeta = '4973 6047 8585 9945'
and td.fecha_corte > date_part('day', o.fecha_operacion)
group by o.id_tarjeta, o.id_operacion, td.fecha_corte
--having sum(operacio) > 0

select fecha_corte
from tarjeta_datos
where id_tarjeta = '4973 6047 8585 9945'

--12.- Clientes que pagan mas intereses
--que su tasa de interes es la mas alta
select c."idCliente", td.tasa
from cliente c, tarjeta_datos td
where c."idCliente" = td."idCliente" and td.tasa = 7

--13.- Clientes que pagan mas intereses pero no se atrasan en sus pagos.
select tc."idCliente", td."idAhorro", td.limite, sum(o.operacion) as estado_cta
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join tarjeta_datos td
on tc."idAhorro" = td."idAhorro"
where fcorte_dia < date_part('day', fecha_operacion) --operaciones anteriores a su fecha de corte
and td.tasa = 7
group by tc."idCliente", td."idAhorro"
having sum(o.operacion) > 0 			--cliente no ha hecho depositos que liquiden sus gastos
order by tc."idCliente" 

--14.- Clientes que se les otorga una TC y la usan el mismo día.
select td."fechaEmision", o.fecha_operacion
from tarjeta_datos td
inner join tarjeta_credito tc
on td."idAhorro" = tc."idAhorro"
inner join operacion o
on tc."idTarjeta" = o."idTarjeta"


select tc."idCliente", td."idAhorro", td.limite, sum(o.operacion) as estado_cta, o."idOperacion"
from operacion o
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join tarjeta_datos td
on tc."idAhorro" = td."idAhorro"
--la fecha de operacion es mayor a la fecha de corte,
--pagos o gastos que hizo despues de la fecha corte
--where date_part('day', fecha_operacion) > fcorte_dia
--pagos o gastos que hizo antes de la fecha corte
where date_part('day', fecha_operacion) <= fcorte_dia
--and tc."idCliente" = 28
group by tc."idCliente", td."idAhorro", o."idOperacion"
having sum(o.operacion) > 0 			--cliente no ha hecho depositos que liquiden sus gastos
order by tc."idCliente" 

--ejemplos de insercion antes y despues de fecha de corte
select * from tarjeta_credito tc
where tc."idAhorro" = 59
select * from tarjeta_datos td
where td."idAhorro" = 59
select * from operacion o
where "idOperacion" = 99999 
select max("idOperacion") from operacion

INSERT INTO operacion VALUES(99999, '3669898826240870', 200, '2016/07/11')
UPDATE operacion SET fecha_operacion = '2016/07/08' WHERE "idOperacion" = 99999
DELETE FROM operacion WHERE "idOperacion" = 99999
--ejemplos de insercion antes y despues de fecha de corte

--16.- Clientes que rebasaran su limite de crédito si acumulan 3 meses de morosidad.
--17.- Se les otorgara un aumento de 20% de su crédito a los cliente que nunca se atrasan en sus pagos.
--Aplicar ese cambio en la BD.

--18.- Repetir consulta 4 con los nuevos datos.

--19.- se les reducirá su limite de crédito a todos los clientes que tengan morosidad en sus pagos. La reducción
--será de 50%. Aplicar cambio en la BD.

--20.- repetir consulta 4 con nuevos datos.

--21.- Cuantos clientes tienen una deuda superior a su limite de crédito.
select o."idTarjeta", o.operacion 
from operacion o
--where o.operacion < 0 order by "idTarjeta"
inner join tarjeta_credito tc
on o."idTarjeta" = tc."idTarjeta"
inner join tarjeta_datos td
on td."idAhorro" = tc."idAhorro"
where o.operacion < 0 --(deuda)
order by "idTarjeta"

select distinct(c."idCliente"), tc."idTarjeta", o.operacion
from cliente c
inner join tarjeta_credito tc
on c."idCliente" = tc."idCliente"
inner join operacion o
on tc."idTarjeta" = o."idTarjeta"
where o.operacion < 0
order by c."idCliente"

select *
from tarjeta_datos

--22.- Numero de hombres y mujeres que tienen una deuda superior a su limite de crédito.

--23.- Ejecutivos que otorgaron TC que cayeron en morosidad.

--24.- Ejecutivos que otorgaron TC que nunca se atrasan en sus pagos.

--25.- Numero de Tarjetas otorgadas por ejecutivos por mes.

--26.- Que ejecutivos otorgan mas tarjetas de crédito, hombre o mujeres.

--27.- Que ejecutivos otorgan mas tarjetas de crédito que no caen en morosidad, hombre o mujeres.

--28.- Se les otorgara una tarjeta adicional con el doble del limite de su tarjeta actual a los clientes que tienen
--un rango de edad entre 25 y 35 años, tiene un limite actual mayor a 20,000 y que no tengan pagos atrasados.
--Aplique el cambio en la BD.

--29.- TOP 100 de los clientes que tiene mas de una TC y su limite de crédito sumado. DESC.

--30.- TOP 100 de los clientes que mas endeudados están.

select *--, count("idCliente") 
from cliente
where "idCliente" = 8533
--group by "idCliente"