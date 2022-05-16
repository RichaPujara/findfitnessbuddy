# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

admin = User.create(email:"admin@test.com", password: "admin123")
trainer = User.create(email:"trainer@test.com", password: "trainer123")
trainee = User.create(email:"trainee@test.com", password: "trainee123")

profile1 Profile.create(user_id: 1, first_name: "John", last_name: "Doe", contact_number: 123456789,   )