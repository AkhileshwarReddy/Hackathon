require 'rails_helper'

RSpec.describe 'Votes', type: :request do
  include ChallengesHelper

  describe '#vote' do
    let(:user) { create(:user) }
    let(:challenge) { create(:challenge, user: user) }

    before do
      sign_in user
    end

    it 'should vote a challenge' do
      get vote_path(id: challenge.id, how: 'up')
      expect(challenge.votes.count).to eq(1)
    end

    it 'should get failure status if tried vote twice' do
      get vote_path(id: challenge.id, how: 'up')
      get vote_path(id: challenge.id, how: 'up')
      expect(challenge.votes.count).to eq(1)
    end

    it 'should remove vote for a challenge' do
      get vote_path(id: challenge.id, how: 'down')
      expect(challenge.votes.count).to eq(0)
    end

    it 'should get failure status if tried downvote twice' do
      get vote_path(id: challenge.id, how: 'down')
      get vote_path(id: challenge.id, how: 'down')
      expect(challenge.votes.count).to eq(0)
    end
  end
end
