require 'rails_helper'

def with_correct_word
  rating_id = /(\d+)/.match(current_path)[1].to_i
  Rating.find(rating_id).emoji.verbal
end

feature 'Survey' do
  scenario 'participate by clicking through the whole survey' do
    140.times do
      visit root_path

      click_link 'Start a new survey'

      Subject.last.ratings.count.times do |_index|
        click_link with_correct_word
      end

      expect(page).to have_content 'Thank you for taking the time to complete this survey.'

      Subject.last.ratings.each do |rating|
        expect(rating.emoji).to eq rating.choosen
        expect(rating.rated_at).to be > rating.showed_at
      end
    end

    statistics = DescriptiveStatistics::Stats.new(Rating.group('emoji_id, distractor_id').count.values)

    expect(statistics.mean).to be > 18
  end
end
