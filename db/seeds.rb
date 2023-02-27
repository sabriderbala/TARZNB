# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Caban.destroy_all

  Caban.create(
    {
      name: "Cabane d'arbre",
      address: "13 allée des pins",
      price: 122,
      description: "Magnifique cabane dans les arbres à 3 mètres de hauteur",
      user_id: 3
    }
  )

  Caban.create(
    {
      name: "Cabane en paille",
      address: "13 allée des paillassons",
      price: 178,
      description: "Magnifique cabane faite en paille à 10 mètres de hauteur",
      user_id: 3
    }
  )

  Caban.create(
    {
      name: "Cabane en bois",
      address: "13 allée des boiseries",
      price: 257,
      description: "Magnifique cabane faite en bois",
      user_id: 3
    }
  )

  Caban.create(
    {
      name: "Cabane en briqye",
      address: "13 rue des briques",
      price: 352,
      description: "Magnifique cabane faite en pierres, elle est très solide",
      user_id: 3
    }
  )
