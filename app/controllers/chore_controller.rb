class ChoreController < ApplicationController
  require 'date'

  def new
    @chore = Chore.new
  end

  def index
    @chores = Chore.feed
  end

  def create
    @chore = Chore.new(chore_params)
    respond_to do |format|
      if @chore.save
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
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
    @chores = Chore.feed
    if @chore.update(completed_at: DateTime.now)
      render turbo_stream: turbo_stream.remove(@chore)
    else
      render :index
    end
  end

  def delete
  end

  private

  def chore_params
    params.require(:chore).permit(:title, :desc, :due_date)
  end
end
