require 'rails_helper'
require_relative '../../../app/services/challenge_services/create_challenge'

RSpec.describe ChallengeServices::CreateChallenge, type: :model do
  describe '#call' do
    let(:user) { create(:user) }
    let(:params) do
      {
        title: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraph(sentence_count: rand(2..5)),
        tags: Faker::Lorem.words(number: rand(1..5)).join(', ')
      }
    end

    it 'should create challenge, tags and tagged challenges' do
      # binding.pry
      result = ChallengeServices::CreateChallenge.new(params.merge(user: user)).call
      expect(result.success?).to eq(true)

      result = ChallengeServices::CreateChallenge.new(params).call
      expect(result.success?).to eq(false)
    end
  end
end
