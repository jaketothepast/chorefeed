class ChoreController < ApplicationController
  def new
    @chore = Chore.new
  end

  def index
    @chores = Chore.all
  end

  def create
    @chore = Chore.new(chore_params)

    if @chore.save
      redirect_to @chore
    else
      puts @chore.errors
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @chore = Chore.find(params[:id])
  end

  def edit
    @chore = Chore.find(params[:id])
  end

  def update
    @chore = Chore.find(params[:id])

    if @chore.update(chore_params)
      redirect_to @chore
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def delete
  end

  private
  def chore_params
    params.require(:chore).permit(:title, :desc)
  end
end
