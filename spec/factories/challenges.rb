FactoryBot.define do
  factory :challenge do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph sentence_count: rand(2..5) }
    user { FactoryBot.create(:user) }
  end
end
