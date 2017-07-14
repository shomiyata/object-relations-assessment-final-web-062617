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
