require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    let(:user) { create(:user) }

    it 'should have username' do
      user.username = nil
      expect(user.save).to eq(false)

      user.username = Faker::Internet.username
      expect(user.save).to eq(true)
    end

    it 'should have first name' do
      user.first_name = nil
      expect(user.save).to eq(false)

      user.first_name = Faker::Name.first_name
      expect(user.save).to eq(true)
    end


    it 'should have last name' do
      user.last_name = nil
      expect(user.save).to eq(false)

      user.last_name = Faker::Name.last_name
      expect(user.save).to eq(true)
    end
  end
end
