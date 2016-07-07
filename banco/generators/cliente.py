from faker import Factory
fake = Factory.create()
table = '"cliente"'
for i in range(1, 100001):
    #need to build a date
    day = fake.random_int(min=1, max=28)
    month = fake.random_int(min=1, max=12)
    year = fake.random_int(min=1950, max=1996)
    date = str(year)+"/"+str(month)+"/"+str(day)
    #need to build a phone
    phone = fake.numerify(text="##########") 
    print "INSERT INTO %s VALUES(%s, '%s', '%s','%s','%s',%s,'%s','%s',%s,'%s', '%s');" %(table, i, fake.first_name(),
    fake.last_name(), fake.last_name(), fake.city_suffix(), fake.numerify(text="###"), fake.street_suffix(), 
    fake.state(), fake.zipcode(), date, phone) 

