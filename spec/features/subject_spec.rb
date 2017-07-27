require 'rails_helper'

feature 'A subject' do
  it 'starts a survey' do
    visit root_path

    expect { click_link 'Start a new survey' }.to change { Subject.count }.by(1)
  end

  it 'is prompted to complete the survey if they goes back to the root path for some reason' do
    visit root_path

    expect(page).not_to have_link 'You already started a survey.'

    click_link 'Start a new survey'

    visit root_path

    expect(page).to have_link 'You already started a survey.'
  end
end
