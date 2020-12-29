# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.destroy_all
Cake.destroy_all
Tier.destroy_all
ronda = Customer.create(username: "ronda", password: 'pw', email: 'rdc@gmail.com')

cake1 = Cake.create(style: "Birthday cake")
tier1 = Tier.create(flavor: "Chocolate", frosting: "Vanilla", filling: "Vanilla", size: 10, shape: "Round", instructions: "Happy Birthday Joan", cake_id: cake1.id, customer_id: ronda.id)

cake2 = Cake.create(style: "Anniversary Cake")
tier2 = Tier.create(flavor: "Vanilla", frosting: "Vanilla", filling: "Cookies n Cream", size: 8, shape: "Round", instructions: "Happy 50th Anniversary on side in gold", cake_id: cake2.id, customer_id: ronda.id)

cake3 = Cake.create(style: "Barbie Doll Cake")
tier3 = Tier.create(flavor: "Strawberry", frosting: "Cream Cheese", filling: "Strawberries & Cream", size: 8, shape: "Ball", instructions: "decorate in pinks and purples", cake_id: cake3.id, customer_id: ronda.id)

cake4 = Cake.create(style: "Groom's Cake")
tier4 = Tier.create(flavor: "Chocolate", frosting: "Chocolate", filling: "Chocolate", size: 10, shape: "Square", instructions: "chocolate strawberries on top", cake_id: cake4.id, customer_id: ronda.id)
cake5 = Cake.create(style: "Baby Shower cake")
tier5 = Tier.create(flavor: "Maple", frosting: "Vanilla", filling: "Maple", size: 8, shape: "Round", instructions: "make it look like a stack of pancakes with butter and syrup on top", cake_id: cake5.id, customer_id: ronda.id)
