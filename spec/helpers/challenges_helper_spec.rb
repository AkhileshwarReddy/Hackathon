require 'rails_helper'

RSpec.describe ChallengesHelper, type: :helper do
  describe '#challenge_tags' do
    let(:tagged_challenge) { create(:tagged_challenge) }

    it 'should return challenge tags' do
      expect(challenge_tags(tagged_challenge.challenge_id).first).to eq(tagged_challenge.tag)
    end
  end

  describe '#challenge_collaborators' do
    let(:collaboration) { create(:collaboration) }

    it 'should return collaborator' do
      expect(challenge_collaborators(collaboration.challenge_id)).to eq([collaboration.user])
    end
  end

  describe '#is_a_collaborator?' do
    let(:collaboration) { create(:collaboration) }

    it 'should return true' do
      expect(is_a_collaborator?(collaboration.challenge_id, collaboration.user_id)).to eq(true)
    end
  end

  describe '#voted?' do
    let(:vote) { create(:vote) }

    it 'should return true' do
      expect(voted?(vote.challenge_id, vote.user_id)).to eq(true)
    end
  end
end
