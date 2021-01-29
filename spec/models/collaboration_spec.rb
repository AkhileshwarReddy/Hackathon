require 'rails_helper'

RSpec.describe Collaboration, type: :model do
  describe 'Associations' do
    let(:collaboration) { create(:collaboration) }

    it 'should belongs to a challenge' do
      expect(collaboration.challenge).to_not eq(nil)
    end

    it 'should belongs to an user' do
      expect(collaboration.user).to_not eq(nil)
    end
  end
end
