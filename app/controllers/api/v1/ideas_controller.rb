class Api::V1::IdeasController < Api::ApiController
  respond_to :json

  def index
    respond_with Idea.order(created_at: :desc)
  end

  def create
    respond_with Idea.create(idea_params), location: nil
  end

  def destroy
    Idea.find(params[:id]).destroy
    # respond_to do |format|
    #   format.html { render :partial => @idea }
    #   format.js
    # end
    redirect_to root_path
  end

  private

    def idea_params
      params.require(:post).permit(:title, :body)
    end
end
