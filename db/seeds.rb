# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create!({
  last_name: "le TA",
  first_name: "Baptiste",
  email: "baptiste.le-ta@lewagon.com",
  password: "123456"
})

Caban.create!({
  name: "Cabane 1",
  address: "68 avenue Parmentier",
  price: 120,
  description: "Description de la cabane 1",
  user_id: user.id
})
