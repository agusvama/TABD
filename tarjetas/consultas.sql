set search_path to tarjeta;

--1.- Porcentaje de clientes por sexo.
select "sexo", count("sexo"), ((count("sexo")*100)/100000.0) as "porcentaje" from cliente
group by "sexo";