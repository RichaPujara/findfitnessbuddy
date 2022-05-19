# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Booking.destroy_all
WorkoutSession.destroy_all
Buddy.destroy_all
User.destroy_all

admin = User.create(email: "admin@test.com" ,password: "admin123",first_name: "John", last_name: "Doe", contact_number: 040000000)
admin.add_role :admin
enthusiast  = User.create(email: "enthusiast@test.com" ,password: "enthu123",first_name: "Luke", last_name: "Skywalker", contact_number: 0411111111)
trainer = User.create(email: "trainer@test.com" ,password: "trainer123",first_name: "Harry", last_name: "Potter", contact_number: 0422222222)

