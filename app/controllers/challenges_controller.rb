require_relative '../services/challenge_services/create_challenge'

class ChallengesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  respond_to :js, :json, :html

  def index
    @challenges = Challenge.all

    respond_with do |format|
      format.any(:js, :json)
      format.html
    end
  end

  def new
    @challenge = Challenge.new
  end

  def create
    result = ChallengeServices::CreateChallenge.new(set_challenge_params.merge(user: current_user)).call

    if result.success?
      respond_with do |format|
        format.any(:js, :json) { render json: { status: 201 } }
        format.html { redirect_to challenges_path }
      end
    else
      respond_with do |format|
        format.any(:js, :json) { render json: { status: 402 } }
        format.html { redirect_to :new, alert: result.errors.message }
      end
    end
  end

  private

  def set_challenge_params
    params.require(:challenge).permit(:title, :description, :tags)
  end
end
