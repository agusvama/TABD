from faker import Factory
fake = Factory.create()

def build_sucursal(i):
    date = "1994/3/27" #fecha de apertura
    phone = fake.numerify(text="##########") 
    print "INSERT INTO sucursal VALUES(%s, '%s','%s','%s', '%s', '%s', '%s', '%s');" %(i, fake.street_name(), fake.numerify(text="###"), fake.street_suffix(), fake.state(), fake.zipcode(), date, phone)

def generator(how_many):
    for i in range(1,  how_many):
        build_sucursal(i)

if __name__ == "__main__":
    generator(11)
