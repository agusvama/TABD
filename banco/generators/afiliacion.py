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
fprestamo = fahorro = 0
#final variables
fafiliacion = ""

def query_prestamo():
    global fprestamo, fafiliacion
    SQL = 'SELECT MIN("fcontratacion") FROM prestamo WHERE "idCliente" = (%s) GROUP BY "idCliente"'
    get_this_cliente = (str(id_cliente), )
    cur_prestamo.execute(SQL, get_this_cliente)
    prestamo = cur_prestamo.fetchone()
    if prestamo is None:
        fafiliacion = '1993/3/28'
        return
    fprestamo = prestamo[0]
    month = prestamo[0].month
    aux_month = month
    #now sub some months to month...
    month -= fake.random_int(min=1, max=11)   
    if(month <= 0):
        month = aux_month
    #final date:
    year = prestamo[0].year
    day = prestamo[0].day
    fafiliacion = str(year)+"/"+str(month)+"/"+str(day)

def generator(how_many):
    global id_cliente #use the id_cliente declarated at top
    how_many += 1
    for i in range(1, how_many):
        #from table prestamo get fcontratacion, and sub 1 to 7 months
        #from table ejecutivo get fcontratacion
        #if months < 0, then make the fafiliacion date same as fcontratacion ejecutivo
        query_prestamo()
        #print "idCliente  fprestamo fafiliacion"
        #print id_cliente, fprestamo, fafiliacion
        print 'INSERT INTO "cliente" ("fafiliacion") VALUES (\'%s\');' %fafiliacion

        id_cliente += 1


if __name__ == "__main__":
    generator(100000) 

