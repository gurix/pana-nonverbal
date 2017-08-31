class Rating < ApplicationRecord
  belongs_to :subject
  belongs_to :emoji
  belongs_to :distractor, class_name: 'Emoji', foreign_key: 'distractor_id'
  belongs_to :choosen, class_name: 'Emoji', foreign_key: 'choosen_id', optional: true

  scope :rated, -> { where.not(rated_at: nil) }
  scope :unrated, -> { where(rated_at: nil) }

  def stimuli
    reversed ? [distractor, emoji] : [emoji, distractor]
  end

  # Calculate a list with all possible rating combinations
  def self.possible_combinations
    Emoji.where(only_verbal: false).map do |emoji|
      emoji.find_distractors.map do |distractor|
        count_allready_rated = rated.where(emoji: emoji, distractor: distractor).count
        { emoji: emoji, distractor: distractor, count: count_allready_rated }
      end
    end.flatten
  end

  # Sample n ratings from half of the possible rating combinations that already rated the least
  def self.sample_weighted_ratings(n)
    list_of_combinations = possible_combinations
    return list_of_combinations.sort_by { |x| x[:count] }.first(list_of_combinations.size / 2).sample(n) if count > 30
    list_of_combinations.sample(n)
  end
end
