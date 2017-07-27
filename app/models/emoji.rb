class Emoji < ApplicationRecord
  validates :set, presence: true # Each emoji has to  appear in one of 4 different sets we test.

  # It has to be in the dimension PA (postitive affect) or NA (negative affect)
  validates :dimension, presence: true, inclusion: { in: %w[pa na] }

  # It has to have the polarity «low» or «high». i.e relaxed is NA low but stressed is NA high
  validates :polarity, presence: true, inclusion: { in: %w[low high] }

  # It has to have a verbal representation to the emoji like 😀 = happy
  validates :verbal, presence: true

  has_many :ratings
  has_many :subjects, through: :ratings

  # Find other emojis being in the same set, having the same dimension and polarity
  def find_similar_ones
    self.class.where(set: set, dimension: dimension, polarity: polarity)
  end
end
