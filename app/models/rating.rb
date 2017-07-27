class Rating < ApplicationRecord
  belongs_to :subject
  belongs_to :emoji
  belongs_to :choosen_emoji, class_name: 'Emoji', foreign_key: 'choosen_emoji_id'
end
