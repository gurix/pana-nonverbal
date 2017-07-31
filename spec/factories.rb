FactoryGirl.define do
  factory :emoji do
    set 'test'
    dimension { %w[pa na].sample }
    polarity { %w[low high].sample }
    verbal { Faker :Lipsum.word }
  end
end
