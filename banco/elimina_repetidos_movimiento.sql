set search_path to banco;


delete from movimiento where "idMovimiento" in (
select "idMovimiento" from movimiento where "idAhorro" in
(
    select "idAhorro" from movimiento group by "idAhorro" having count(*)>1
)
and "idMovimiento" not in (
    select      min("idMovimiento") from movimiento 
    group by    "idAhorro"
    having      count(*)>1
)
);