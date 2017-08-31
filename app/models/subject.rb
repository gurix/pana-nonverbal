class Subject < ApplicationRecord
  validates :token, uniqueness: true
  validates :token, presence: true, unless: :new_record?

  before_create :reset_token
  after_create :generate_ratings

  has_many :ratings
  has_many :emojis, through: :ratings

  def reset_token
    self.token = generate_token(4) until unique_token?
  end

  def rate_next
    ratings.unrated.sample
  end

  private

  def generate_token(size)
    SecureRandom.base64(size).downcase.delete('/+=')[0, size]
  end

  def generate_ratings
    Rating.sample_weighted_ratings(44).each do |rating|
      ratings.create(emoji: rating[:emoji], distractor: rating[:distractor], reversed: [true, false].sample)
    end
    ratings
  end

  def unique_token?
    field = :token
    self.class.where(field => send(field)).blank? && send(field).present?
  end
end
