class ChoreController < ApplicationController
  def new
    @chore = Chore.new
  end

  def index
  end

  def create
    @chore = Chore.new(chore_params)

    if @chore.save
      redirect_to @chore
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @chore = Chore.find(params[:id])
  end

  def edit
  end

  def delete
  end

  private
  def chore_params
    params.require(:chore).permit(:title, :desc)
  end
end
