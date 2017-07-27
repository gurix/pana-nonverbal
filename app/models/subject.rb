class Subject < ApplicationRecord
  validates :token, uniqueness: true
  validates :token, presence: true, unless: :new_record?

  before_create :reset_token

  has_many :ratings
  has_many :emojis, through: :ratings

  private

  def reset_token
    self.token = generate_token(4) until unique_token?
  end

  def generate_token(size)
    SecureRandom.base64(size).downcase.delete('/+=')[0, size]
  end

  def unique_token?
    field = :token
    self.class.where(field => send(field)).blank? && send(field).present?
  end
end
