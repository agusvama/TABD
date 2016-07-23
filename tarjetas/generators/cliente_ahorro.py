from faker import Factory
fake = Factory.create()
import psycopg2
conn = psycopg2.connect("dbname=banco user=postgres")
cur = conn.cursor()
cur.execute("SET SEARCH_PATH TO banco;")

insert_ahorro =""

#from table ahorro, get any idAhorro
def get_idahorro():
    idahorro = fake.random_int(min=1, max=100000)
    SQL = 'SELECT "idAhorro", "idCliente", fcontratacion FROM ahorro WHERE "idAhorro" = %s' %idahorro
    cur.execute(SQL)
    return cur.fetchone()

def get_cliente():
    global insert_ahorro
    ahorro = get_idahorro()
    idahorro = ahorro[0] #idAhorro
    idcliente = ahorro[1]
    fecha_apertura = ahorro[2]
    SQL = 'SELECT * FROM cliente WHERE "idCliente" = %s' %idcliente
    cur.execute(SQL)
    insert_ahorro =  'INSERT INTO ahorro VALUES(%s, %s, \'%s\');' %(idahorro, idcliente, fecha_apertura)
    return cur.fetchone()

def build_cliente(cliente):
        idcliente = cliente[0]
        nombre = cliente[1]
        apellidoa = cliente[2]
        apellidob = cliente[3]
        fnacimiento = cliente[9]
        calle = cliente[4]
        numero = cliente[5]
        colonia = cliente[6]
        ciudad = cliente[7]
        cp = cliente[8]
        fafiliacion = cliente[12]
        telefono = cliente[10]
        sexo = cliente[11]

        print 'INSERT INTO cliente VALUES(%s, \'%s\', \'%s\', \'%s\', \'%s\', \'%s\', %s, \'%s\', \'%s\', %s, \'%s\', \'%s\', \'%s\');' %(idcliente, nombre, apellidoa, apellidob, fnacimiento, calle, numero, colonia, ciudad, cp, fafiliacion, telefono, sexo)
        print insert_ahorro

def generator(how_many):
    clientes_already = []
    for i in range(0, how_many):
        cliente = get_cliente()
        #check if cliente is not already 
        idcliente = cliente[0]
        if idcliente in clientes_already:
            continue
        build_cliente(cliente)

        #push the idcliente to the already list
        clientes_already.append(idcliente)

if __name__ == "__main__":
    generator(45000)
