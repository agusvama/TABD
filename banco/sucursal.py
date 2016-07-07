from faker import Factory
fake = Factory.create()
table = '"sucursal"'
date = "1993/3/27"
for i in range(1, 11): #10 sucursales
    #need to build a phone
    phone = fake.numerify(text="##########") 
    print "INSERT INTO %s VALUES(%s, '%s', %s,'%s','%s',%s,'%s', '%s');" %(table, i, fake.street_name(), fake.numerify(text="###"), fake.street_suffix(), fake.state(), fake.zipcode(), date, phone)

