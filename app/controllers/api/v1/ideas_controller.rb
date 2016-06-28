class Api::V1::IdeasController < Api::ApiController
  respond_to :json

  def index
    # @ideas = Idea.order(created_at: :desc)
    # @idea = Idea.new
    respond_with Idea.order(created_at: :desc)
  end

  def create
    @idea = Idea.new(idea_params)

    respond_to do |format|
      if @idea.save
        format.html { render :partial => @idea, notice: "Idea was successfully created." }
        format.js
        # binding.pry
        # format.json { render json: @idea, status: :created, location: @idea }
      else
        # format.html { render action: "new" }
        # format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end

    def destroy
      Idea.find(params[:id]).destroy
      # respond_to do |format|
      #   format.html { render :partial => @idea }
      #   format.js
      # end
      redirect_to root_path
    end
  end

  private

    def idea_params
      params.require(:idea).permit(:title, :body)
    end
end
