class Rating < ApplicationRecord
  belongs_to :subject
  belongs_to :emoji
  belongs_to :distractor, class_name: 'Emoji', foreign_key: 'distractor_id'
  belongs_to :choosen, class_name: 'Emoji', foreign_key: 'choosen_id', optional: true # Choosen stimuli either the correct emojo or the distractor

  scope :rated, -> { where.not(rated_at: nil) } # Already rated by the participant
  scope :unrated, -> { where(rated_at: nil) } # Queue of emojis a participant has to rate

  # Order of stimuli presented as buttons
  def stimuli
    reversed ? [distractor, emoji] : [emoji, distractor]
  end

  # Build ratings for a new participant
  def self.build_ratings
    Emoji.where(only_verbal: false).map do |emoji|
      # Find all possible distractors for this emoji
      distractors = emoji.find_distractors.map do |distractor|
        # Count how many times it already was rated
        count_allready_rated = rated.where(emoji: emoji, distractor: distractor).count
        { emoji: emoji, distractor: distractor, count: count_allready_rated }
      end
      # Take the least rated distractor. .
      distractors.sort_by { |x| x[:count] }.first
    end
  end
end
