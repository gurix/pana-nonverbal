require 'rails_helper'

describe Emoji do
  subject do
    described_class.new(set: :test, dimension: :pa, polarity: :low, verbal: :test)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a set' do
    subject.set = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a dimension' do
    subject.dimension = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an unknown dimension' do
    subject.dimension = :wtf
    expect(subject).to_not be_valid
  end

  it 'is not valid without a polarity' do
    subject.polarity = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an unknown polarity' do
    subject.polarity = :somehow_in_between
    expect(subject).to_not be_valid
  end

  it 'is not valid without a verbal' do
    subject.verbal = nil
    expect(subject).to_not be_valid
  end

  it 'finds its distractors' do
    initial_subject = described_class.find_by(set: 'ML_simple', dimension: :na, polarity: :high, verbal: 'gestresst')

    expect(initial_subject.find_distractors.count).to eq 7

    # Test if all distractors from the opposite dimension are included
    described_class.where(set: 'ML_simple', dimension: :pa, polarity: :low).each do |emoji|
      expect(initial_subject.find_distractors).to include(emoji)
    end

    # Test if all distractors from the same dimension are included expect the queried emoji itself
    (described_class.where(set: 'ML_simple', dimension: :na, polarity: :high) - [initial_subject]).each do |emoji|
      expect(initial_subject.find_distractors).to include(emoji)
    end

    # Do not inlude itself
    expect(initial_subject.find_distractors).not_to include(initial_subject)

    # Test whether the oposite dimension with the false polarity is included
    expect(initial_subject.find_distractors).not_to include(described_class.where(set: 'ML_simple', dimension: :pa, polarity: :low))
  end
end
