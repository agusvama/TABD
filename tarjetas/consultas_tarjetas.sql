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

UPDATE tarjeta_datos SET "fechaEmision" = '2016/01/01' WHERE "fechaEmision" = '2017/01/01'

--6.- ¿Quien usa mas veces su TC las mujeres o los hombres?