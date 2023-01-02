require 'rails_helper'

RSpec.describe Movie, type: :feature do
  describe 'show page' do
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

    it 'I see the movie\'s title, creation year, and genre,' do
      visit "/movies/#{@movie1.id}"

      expect(page).to have_content "Top Gun"
      expect(page).to have_content "1986"
      expect(page).to have_content "Action"
    end

    it 'and a list of all its actors from youngest to oldest.' do
      visit "/movies/#{@movie1.id}"

      expect("Tom Cruise").to appear_before "Val Kilmer"
      expect("Val Kilmer").to appear_before "Kelly McGillis"
    end

    it 'And I see the average age of all of the movie\'s actors' do
      visit "/movies/#{@movie1.id}"

      expect(page).to have_content "Average Age: 62.7"
    end
  end
end