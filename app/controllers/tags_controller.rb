class TagsController < ApplicationController
  before_action :force_json, only: [:search]
  def search
    @tags = Tag.where('tags.name LIKE ?', "%#{params[:q]}%")
  end

  private

  def force_json
    request.format = :json
  end
end
