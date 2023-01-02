require 'rails_helper'

RSpec.describe Studio, type: :feature do
  describe 'index page' do
    before :each do
      @studio1 = Studio.create!(name: "Paramount Pictures", location: "Hollywood")
      @studio2 = Studio.create!(name: "Universal Studios", location: "Los Angeles")
      @movie1 = @studio1.movies.create!(title: "Top Gun", creation_year: 1986, genre: "Action")
      @movie2 = @studio2.movies.create!(title: "Harry Potter", creation_year: 2001, genre: "Fantasy")
      @movie3 = @studio1.movies.create!(title: "Dumb and Dumber", creation_year: 1994, genre: "Comedy")
    end

    it 'Then I see all of the studios including name and location' do
      visit '/studios'

      expect(page).to have_content "Paramount Pictures"
      expect(page).to have_content "Hollywood"
      expect(page).to have_content "Universal Studios"
      expect(page).to have_content "Los Angeles"
    end

    it 'And under each studio I see all of the studio\'s movies including the movie\'s title, creation year, and genre' do
      visit '/studios'

      expect(page).to have_content "Top Gun"
      expect(page).to have_content "Harry Potter"
      expect(page).to have_content "Dumb and Dumber"
      expect(page).to have_content "1986"
      expect(page).to have_content "2001"
      expect(page).to have_content "1994"
      expect(page).to have_content "Action"
      expect(page).to have_content "Fantasy"
      expect(page).to have_content "Comedy"

    end
  end
end