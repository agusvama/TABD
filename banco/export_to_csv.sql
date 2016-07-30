set search_path to banco;

select *
from por_mes
limit 100

delete from por_mes

COPY (select * from por_mes) 
TO 'D:\documentos\Ins. Tec\8vo\TABD\banco\prestamos_mes_sexo.csv'
--WITH CSV 
DELIMITER ','
CSV HEADER;