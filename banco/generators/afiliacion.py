import psycopg2
from faker import Factory
fake = Factory.create()

DATABASE_PARAMS = "dbname=banco user=postgres"
SCHEMA = "set search_path to banco;"

# Connect to an existing database
conn = psycopg2.connect(DATABASE_PARAMS)
# Open a cursor to perform database operations
cur_prestamo = conn.cursor()
cur_ahorro = conn.cursor()
cur_movimiento = conn.cursor()
cur_ejecutivo = conn.cursor()
#point to the schema
cur_prestamo.execute(SCHEMA)
cur_ahorro.execute(SCHEMA)
cur_movimiento.execute(SCHEMA)
cur_ejecutivo.execute(SCHEMA)
#query variables
id_cliente = 1
fprestamo = 0

def query_prestamo():
    sql_prestamo = 'SELECT DISTINCT("idCliente"), MIN("fcontratacion") FROM prestamo WHERE "idCliente" = (%s) GROUP BY "idCliente" ORDER BY "idCliente"'
    get_this_cliente = str(id_cliente)
    cur_prestamo.execute(sql_prestamo, get_this_cliente)
    prestamo = cur_prestamo.fetchone()
    global fprestamo
    fprestamo = prestamo[1]

def generator(how_many):
    global id_cliente #use the id_cliente declarated at top
    for i in range(1, how_many):
        #from table prestamo get fcontratacion, and sub 1 to 7 months
        #from table ejecutivo get fcontratacion
        #if months < 0, then make the fafiliacion date same as fcontratacion ejecutivo
        query_prestamo()
        print id_cliente, fprestamo
        id_cliente += 1


#if __name__ == "__main()__":
if __name__ == "__main__":
    generator(10) 
