require 'rails_helper'

RSpec.describe Challenge, type: :model do
  describe "Validations" do
    let(:challenge) { create(:challenge) }

    it 'should have a title' do
      challenge.title = nil
      expect(challenge.save).to eq(false)

      challenge.title = Faker::Lorem.sentence
      expect(challenge.save).to eq(true)
    end

    it 'should have a description' do
      challenge.description = nil
      expect(challenge.save).to eq(false)

      challenge.description = Faker::Lorem.paragraph sentence_count: rand(2..5)
      expect(challenge.save).to eq(true)
    end
  end

  describe "Associations" do
    let(:challenge) { build(:challenge) }

    it 'should belongs to a user' do
      challenge.user = nil
      expect(challenge.save).to eq(false)

      challenge.user = create(:user)
      expect(challenge.save).to eq(true)
    end
  end
end
