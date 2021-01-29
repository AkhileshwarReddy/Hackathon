FactoryBot.define do
  factory :collaboration do
    user { create(:user) }
    challenge { create(:challenge, user: user) }
  end
end
