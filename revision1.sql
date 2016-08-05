set search_path to banco;

/*
select a."idAhorro", m.debe, m.haber, m.debe-m.haber as monto
from ahorro a
inner join only movimiento m
on a."idAhorro" = m."idAhorro"
where a."idAhorro" = 10
*/
select * from prestamo
where "idPrestamo" = 1

select * from movimiento_prestamo
where "idPrestamo" = 2

ALTER TABLE prestamo ALTER COLUMN plazo TYPE integer USING (plazo::integer);

--num cliente, fecha 
select c."idCliente", a."idAhorro", p."idPrestamo"
from cliente c
inner join ahorro a
on c."idCliente" = a."idCliente"
inner join prestamo p
on c."idCliente" = p."idCliente"
where c."idCliente" = 10

select c."idCliente", a."idAhorro", ma.fmovimiento, ma.monto
from cliente c
inner join ahorro a 
on c."idCliente" = a."idCliente"
inner join movimiento_ahorro ma
on a."idAhorro" = ma."idAhorro"
where c."idCliente" = 80158 --87726
order by fmovimiento
--union
select c."idCliente", sum(ma.monto) as saldo_actual
from cliente c
inner join ahorro a 
on c."idCliente" = a."idCliente"
inner join movimiento_ahorro ma
on a."idAhorro" = ma."idAhorro"
where c."idCliente" = 80158 --87726 
group by c."idCliente"

select *
from movimiento_ahorro
--order by "idAhorro"
where "idAhorro" = 1
select * 
from ahorro
where "idAhorro" = 1

select * from movimiento_ahorro
where monto < 0
UPDATE movimiento_ahorro SET monto=(-200) WHERE monto < 0

select max("fafiliacion")
from cliente