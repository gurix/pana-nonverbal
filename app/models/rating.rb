class Rating < ApplicationRecord
  belongs_to :subject
  belongs_to :emoji
  belongs_to :distractor, class_name: 'Emoji', foreign_key: 'distractor_id'
end
