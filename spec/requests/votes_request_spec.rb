require 'rails_helper'

RSpec.describe 'Votes', type: :request do
  include ChallengesHelper

  describe '#vote' do
    let(:user) { create(:user) }
    let(:challenge) { create(:challenge, user: user) }

    it 'should vote a challenge' do
      sign_in user
      get vote_path(id: challenge.id, how: 'up')
      expect(challenge_votes(challenge)).to eq(1)
    end
  end
end
