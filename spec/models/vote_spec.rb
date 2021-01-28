require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe 'Associations' do
    let(:vote) { create(:vote) }
    it 'should belongs to an user' do
      expect(vote.user).to_not be(nil)
    end

    it 'should belongs to a challenge' do
      expect(vote.challenge).to_not be(nil)
    end
  end
end
