from faker import Factory
fake = Factory.create()
table = '"ahorro"'

import psycopg2
# Connect to an existing database
conn = psycopg2.connect("dbname=banco user=postgres")
# Open a cursor to perform database operations
cur = conn.cursor()
#point to the schema
cur.execute("set search_path to banco;")

for i in range(1, 11): #100000 cuentas de ahorro
    #from table cliente get idCliente
    SQL = 'SELECT "idCliente" FROM cliente WHERE "idCliente" = (%s);'
    get_this_cliente = fake.random_int(min=1, max=100000)
    get_this_cliente = (str(get_this_cliente), )
    cur.execute(SQL, get_this_cliente)
    idCliente = cur.fetchone()
    print "INSERT INTO %s VALUES(%s, %s, %s, %s, %s, '%s');" %(table, i, 1, idCliente[0], 1,1,1) 


