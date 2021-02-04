# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Challenges', type: :request do
  describe 'GET /challenge', type: :request do
    it 'returns found http status' do
      get challenge_path
      expect(response).to have_http_status :found
    end

    it 'returns success http status' do
      user = create(:user)

      sign_in user
      get challenge_path
      expect(response).to have_http_status :success
    end
  end

  describe 'POST /challenge', type: :request do
    let(:user) { create(:user) }
    let(:params) do
      {
        challenge: {
          title: Faker::Lorem.sentence,
          description: Faker::Lorem.sentences(number: rand(5..20)).join(' '),
          tags: [Faker::ProgrammingLanguage.name, Faker::ProgrammingLanguage.name].join(', ')
        }
      }
    end

    before do
      sign_in user
    end

    it 'should redirect to challenges after creating a post' do
      post challenge_path, params: params
      expect(response).to redirect_to(challenges_path)
    end

    it 'should return failure status with invalid data' do
      headers = { 'ACCEPT' => 'application/json' }
      params[:challenge].delete(:title)
      post challenge_path, params: params, headers: headers
      result = JSON.parse(response.body).symbolize_keys
      expect(result[:success]).to be(false)
    end
  end

  describe 'GET /challenges', type: :request do
    let(:challenge) { create(:challenge, user: create(:user)) }

    it 'return success' do
      get challenges_path
      expect(response).to have_http_status(200)
    end
  end
end
