# frozen_string_literal: true

class CollaborationsController < ApplicationController
  include CollaborationServices

  before_action :authenticate_user!, only: :collaborate

  def collaborate
    result = if params[:how] == 'remove'
               RemoveCollaborator.new(set_collaborate_params.merge(user: current_user)).call
             else
               AddCollaborator.new(set_collaborate_params.merge(user: current_user)).call
             end
    if result.success?
      redirect_to challenges_path
    else
      redirect_to challenges_path, notice: result.errors[:message]
    end
  end

  private

  def set_collaborate_params
    params.permit(:id, :how)
  end
end
