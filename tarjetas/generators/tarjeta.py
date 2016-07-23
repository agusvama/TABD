from faker import Factory
fake = Factory.create()
import psycopg2
# Connect to an existing database
conn = psycopg2.connect("dbname=tarjeta user=postgres")
# Open a cursor to perform database operations
cur = conn.cursor()
#point to the schema
cur.execute("set search_path to tarjeta_credito;")

def get_tarjeta():
    return fake.numerify(text="#### #### #### ####")

def get_cvc():
    return fake.numerify(text="###")

def generator(how_many):
    SQL = 'SELECT id_ahorro, id_cliente FROM ahorro' #returns 30508 rows
    cur.execute(SQL) #now we have all idahorro and idcliente
    for i in range(0, how_many):
        ahorro_cliente = cur.fetchone()
        idahorro = ahorro_cliente[0] 
        idcliente = ahorro_cliente[1]
        idtarjeta = get_tarjeta()
        cvc = get_cvc() 
        tipo = 'Mastercard'
        
        print 'INSERT INTO tarjeta VALUES (\'%s\', %s, %s, \'%s\', \'%s\')'%(idtarjeta, idcliente, idahorro, tipo, cvc)

if __name__ == "__main__":
    generator(30508) #30508

