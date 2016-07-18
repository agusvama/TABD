from faker import Factory
fake = Factory.create()

#generate random numbers for:
#month: 1-12
#day: 1-28
#UPDATE to table tarjeta_datos
def genera_month():
    return fake.random_int(min=1, max=12)

def genera_day():
    return fake.random_int(min=1, max=28)

def genera_fechas(how_many):
    idAhorro = 1
    for i in range(0, how_many):
        how_many += 1
        month = genera_month()
        day = genera_day()
        print 'UPDATE tarjeta_datos SET "fcorte_mes" = %s, "fcorte_dia" = %s WHERE "idAhorro" = %s;' %(month, day, idAhorro)

        idAhorro += 1


if __name__ == "__main__":
    genera_fechas(50000)

