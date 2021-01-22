FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { "#{ first_name.downcase }_#{ last_name.downcase }" }
    email { Faker::Internet.safe_email(name: username) }
    password { username }
  end
end
