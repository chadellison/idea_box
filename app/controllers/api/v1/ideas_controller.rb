class Api::V1::IdeasController < Api::ApiController
  respond_to :json

  def index
    respond_with Idea.order(created_at: :desc)
  end

  def create
    respond_with Idea.create(idea_params), location: nil
  end

  def destroy
    respond_with Idea.find(params[:id]).destroy
  end

  def update
    idea = Idea.find(params[:id])
    idea.update_quality(params[:quality])
    respond_with
  end

  private

    def idea_params
      params.require(:post).permit(:title, :body)
    end
end
