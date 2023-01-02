require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it {should belong_to :studio}
    it {should have_many :movie_actors}
    it {should have_many(:actors).through(:movie_actors)}
  end

  describe 'instance methods' do
    before :each do
      @studio1 = Studio.create!(name: "Paramount Pictures", location: "Hollywood")
      @studio2 = Studio.create!(name: "Universal Studios", location: "Los Angeles")
      @movie1 = @studio1.movies.create!(title: "Top Gun", creation_year: 1986, genre: "Action")
      @movie2 = @studio2.movies.create!(title: "Harry Potter", creation_year: 2001, genre: "Fantasy")
      @movie3 = @studio1.movies.create!(title: "Dumb and Dumber", creation_year: 1994, genre: "Comedy")
      @actor1 = @movie1.actors.create!(name: "Tom Cruise", age: 60)
      @actor2 = @movie1.actors.create!(name: "Val Kilmer", age: 63)
      @actor3 = @movie1.actors.create!(name: "Kelly McGillis", age: 65)
    end

    it 'returns all actors in a movie ordered by age (young to old' do
      expect(@movie1.actors_by_age).to eq([@actor1, @actor2, @actor3])
    end

    it 'returns average age of actors in a movie' do
      expect(@movie1.average_age).to eq(62.7)
    end
  end
end
