from faker import Factory
fake = Factory.create()
import psycopg2
# Connect to an existing database
conn = psycopg2.connect("dbname=tarjeta user=postgres")
conn2 = psycopg2.connect("dbname=banco user=postgres")

# Open a cursor to perform database operations
cur = conn2.cursor()
cur_ahorro = conn2.cursor()
cur_ejecutivo = conn.cursor()
#point to the schema
cur.execute("set search_path to banco;")
cur_ahorro.execute("set search_path to banco;")
cur_ejecutivo.execute("set search_path to tarjeta;")

idAhorro = 1
table = '"tarjetaDatos"'
for i in range(1, 50001):
    #from table ahorro get fecha contratacion and idCliente
    SQL = 'SELECT "fcontratacion", "idCliente" FROM "ahorro" WHERE "idAhorro" = (%s)'
    get_this_ahorro = (str(idAhorro), )
    cur_ahorro.execute(SQL, get_this_ahorro)
    ahorro = cur_ahorro.fetchone()
    fcontratacion_ahorro = ahorro[0].year
    #need to build an emission date
    day = 1
    month = 1
    femision = str(fcontratacion_ahorro+1)+"/"+str(month)+"/"+str(day)
    idCliente = ahorro[1]

    #from table movimiento, get debe, haber, then limite = debe - haber, searching by idAhorro
    SQL1 = 'SELECT "debe", "haber" FROM "movimiento" WHERE "idAhorro" = (%s)'
    get_this_movimiento = (str(idAhorro), )
    cur.execute(SQL1, get_this_movimiento) 
    movimiento = cur.fetchone()
    if movimiento == None:
        limite = 500 #5 veces su ahorro, mas 500
    else:
        debe = movimiento[0]
        haber = movimiento[1]
        limite = debe - haber
        limite *= 5
        limite += 500
        tasa = fake.random_int(min=3, max=7)

    #from table ejecutivo get idEjecutivo and idSucursal
    SQL2 = 'SELECT "idEjecutivo", "idSucursal" FROM ejecutivo WHERE "idEjecutivo" = (%s)'
    get_this_ejecutivo = fake.random_int(min=1, max=40)
    get_this_ejecutivo = (str(get_this_ejecutivo), )
    cur_ejecutivo.execute(SQL2, get_this_ejecutivo)
    ejecutivo = cur_ejecutivo.fetchone()
    idEjecutivo = ejecutivo[0]
    idSucursal = ejecutivo[1]
    fcorte_mes = fake.random_int(min=1, max=12)
    fcorte_dia = fake.random_int(min=1, max=28)

    print "INSERT INTO %s VALUES('%s', %s, %s, %s, %s, %s, %s, '%s', '%s');" %(table, femision, limite, tasa, idEjecutivo, idSucursal, idCliente, idAhorro, fcorte_mes, fcorte_dia)

    idAhorro += 1
