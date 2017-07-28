require 'rails_helper'

describe Subject do
  it 'generates a token automatically' do
    subject = Subject.create
    expect(subject.token).not_to be_empty
  end

  it 'generates ratings for the subject' do
    subject = Subject.create
    expect(subject.ratings.count).to eq 64
  end
end
