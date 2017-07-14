class Movie
  attr_accessor :title

  @@all = []

  def initialize(title)
    self.title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_title(title)
    all.detect { |movie| movie.title == title }
  end

  def ratings
    Rating.all.select { |rating| rating.movie == self }
  end

  def viewers
    ratings.collect { |rating| rating.viewer }
  end

  def scores
    ratings.collect { |rating| rating.score }
  end

  def average_rating
    scores.inject { |sum, rating| sum + rating }.to_f / scores.length
  end
end
