from faker import Factory
fake = Factory.create()
import psycopg2
# Connect to an existing database
conn = psycopg2.connect("dbname=tarjeta user=postgres")
conn2 = psycopg2.connect("dbname=banco user=postgres")

# Open a cursor to perform database operations
cur = conn.cursor()
cur_ahorro = conn2.cursor()
#point to the schema
cur.execute("set search_path to tarjeta;")
cur_ahorro.execute("set search_path to banco;")

idAhorro = 1
table = '"tarjetaDatos"'
for i in range(1, 10):
    #from table ahorro get fecha contratacion
    SQL = 'SELECT "fcontratacion" FROM ahorro WHERE "idAhorro" = (%s)'
    get_this_ahorro = (str(idAhorro), )
    cur_ahorro.execute(SQL, get_this_ahorro)
    ahorro = cur_ahorro.fetchone()
    fcontratacion_ahorro = ahorro[0].year
    #need to build an emission date
    day = 1
    month = 1
    femision = str(fcontratacion_ahorro+1)+"/"+str(month)+"/"+str(day)

    #from table cliente get nombre, apellido, apellido where idAhorro = N
    SQL = 'SELECT "nombre", "apellidoa", "apellidob" FROM cliente WHERE "idAhorro" = (%s)' 
    get_this_cliente = (str(idAhorro), )
    cur.execute(SQL, get_this_cliente) 
    cliente = cur.fetchone()
    idTarjeta = fake.numerify(text="################")
    nombre = cliente[0]
    apellidoa = cliente[1]
    apellidob = cliente[2]
    #need to build an expire date
    fexpire = str(fcontratacion_ahorro+7)+"/"+str(month)+"/"+str(day)
    cvc = fake.numerify(text="###")
    if idAhorro < 25000:
        tipo = "VISA"
    else:
        tipo = "Mastercard"

    print "INSERT INTO %s VALUES('%s', '%s', '%s', '%s', '%s', '%s', '%s');" %(table, idTarjeta, nombre, apellidoa, apellidob, fexpire, cvc, tipo)

    idAhorro += 1

