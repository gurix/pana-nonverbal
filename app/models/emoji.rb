class Emoji < ApplicationRecord
  validates :set, presence: true # Each emoji has to  appear in one of 4 different sets we test.

  # It has to be in the dimension PA (postitive affect) or NA (negative affect)
  validates :dimension, presence: true, inclusion: { in: %w[pa na] }

  # It has to have the polarity «low» or «high». i.e relaxed is NA low but stressed is NA high
  validates :polarity, presence: true, inclusion: { in: %w[low high] }

  # It has to have a verbal representation to the emoji like 😀 = happy
  validates :verbal, presence: true

  has_many :ratings
  has_many :choosens, class_name: 'Rating', foreign_key: 'choosen_id'
  has_many :subjects, through: :ratings

  # Find the distractors of the opposite dimension with the oposite polarity. i.e «na,low» becomes «pa, high»
  def find_distractors
    distractor_dimension = dimension == 'pa' ? 'na' : 'pa'
    distractor_polarity = polarity == 'low' ? 'high' : 'low'
    self.class
        .where(set: set, dimension: distractor_dimension, polarity: distractor_polarity)
        .or(self.class.where(set: set, dimension: dimension, polarity: polarity))
        .where.not(id: id)
  end

  # Calculate the image name or retrun a placeholder if it does not exist
  def image_name
    path = "sets/#{set}/#{dimension}_#{polarity}_#{verbal}"
    # Rails.application.assets.find_asset(path).nil? ? 'placeholder' : path
    path
  end
end
