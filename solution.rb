# Please copy/paste all three classes into this file to submit your solution!
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



class Rating
  attr_accessor :score, :movie, :viewer

  @@all = []

  def initialize(score, movie, viewer)
    self.score = score
    self.movie = movie
    self.viewer = viewer
    @@all << self
  end

  def self.all
    @@all
  end
end



class Viewer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    self.first_name = first_name
    self.last_name = last_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    all.detect { |viewer| viewer.full_name == name }
  end

  def create_rating(score, movie)
    Rating.new(score, movie, self)
  end
end
