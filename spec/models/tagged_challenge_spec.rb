require 'rails_helper'

RSpec.describe TaggedChallenge, type: :model do
  describe 'Validations' do
    let(:tagged_challenge) { build(:tagged_challenge) }

    it 'should have a challenge' do
      challenge = tagged_challenge.challenge

      tagged_challenge.challenge = nil
      expect(tagged_challenge.save).to eq(false)

      tagged_challenge.challenge = challenge
      expect(tagged_challenge.save).to eq(true)
    end

    it 'should have a tag' do
      tag = tagged_challenge.tag

      tagged_challenge.tag = nil
      expect(tagged_challenge.save).to eq(false)

      tagged_challenge.tag = tag
      expect(tagged_challenge.save).to eq(true)
    end
  end

  describe 'Associations' do
    let(:tagged_challenge) { build(:tagged_challenge) }

    it 'should belongs to a challenge' do
      expect(tagged_challenge.challenge.nil?).to eq(false)
    end

    it 'should belongs to a tag' do
      expect(tagged_challenge.tag.nil?).to eq(false)
    end
  end
end
