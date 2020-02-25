class MemoriesController < ApplicationController
  def show
    @memory = Memory.find(params[:id])
    authorize @memory
  end

  def new
    @memory = Memory.new
    @baby = Baby.find(params[:baby_id])
    authorize @memory
  end

  def create
    @baby = Baby.find(params[:baby_id])
    @memory = Memory.new(memory_params)
    @memory.baby = @baby
    authorize @memory
    if @memory.save
      redirect_to memory_path(@memory)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def memory_params
    params.require(:memory).permit(:title, :description, :date, photos: [], videos: [])
  end
end
