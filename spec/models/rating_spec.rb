require 'rails_helper'

describe Rating do
  let(:emoji) { create(:emoji, verbal: 'emoji') }
  let(:distractor) { create(:emoji, verbal: 'distractor') }

  subject do
    described_class.new(emoji: emoji, distractor: distractor)
  end

  it 'returns stimuli as they are' do
    expect(subject.stimuli).to eq [emoji, distractor]
  end

  it 'returns the stimuli in the reversed order' do
    subject.reversed = true
    expect(subject.stimuli).to eq [distractor, emoji]
  end
end
