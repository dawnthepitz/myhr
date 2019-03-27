# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
gifts = [{name:'Electric Fan',price:500},
		{name:'Microwave',price:3000},
		{name:'Oven Toaser',price:900},
		{name:'Flat Screen TV 20"',price:500}]

Gift.create(gifts)