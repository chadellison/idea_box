class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
  end

  def create
    @idea = Idea.new(idea_params)

    respond_to do |format|
      if @idea.save
        format.html { render :partial => @idea, notice: 'Idea was successfully created.' }
        format.js
        # binding.pry
        # format.json { render json: @idea, status: :created, location: @idea }
      else
        # format.html { render action: "new" }
        # format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def idea_params
      params.require(:idea).permit(:title, :body)
    end
end
