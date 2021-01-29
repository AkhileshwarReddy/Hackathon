class CollaborationsController < ApplicationController
  before_action :authenticate_user!, only: :collaborate

  def collaborate
    result = CollaborationServices::AddCollaborator.new(params.merge(user: current_user)).call
    if result.success?
      redirect_to challenges_path
    else
      redirect_to challenges_path, notice: result.errors[:message]
    end
  end
end
