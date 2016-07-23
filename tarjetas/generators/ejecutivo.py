from faker import Factory
fake = Factory.create()

def hire_date():
    #hire date 
    #1994/03/27 + (1 to 9) months
    day = 27
    month = 3 + fake.random_int(min=1, max=3)
    year = 1994
    date = str(year)+"/"+str(month)+"/"+str(day)
    return date

def birth_date():
    #birth date
    #1994/03/27 - (18 to 30) years
    bday = 27
    bmonth = 3
    byear = 1994 - fake.random_int(min=18, max=30)
    bdate = str(byear)+"/"+str(bmonth)+"/"+str(bday)
    return bdate

def get_phone():
    phone = fake.numerify(text="##########") 
    return phone
    
def build_ejecutivo(how_many):
    for i in range (1, how_many):
        idejecutivo = i
        idsucursal = fake.random_int(min=1, max=10)
        if idsucursal <= 5:
            nombre = fake.first_name_male()
            sexo = 'M'
        else:
            nombre = fake.first_name_female()
            sexo = 'F'
        apellidoa = fake.last_name()
        apellidob = fake.last_name()
        fecha_nacimiento = birth_date()
        fecha_contratacion = hire_date()
        calle = fake.street_name()
        numero = fake.numerify(text="###")
        colonia = fake.street_suffix()
        ciudad = fake.state()
        cp = fake.zipcode()
        telefono = get_phone()

        print 'INSERT INTO ejecutivo VALUES(%s, %s, \'%s\', \'%s\', \'%s\', \'%s\', \'%s\', \'%s\', %s, \'%s\', \'%s\', \'%s\', \'%s\', \'%s\');' %(idejecutivo, idsucursal, nombre, apellidoa, apellidob, fecha_nacimiento, fecha_contratacion, calle, numero, colonia, ciudad, cp, telefono, sexo)

if __name__ == "__main__":
    build_ejecutivo(50)

