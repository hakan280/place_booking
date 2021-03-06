# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    o1 = Owner.new(email: 'kara@gmail.com', password: '123456')
    o1.save
    Owner.create(email: 'hakan@gmail.com', password: '123456')
    c1 = Customer.new(email: 'kara@gmail.com', password: '123456')
    c1.save
    Customer.create(email: 'hakan@gmail.com', password: '123456')

    Category.create(name: 'Bar')
    Category.create(name: 'Restaurant')
    Category.create(name: 'Alakart')
    Category.create(name: 'Çay Bahçesi')

    Place.create(name: "Muğla Keşkek Evi",description: 'Muğlanın meşhur lezzetli keşkek', city: 'Muğla', phone_number: '5553999879', address: 'Menteşe Evleri No:60', contact_mail: 'abc@mugla.com', owner_id: o1.id, category_id: 1)
    Place.create(name: "Bolu Çiğ köfte",description: '1960\'den beri Bolu müthiş lezzettli çiğ köftecisi  ' , city: 'Bolu', phone_number: '5553999879', address: 'Bolu Merkez', contact_mail: 'xyz@mugla.com', owner_id: o1.id, category_id: 2)

    Comment.create(place_id: 1, customer_id: c1.id, body: 'Harika bir yer herkese öneririm')
    Comment.create(place_id: 2, customer_id: c1.id, body: 'Çok pahalı ve berbat yemekleri var')

    Reservation.create(customer_id: c1.id, place_id: 1 , date: DateTime.tomorrow, number_of_people: 4)
    Reservation.create(customer_id: c1.id , place_id: 1 , date: DateTime.tomorrow, number_of_people: 2)