class ChallengesController < ApplicationController
  include ChallengeServices

  before_action :authenticate_user!, only: %i[new create]
  respond_to :js, :json, :html

  def index
    @challenges = sort_challenges(params[:sort_by])

    respond_with do |format|
      format.json { render json: @challenges.to_json }
      format.html
    end
  end

  def new
    @challenge = Challenge.new
  end

  def create
    result = CreateChallenge.new(challenge_params.merge(user: current_user)).call

    if result.success?
      respond_with do |format|
        format.json { render json: result.to_json }
        format.html { redirect_to challenges_path, notice: result.message }
      end
    else
      respond_with do |format|
        format.json { render json: result.to_json }
        format.html { redirect_to :new, alert: result.errors[:message] }
      end
    end
  end

  private

  def challenge_params
    params.require(:challenge).permit(:title, :description, :tags)
  end

  def sort_challenges(sort_by)
    case sort_by
    when 'votes'
      Challenge.all.sort_by { |challenge| -challenge.votes.count }.paginate(page: params[:page])
    when 'created_at'
      Challenge.unscoped.order(created_at: :desc).paginate(page: params[:page])
    else
      Challenge.all.paginate(page: params[:page])
    end
  end
end
