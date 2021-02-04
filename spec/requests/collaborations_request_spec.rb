require 'rails_helper'

RSpec.describe 'Collaborations', type: :request do
  describe '#collaborate' do
    let(:user) { create(:user) }
    let(:challenge) { create(:challenge) }

    let(:params) do
      {
        id: challenge.id,
        how: 'add'
      }
    end

    let(:headers) do
      { 'ACCEPT' => 'application/json' }
    end

    before do
      sign_in user
    end

    context 'with valid params' do
      it 'should return success response for adding collaboration' do
        get collaborate_path, params: params, headers: headers
        result = JSON.parse(response.body).symbolize_keys
        expect(result[:success]).to eq(true)
      end

      it 'should return success response for removing collaboration' do
        params[:how] = 'remove'
        get collaborate_path, params: params, headers: headers
        result = JSON.parse(response.body).symbolize_keys
        expect(result[:success]).to eq(true)
      end
    end

    context 'with invalid params' do
      it 'should return failure response for adding collaboration' do
        get collaborate_path, params: params.except(:id), headers: headers
        result = JSON.parse(response.body).symbolize_keys
        expect(result[:success]).to eq(false)
      end

      it 'should return failure response for removing collaboration' do
        params[:how] = 'remove'
        get collaborate_path, params: params.except(:id), headers: headers
        result = JSON.parse(response.body).symbolize_keys
        expect(result[:success]).to eq(false)
      end
    end
  end
end
