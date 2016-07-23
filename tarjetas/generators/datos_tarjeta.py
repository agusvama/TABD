from faker import Factory
fake = Factory.create()
import psycopg2
# Connect to an existing database
conn = psycopg2.connect("dbname=tarjeta user=postgres")
# Open a cursor to perform database operations
cur = conn.cursor()
#point to the schema
cur.execute("set search_path to tarjeta_credito;")

def get_ejecutivo():
    return fake.random_int(min=1, max=49)

def get_tasa():
    return fake.random_int(min=3, max=7)

def get_limite():
    return fake.random_int(min=500, max=47000)

def get_fechacorte():
    return fake.random_int(min=1, max=28)

def generator(how_many):
    SQL = 'SELECT id_tarjeta FROM tarjeta' #returns 30508 rows
    cur.execute(SQL)
    for i in range(0, how_many):
        tarjeta = cur.fetchone()
        idtarjeta = tarjeta[0]
        idejecutivo = get_ejecutivo()
        tasa = get_tasa()
        limite = get_limite()
        fechaemision = '2010/06/27'
        fechavencimiento = '2020/06/27'
        fechacorte = get_fechacorte()

        print 'INSERT INTO tarjeta_datos VALUES(\'%s\', %s, %s, %s, \'%s\', \'%s\', %s);' %(idtarjeta, idejecutivo, tasa, limite, fechaemision, fechavencimiento, fechacorte)

if __name__ == "__main__":
    generator(30508)

