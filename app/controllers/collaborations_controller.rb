# frozen_string_literal: true

class CollaborationsController < ApplicationController
  include CollaborationServices

  before_action :authenticate_user!, only: :collaborate
  respond_to :json, :html

  def collaborate
    result = if params[:how] == 'remove'
               RemoveCollaborator.new(collaboration_params.merge(user: current_user)).call
             else
               AddCollaborator.new(collaboration_params.merge(user: current_user)).call
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

  def collaboration_params
    params.permit(:id, :how)
  end
end
