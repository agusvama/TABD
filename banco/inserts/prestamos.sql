set search_path to banco;

COPY prestamo FROM '/tmp/prestamos.csv'
delimiter as ',';

select * from prestamo;