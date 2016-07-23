from faker import Factory
fake = Factory.create()
import psycopg2
conn = psycopg2.connect("dbname=banco user=postgres")

idinversion = 1
idcliente = 1
for i in range(0, 50000):
    fapertura = '19/06/2016'
    plazo = 6

    print 'INSERT INTO inversion VALUES(%s, %s, \'%s\', %s)' %(idinversion, idcliente, fapertura, plazo)
    idinversion += 1
    idcliente += 2


