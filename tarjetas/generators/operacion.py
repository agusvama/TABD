from faker import Factory
fake = Factory.create()
import psycopg2
conn = psycopg2.connect("dbname=tarjeta user=postgres")
cur_credito = conn.cursor() #from table tarjeta_credito GET idTarjeta
cur_datos = conn.cursor() #from table tarjeta_datos GET fEmision
#point to the schema
cur_credito.execute("set search_path to tarjeta;")
cur_datos.execute("set search_path to tarjeta;")

def get_tarjeta(idAhorro):
    SQL = 'SELECT "idTarjeta" FROM tarjeta_credito WHERE "idAhorro" = %s;' %idAhorro
    cur_credito.execute(SQL)
    return cur_credito.fetchone()

def get_emision(idAhorro):
    SQL = 'SELECT "fechaEmision" FROM tarjeta_datos WHERE "idAhorro" = %s;' %idAhorro
    cur_datos.execute(SQL)
    return cur_datos.fetchone()

def generator(how_many):
    how_many += 1
    idOperacion = 1
    for i in range(1, how_many):
        idAhorro = fake.random_int(min=1, max=50000)
        #get any idTarjeta givin the idAhorro arg 
        credito = get_tarjeta(idAhorro) #execute the query and return a tuple
        idTarjeta = credito[0]
        #operation
        operacion = fake.random_int(min=-50000, max=50000)
        #date
        fecha_emision = get_emision(idAhorro)
        year = fecha_emision[0].year
        month = fake.random_int(min=1, max=12)
        day = fake.random_int(min=1, max=28)
        #build an older date than fecha_emision
        year += 1
        if year >= 2017:
            continue
        fecha_operacion = str(year)+'/'+str(month)+'/'+str(day)
        print 'INSERT INTO operacion VALUES(%s, \'%s\', %s, \'%s\');' %(idOperacion, idTarjeta, operacion, fecha_operacion)
        idOperacion += 1
        
if __name__ == "__main__":
    generator(50000)

