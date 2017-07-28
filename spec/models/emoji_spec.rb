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
    initial_subject = described_class.create(set: :test, dimension: :pa, polarity: :low, verbal: :initial)
    distractor = described_class.create(set: :test, dimension: :na, polarity: :high, verbal: :distractor)
    false_dimension = described_class.create(set: :test, dimension: :pa, polarity: :high, verbal: :false_dimension)
    false_polarity = described_class.create(set: :test, dimension: :na, polarity: :low, verbal: :false_polarity)

    expect(initial_subject.find_distractors.count).to eq 1
    expect(initial_subject.find_distractors).to include(distractor)
    expect(initial_subject.find_distractors).not_to include(false_dimension)
    expect(initial_subject.find_distractors).not_to include(false_polarity)
  end
end
