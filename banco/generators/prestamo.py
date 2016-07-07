from faker import Factory
fake = Factory.create()
table = '"prestamo"'
fcontratacion_prestamo = 0
idPrestamo = 1
monto = 0
plazo = 0
interes = 15
interesmoratorio = 4

import psycopg2
# Connect to an existing database
conn = psycopg2.connect("dbname=banco user=postgres")
# Open a cursor to perform database operations
cur_cliente = conn.cursor()
cur_ejecutivo = conn.cursor()
#point to the schema
cur_cliente.execute("set search_path to banco;")
cur_ejecutivo.execute("set search_path to banco;")

for i in range(1, 1000001): #1 000 000 prestamos
    #from table cliente get cliente
    get_this_cliente = fake.random_int(min=1, max=100000)
    get_this_cliente = (str(get_this_cliente), )
    SQL = 'SELECT "idCliente", "fnacimiento" FROM cliente WHERE "idCliente" = (%s);'
    cur_cliente.execute(SQL, get_this_cliente)
    cliente = cur_cliente.fetchone()
    #asign variables to fnacimiento cliente
    fnacimiento_cliente = cliente[1].year
    #print cliente[0], #idCliente
    #print cliente[1].year, #fnacimiento cliente

    #from table ejecutivo get any idEjecutivo and his idSucursal
    get_this_ejecutivo = fake.random_int(min=1, max=148)
    get_this_ejecutivo = (str(get_this_ejecutivo),)
    SQL2 = 'SELECT "idEjecutivo", "idSucursal", "fcontratacion" FROM ejecutivo WHERE "idEjecutivo" = (%s);' 
    cur_ejecutivo.execute(SQL2, get_this_ejecutivo)
    ejecutivo = cur_ejecutivo.fetchone()
    fcontratacion_ejecutivo = ejecutivo[2].year
    #print ejecutivo[0],
    #print ejecutivo[1],
    #print ejecutivo[2].year,

    #need to build a fcontratacion_prestamo date
    '''
    fcontratacion ahorro =
    fcontratacion ejecutivo + 1 if 1993 - fnacimiento cliente > 18
    fnacimiento cliente + 18 if 1993 - fnacimiento cliente < 18 having fcontratacion ejecutivo > fnacimiento cliente +18
    '''
    if 1993-fnacimiento_cliente > 18:
        #print "entering condition",
        fcontratacion_prestamo = fcontratacion_ejecutivo + 1
    if 1993-fnacimiento_cliente <= 18:
        #print "entering condition 2",
        fcontratacion_prestamo = fcontratacion_ejecutivo + 1
    if fcontratacion_ejecutivo - fnacimiento_cliente <= 18:
        #print "entering condition 3",
        fcontratacion_prestamo = fnacimiento_cliente + 18
    if fcontratacion_prestamo > 2016 or fcontratacion_prestamo < fcontratacion_ejecutivo:
        #print "jumping"
        continue
    #need to build a date
    day = fake.random_int(min=1, max=28)
    month = fake.random_int(min=1, max=12)
    fPrestamo = str(fcontratacion_prestamo)+"/"+str(month)+"/"+str(day)
    #print fcontratacion_prestamo
    #need to generate random monto, plazo
    monto = fake.random_int(min=1000, max=1000000)
    plazo = fake.random_int(min=1, max=120) #1 mes a 120 meses
    print "%s, %s, %s, %s, %s, %s, %s, %s, %s, '%s'" %(idPrestamo, 2, cliente[0], ejecutivo[1], ejecutivo[0], monto, plazo, interes, interesmoratorio, fPrestamo)
    #print fnacimiento_cliente,
    #print fcontratacion_ejecutivo
    idPrestamo += 1
