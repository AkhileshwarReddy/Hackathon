FactoryBot.define do
  factory :tagged_challenge do
    tag { FactoryBot.create(:tag) }
    challenge { FactoryBot.create(:challenge) }
  end
end
