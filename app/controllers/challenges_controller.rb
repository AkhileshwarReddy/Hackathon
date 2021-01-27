class ChallengesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @challenges = Challenge.all
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.create_challenge_with_tags(set_challenge_params, current_user)

    if @challenge.id.nil?
      redirect_to :new
    else
      redirect_to challenges_path
    end
  end

  private

  def set_challenge_params
    params.require(:challenge).permit(:title, :description, :tags)
  end
end
