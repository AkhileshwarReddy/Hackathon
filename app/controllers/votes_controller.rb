class VotesController < ApplicationController
  include VoteServices

  before_action :authenticate_user!, only: :vote

  def vote
    result = if params[:how] == 'down'
               Downvote.new(set_vote_params.merge(user: current_user)).call
             else
               Upvote.new(set_vote_params.merge(user: current_user)).call
             end

    if result.success?
      redirect_to challenges_path
    else
      redirect_to challenges_path, alert: result.errors[:message]
    end
  end

  private

  def set_vote_params
    params.permit(:id, :how)
  end
end
