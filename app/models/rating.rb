class Rating < ApplicationRecord
  belongs_to :subject
  belongs_to :emoji
  belongs_to :distractor, class_name: 'Emoji', foreign_key: 'distractor_id'
  belongs_to :choosen, class_name: 'Emoji', foreign_key: 'choosen_id', optional: true

  def stimuli
    reversed ? [distractor, emoji] : [emoji, distractor]
  end
end
