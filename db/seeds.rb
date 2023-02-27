# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Caban.create({
  name: "Caban 1",
  address: "Caban 1",
  price: 100,
  description: "Caban 1",
  user_id: 2
})

Caban.create({
  name: "Caban 2",
  address: "Caban 2",
  price: 150,
  description: "Caban 2",
  user_id: 3
})
