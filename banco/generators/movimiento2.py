from faker import Factory
fake = Factory.create()
import psycopg2
# Connect to an existing database
conn = psycopg2.connect("dbname=banco user=postgres")
# Open a cursor to perform database operations
cur_ahorro = conn.cursor()
cur_ejecutivo = conn.cursor()
cur_prestamo = conn.cursor()
cur_insert = conn.cursor()
cur_inversion = conn.cursor()
#point to the schema
cur_ahorro.execute("set search_path to banco;")
cur_ejecutivo.execute("set search_path to banco;")
cur_prestamo.execute("set search_path to banco;")
cur_insert.execute("set search_path to banco;")
cur_inversion.execute("set search_path to banco;")
#utility to handle dates with care
from datetime import datetime
from dateutil.relativedelta import relativedelta

def get_ejecutivo(idejecutivo):
    SQL = 'SELECT "idEjecutivo", "idSucursal", "fcontratacion" FROM ejecutivo WHERE "idEjecutivo" = (%s);' %idejecutivo
    cur_ejecutivo.execute(SQL)
    return cur_ejecutivo.fetchone()

def get_ahorro(idAhorro):
    SQL = 'SELECT "idAhorro", fcontratacion FROM ahorro WHERE "idAhorro" = %s;' %idAhorro
    cur_ahorro.execute(SQL)
    return cur_ahorro.fetchone()

def build_ahorro(idmovimiento, idejecutivo, idsucursal, fejecutivo):
    some_idahorro = fake.random_int(min=1, max=10000)
    ahorro = get_ahorro(some_idahorro)
    idahorro = ahorro[0]
    fahorro = ahorro[1]
    fecha = fahorro + relativedelta(months=fake.random_int(min=1, max=10))
    if fecha < fejecutivo:
        fecha = fejecutivo + relativedelta(months=fake.random_int(min=1, max=10)) 
    if fecha.year > 2015 or fecha < fahorro:
        return
    monto = fake.random_int(min=-5000, max=10000)
    #print "mov.ahorro"
    #print '%s %s %s %s' %(idmovimiento, idejecutivo, idsucursal, fecha)
    #print '%s %s %s %s %s %s' %(idmovimiento, idejecutivo, idsucursal, fecha, idahorro, monto)
    print 'INSERT INTO movimiento VALUES(%s, %s, %s, \'%s\');' %(idmovimiento, idejecutivo, idsucursal, fecha)
    print 'INSERT INTO movimiento_ahorro VALUES(%s, %s, %s, \'%s\', %s, %s);' %(idmovimiento, idejecutivo, idsucursal, fecha, idahorro, monto)
    #cur_insert.execute(SQL)
    #cur_insert.execute(SQL2)
    
def get_prestamo(idprestamo):
    SQL = 'SELECT "idPrestamo", fcontratacion, monto, plazo FROM prestamo WHERE "idPrestamo" = %s;' %idprestamo 
    cur_prestamo.execute(SQL)
    return cur_prestamo.fetchone()

def build_prestamo(idmovimiento, idejecutivo, idsucursal, fejecutivo):
    some_idprestamo = fake.random_int(min=1, max=1000000)
    prestamo = get_prestamo(some_idprestamo)
    idprestamo = prestamo[0]
    fprestamo = prestamo[1]
    monto_prestamo = prestamo[2]
    plazo = prestamo[3]
    fecha = fprestamo + relativedelta(months=fake.random_int(min=1, max=10))
    if fecha < fejecutivo:
        fecha = fejecutivo + relativedelta(months=fake.random_int(min=1, max=10)) 
    if fecha.year > 2015 or fecha < fprestamo:
        return
    monto = (monto_prestamo + monto_prestamo*0.15) / plazo
    #print "mov.prestamo"
    #print '%s %s %s %s' %(idmovimiento, idejecutivo, idsucursal, fecha)
    #print '%s %s %s %s %s %s' %(idmovimiento, idejecutivo, idsucursal, fecha, idprestamo, monto)
    print 'INSERT INTO movimiento VALUES(%s, %s, %s, \'%s\');' %(idmovimiento, idejecutivo, idsucursal, fecha)
    print 'INSERT INTO movimiento_prestamo VALUES(%s, %s, %s, \'%s\', %s, %s);' %(idmovimiento, idejecutivo, idsucursal, fecha, idprestamo, monto)
    #cur_insert.execute(SQL)
    #cur_insert.execute(SQL2)

def get_inversion(idInversion):
    SQL = 'SELECT "idInversion", fapertura FROM inversion WHERE "idInversion" = %s;' %idInversion
    cur_inversion.execute(SQL)
    return cur_inversion.fetchone()

def build_inversion(idmovimiento, idejecutivo, idsucursal, fejecutivo):
    some_idinversion = fake.random_int(min=1, max=50000)
    inversion = get_inversion(some_idinversion)
    idinversion = inversion[0]
    finversion = inversion[1]
    fecha = finversion + relativedelta(months=fake.random_int(min=1, max=10))
    if fecha < fejecutivo:
        fecha = fejecutivo + relativedelta(months=fake.random_int(min=1, max=10)) 
    if fecha.year > 2016 or fecha < finversion:
        return
    monto = fake.random_int(min=1000, max=1000000)
    print 'INSERT INTO movimiento VALUES(%s, %s, %s, \'%s\');' %(idmovimiento, idejecutivo, idsucursal, fecha)
    print 'INSERT INTO movimiento_inversion VALUES(%s, %s, %s, \'%s\', %s, %s);' %(idmovimiento, idejecutivo, idsucursal, fecha, idinversion, monto)
    
def build_movimiento(how_many):
    how_many += 1
    idmovimiento = 100011
    for i in range(1, how_many):
        ejecutivo = get_ejecutivo(fake.random_int(min=1, max=135))
        idejecutivo = ejecutivo[0]
        idsucursal = ejecutivo[1]
        fejecutivo = ejecutivo[2]
        #sortear numeros para generar solo 1 entrada movimiento por cada m.ahorro y m.prestamo
        # numero = fake.random_int(min=1, max=2)
        # if numero == 1:
            # build_ahorro(idmovimiento, idejecutivo, idsucursal, fejecutivo)
        # else:
            # build_prestamo(idmovimiento, idejecutivo, idsucursal, fejecutivo)
        # idmovimiento += 1 
        build_inversion(idmovimiento, idejecutivo, idsucursal, fejecutivo)
        idmovimiento += 1

if __name__ == '__main__':
    build_movimiento(5000)


