from faker import Factory
from random import choice
from datetime import *
from dateutil.relativedelta import relativedelta
fake = Factory.create()
import psycopg2
conn = psycopg2.connect("dbname=tarjeta user=postgres")
cur = conn.cursor() 
#point to the schema
cur.execute("set search_path to tarjeta_credito;")
clientes = []

def get_clientes():
    global clientes
    SQL = 'SELECT id_cliente FROM tarjeta' 
    cur.execute(SQL) #returns 30508 rows
    for i in range(0, 30508):
        cliente = cur.fetchone()
        idcliente = cliente[0]
        clientes.append(idcliente)

def get_operacion():
    return fake.random_int(min=-5000, max=15000)

def get_fechaoperacion():
    fechaemision = date(2010, 6, 27)
    return fechaemision + relativedelta(months=fake.random_int(min=1, max=60))

def generator(how_many):
    get_clientes()
    idoperacion = 1
    for i in range(0, how_many):
       idcliente = choice(clientes)  
       SQL = 'SELECT id_tarjeta FROM tarjeta WHERE id_cliente = %s' %idcliente
       cur.execute(SQL)
       tarjeta = cur.fetchone()
       idtarjeta = tarjeta[0]
       operacion = get_operacion()
       fecha_operacion = get_fechaoperacion()

       print 'INSERT INTO operacion VALUES(%s, \'%s\', %s, \'%s\');' %(idoperacion, idtarjeta, operacion, fecha_operacion)
       idoperacion += 1 

if __name__ == "__main__":
    generator(50000)

