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
    # binding.pry
    @challenge = Challenge.new(set_challenge_params.except(:tags))
    @challenge.user = current_user
    if @challenge.save
      respond_with do |format|
        format.any(:js, :json) { render json: { status: 201 } }
        format.html { redirect_to challenges_path }
      end
    else
      respond_with do |format|
        format.any(:ja, :json) { render json: { status: 402 } }
        format.html { redirect_to :new }
      end
    end
  end

  private

  def set_challenge_params
    params.require(:challenge).permit(:title, :description, :tags)
  end
end
