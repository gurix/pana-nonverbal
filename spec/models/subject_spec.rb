require 'rails_helper'

describe Subject do
  it 'generates a token automatically' do
    subject = Subject.create
    expect(subject.token).not_to be_empty
  end
end
