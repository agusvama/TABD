from faker import Factory
fake = Factory.create()
table = '"ejecutivo"'
idEjecutivo = 1
for i in range(1, 201):
    #hire date 
    day = fake.random_int(min=1, max=28)
    month = fake.random_int(min=4, max=12)
    year = fake.random_int(min=1993, max=2015)
    date = str(year)+"/"+str(month)+"/"+str(day)
    #birth date
    bday = fake.random_int(min=1, max=28)
    bmonth = fake.random_int(min=1, max=12)
    byear = fake.random_int(min=1975, max=1990)
    birth_date = str(byear)+"/"+str(bmonth)+"/"+str(bday)
    #jump if year - byear < 18
    if year - byear < 18:
        continue
    
    #need to build a phone
    phone = fake.numerify(text="##########") 
    #random para generar un nombre masculino o femenino
    numero = fake.random_int(min=1, max=2)
    if numero == 1:
        nombre = fake.first_name_male()
        sexo = 'M'
    if numero == 2:
        nombre = fake.first_name_female()
        sexo = 'F'

    print "INSERT INTO %s VALUES(%s, '%s', '%s','%s',%s,'%s','%s','%s',%s,'%s','%s','%s', '%s', '%s');" %(table, idEjecutivo, nombre, fake.last_name(), fake.last_name(), fake.random_int(min=1, max=10), birth_date, date, fake.street_name(), fake.numerify(text="###"), fake.street_suffix(), fake.state(), fake.zipcode(), phone, sexo) 

    idEjecutivo = idEjecutivo + 1

