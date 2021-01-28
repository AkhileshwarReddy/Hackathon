FactoryBot.define do
  factory :vote do
    user { create(:user) }
    challenge { create(:challenge, user: user) }
  end
end
