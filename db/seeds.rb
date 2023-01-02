# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@studio1 = Studio.create!(name: "Paramount Pictures", location: "Hollywood")
@studio2 = Studio.create!(name: "Universal Studios", location: "Los Angeles")
@movie1 = @studio1.movies.create!(title: "Top Gun", creation_year: 1986, genre: "Action")
@movie2 = @studio2.movies.create!(title: "Harry Potter", creation_year: 2001, genre: "Fantasy")
@movie3 = @studio1.movies.create!(title: "Dumb and Dumber", creation_year: 1994, genre: "Comedy")
@actor1 = @movie1.actors.create!(name: "Tom Cruise", age: 60)
@actor2 = @movie1.actors.create!(name: "Val Kilmer", age: 63)
@actor3 = @movie1.actors.create!(name: "Kelly McGillis", age: 65)