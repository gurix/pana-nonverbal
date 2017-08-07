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
    unfinnished_ratings.sample
  end

  def unfinnished_ratings
    ratings.where(rated_at: nil)
  end

  private

  def generate_token(size)
    SecureRandom.base64(size).downcase.delete('/+=')[0, size]
  end

  def generate_ratings
    Emoji.all.each do |emoji|
      emoji.find_distractors.each do |distractor|
        ratings.create(emoji: emoji, distractor: distractor, reversed: [true, false].sample)
      end
    end
    ratings
  end

  def unique_token?
    field = :token
    self.class.where(field => send(field)).blank? && send(field).present?
  end
end
