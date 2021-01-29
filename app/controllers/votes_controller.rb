require_relative '../services/vote_services/upvote'

class VotesController < ApplicationController
  respond_to :js, :json, :html
  before_action :authenticate_user!, only: :vote

  def vote
    result = VoteServices::Upvote.new(params.merge(user: current_user)).call
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
