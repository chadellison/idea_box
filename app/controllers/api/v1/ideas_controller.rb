class Api::V1::IdeasController < Api::ApiController
  respond_to :json

  def index
    respond_with Idea.order(created_at: :desc)
  end

  def show
    respond_with Idea.find(params[:id])
  end

  def create
    respond_with Idea.create(idea_params), location: nil
  end

  def destroy
    respond_with Idea.find(params[:id]).destroy
  end

  def update
    idea = Idea.find(params[:id])
    if params[:quality]
      respond_with idea.update_quality(params[:quality])
    else
      respond_with idea.update(idea_params)
    end
  end

  private

    def idea_params
      params.require(:idea).permit(:title, :body)
    end
end
