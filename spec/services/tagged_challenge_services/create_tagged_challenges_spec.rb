require 'rails_helper'
require_relative '../../../app/services/tagged_challenge_services/create_tagged_challenges'

RSpec.describe TaggedChallengeServices::CreateTaggedChallenges, type: :model do
  describe '#call' do
    let(:user) { create(:user) }
    let(:tags) { create_list(:tag, rand(1..5)) }
    let(:challenge) { create(:challenge, user: user) }

    it 'should create tagged challenges' do
      result = TaggedChallengeServices::CreateTaggedChallenges.new({ tags: tags, challenge: challenge }).call
      expect(result.success).to eq(true)
    end
  end
end
