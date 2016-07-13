from faker import Factory
fake = Factory.create()
table = '"movimiento"'
fcontratacion_movimiento = 0
idMovimiento = 1
debe = 0
haber = 0

import psycopg2
# Connect to an existing database
conn = psycopg2.connect("dbname=banco user=postgres")
# Open a cursor to perform database operations
cur_ahorro = conn.cursor()
cur_ejecutivo = conn.cursor()
#point to the schema
cur_ahorro.execute("set search_path to banco;")
cur_ejecutivo.execute("set search_path to banco;")

for i in range(1, 100001): #100000 cuentas de ahorro
    #from table ahorro get idAhorro
    get_this_idAhorro = fake.random_int(min=1, max=100000)
    get_this_idAhorro = (str(get_this_idAhorro), )
    SQL = 'SELECT "idAhorro", "fcontratacion" FROM ahorro WHERE "idAhorro" = (%s);'
    cur_ahorro.execute(SQL, get_this_idAhorro)
    ahorro = cur_ahorro.fetchone()
    idAhorro = ahorro[0]
    fcontratacion_ahorro = ahorro[1].year

    #from table ejecutivo get any idEjecutivo and idSucursal
    get_this_ejecutivo = fake.random_int(min=1, max=135)
    get_this_ejecutivo = (str(get_this_ejecutivo),)
    SQL2 = 'SELECT "idEjecutivo", "idSucursal", "fcontratacion" FROM ejecutivo WHERE "idEjecutivo" = (%s);' 
    cur_ejecutivo.execute(SQL2, get_this_ejecutivo)
    ejecutivo = cur_ejecutivo.fetchone()
    idEjecutivo = ejecutivo[0]
    idSucursal = ejecutivo[1]
    fcontratacion_ejecutivo = ejecutivo[2].year
    #print ejecutivo[0],
    #print ejecutivo[1],
    #print ejecutivo[2].year,

    #need to build a fcontratacion_movimiento date
    '''
    fcontratacion ahorro =
    fcontratacion ejecutivo + 1 if 1993 - fnacimiento cliente > 18
    fnacimiento cliente + 18 if 1993 - fnacimiento cliente < 18 having fcontratacion ejecutivo > fnacimiento cliente +18
    '''
    '''
    #si tiene una cuenta de ahorro, entonces ya es cliente, no es necesario comprobar su edad
    if 1993-fnacimiento_cliente > 18:
        #print "entering condition",
        fcontratacion_movimiento = fcontratacion_ejecutivo + 1
    if 1993-fnacimiento_cliente <= 18:
        #print "entering condition 2",
        fcontratacion_movimiento = fcontratacion_ejecutivo + 1
    if fcontratacion_ejecutivo - fnacimiento_cliente <= 18:
        #print "entering condition 3",
        fcontratacion_movimiento = fnacimiento_cliente + 18
    '''
    fcontratacion_movimiento = fcontratacion_ahorro + 1 #year + 1
    if fcontratacion_movimiento < fcontratacion_ejecutivo:
        fcontratacion_movimiento = fcontratacion_ejecutivo + 1
    #fcontratacion_movimiento must be > fcontratacion_ahorro
    if fcontratacion_movimiento > 2016 or fcontratacion_movimiento < fcontratacion_ahorro:
        #print "jumping"
        continue
    #need to build a date
    day = fake.random_int(min=1, max=28)
    month = fake.random_int(min=1, max=12)
    fMovimiento = str(fcontratacion_movimiento)+"/"+str(month)+"/"+str(day)
    #generating the debe and haber values
    debe = fake.random_int(min=500, max=100000)
    haber = fake.random_int(min=100, max = 5000)
    #print fcontratacion_movimiento
    print "INSERT INTO %s VALUES(%s, %s, %s, %s, '%s', %s, %s);" %(table, idMovimiento, idAhorro, debe, haber, fMovimiento, idSucursal, idEjecutivo)
    #print fcontratacion_ahorro,
    #print fcontratacion_ejecutivo
    idMovimiento += 1

