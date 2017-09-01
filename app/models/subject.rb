class Subject < ApplicationRecord
  validates :token, uniqueness: true
  validates :token, presence: true, unless: :new_record?

  before_create :reset_token
  after_create :generate_ratings

  has_many :ratings
  has_many :emojis, through: :ratings

  # Reset the token and proceed until a uniq token is found
  def reset_token
    self.token = generate_token(8) until unique_token?
  end

  # Sample an emoji to rate next
  def rate_next
    ratings.unrated.sample
  end

  private

  # Generates an random token so we don't have to expose the id in public
  def generate_token(size)
    SecureRandom.base64(size).downcase.delete('/+=')[0, size]
  end

  # Check if the generated token is unique, it is rar but in theory it is possible that we generate a token twice.
  def unique_token?
    field = :token
    self.class.where(field => send(field)).blank? && send(field).present?
  end

  # Each participant get a list of rating in advance after create
  def generate_ratings
    Rating.build_ratings.map do |rating|
      ratings.create(emoji: rating[:emoji], distractor: rating[:distractor], reversed: [true, false].sample)
    end
  end
end
