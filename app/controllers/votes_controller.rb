require_relative '../services/vote_services/upvote'

class VotesController < ApplicationController
  respond_to :js, :json, :html
  before_action :authenticate_user!, only: :vote

  def vote
    result = VoteService::Upvote.new(params.merge(user: current_user)).call
    respond_with do |format|
      format.html { redirect_to challenges_path }
      format.json { { success: result.success? } }
    end
  end

  private

  def set_vote_params
    params.permit(:id, :how)
  end
end
