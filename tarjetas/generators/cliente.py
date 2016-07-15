#los clientes vienen desde una consulta: siempre y cuando tengan cuenta de ahorro

from faker import Factory
fake = Factory.create()
table = '"cliente"'
idAhorro = 1

#hacer una consulta hacia la BD banco en la tabla: ahorro
import psycopg2
# Connect to an existing database
conn = psycopg2.connect("dbname=banco user=postgres")
# Open a cursor to perform database operations
cur_cliente = conn.cursor()
cur = conn.cursor()
#point to the schema
cur_cliente.execute("set search_path to banco;")
cur.execute("set search_path to banco;")

for i in range(1, 50001):
#from table ahorro get idCliente, then, from table cliente get all data, so...
    #first we have to get an idCliente
    SQL1 = 'SELECT "idCliente" FROM ahorro WHERE "idAhorro" = (%s);'
    get_this_idcliente = idAhorro
    get_this_idcliente = (str(get_this_idcliente), )
    cur.execute(SQL1, get_this_idcliente)
    idcliente_ahorro = cur.fetchone()
    #####
    get_this_cliente = idcliente_ahorro[0]
    get_this_cliente = (str(get_this_cliente), )
    SQL = 'SELECT * FROM cliente WHERE "idCliente" = (%s);'
    cur_cliente.execute(SQL, get_this_cliente)
    cliente = cur_cliente.fetchone()
    #asignar valores de esa consulta a las columnas de la tabla
    idcliente = cliente[0]
    nombre = cliente[1]
    apellidoa = cliente[2]
    apellidob = cliente[3]
    calle = cliente[4]
    numero = cliente[5]
    colonia = cliente[6]
    ciudad = cliente[7]
    cp = cliente[8]
    fnacimiento = cliente[9]
    telefono = cliente[10]
    sexo = cliente[11]
    fafiliacion = cliente[12]

    #print "INSERT INTO %s VALUES(%s, '%s', '%s', '%s', '%s', %s, '%s', '%s', %s, '%s', '%s');" %(table, idcliente, nombre, apellidoa, apellidob, calle, numero, colonia, ciudad, cp, fnacimiento, telefono)

    print 'UPDATE "cliente" SET "idCliente" = %s, "nombre" = \'%s\', "apellidoa" = \'%s\', "apellidob" = \'%s\', "calle" = \'%s\', numero = %s, colonia = \'%s\', ciudad = \'%s\', cp = \'%s\', fnacimiento = \'%s\', telefono = \'%s\', sexo = \'%s\', fafiliacion = \'%s\' WHERE "idAhorro" = %s;' %(idcliente, nombre, apellidoa, apellidob, calle, numero, colonia, ciudad, cp, fnacimiento, telefono, sexo, fafiliacion, idAhorro)

    idAhorro +=1


