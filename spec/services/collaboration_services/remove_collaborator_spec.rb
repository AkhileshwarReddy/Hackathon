require 'rails_helper'

RSpec.describe CollaborationServices::RemoveCollaborator, type: :model do
  describe '#call' do
    let(:user) { create(:user) }
    let(:challenge) { create(:challenge) }

    context 'with valid params' do
      it 'returns success response' do
        result = CollaborationServices::RemoveCollaborator.new({ id: challenge.id, user: user }).call
        expect(result.success?).to eq(true)
      end
    end

    context 'with invalid params' do
      it 'returns failure response' do
        result = CollaborationServices::RemoveCollaborator.new({ id: challenge.id }).call
        expect(result.success?).to eq(false)
      end
    end
  end
end