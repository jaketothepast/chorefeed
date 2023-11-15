class ChoreController < ApplicationController
  require 'date'

  def new
    @chore = Chore.new
  end

  def index
    @chores = Chore.where(completed_at: nil)
  end

  def create
    @chore = Chore.new(chore_params)

    if @chore.save
      redirect_to chore_index_url
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

  def complete_chore
    @chore = Chore.find(params[:id])
    if @chore.update(completed_at: DateTime.now)
      # This returns a response where the index is missing the latest completed version
      @chores = Chore.where(completed_at: nil)
      return render :index
    end

    redirect_to chore_index_url
  end


  def delete
  end

  private
  def chore_params
    params.require(:chore).permit(:title, :desc)
  end
end
