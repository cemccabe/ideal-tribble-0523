class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def actors_by_age
    self.actors.order(:age)
  end

  def average_age
    self.actors.average(:age).round(1)
  end
end
