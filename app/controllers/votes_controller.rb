class VotesController < ApplicationController
  include VoteServices
  respond_to :js, :json, :html

  before_action :authenticate_user!, only: :vote

  def vote
    result = if params[:how] == 'down'
               Downvote.new(vote_params.merge(user: current_user)).call
             else
               Upvote.new(vote_params.merge(user: current_user)).call
             end

    if result.success?
      respond_with do |format|
        format.json { render json: result.to_json }
        format.html { redirect_to challenges_path, notice: result.message }
      end
    else
      respond_with do |format|
        format.json { render json: result.to_json }
        format.html { redirect_to challenges_path, alert: result.errors[:message] }
      end
    end
  end

  private

  def vote_params
    params.permit(:id, :how)
  end
end
