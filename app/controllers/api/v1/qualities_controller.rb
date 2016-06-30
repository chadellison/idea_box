class Api::V1::QualitiesController < Api::ApiController
  respond_to :json

  def index
    respond_with Idea.where(quality: params[:quality].to_i).order(created_at: :desc)
  end
end
