class MemoriesController < ApplicationController
  before_action :set_memory, only: [ :edit, :update, :destroy ]

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
    @memory.user = current_user
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
    @memory.update(memory_params)
    if @memory.save
      redirect_to memory_path(@memory)
    else
      render :edit
    end
  end

  def destroy
    @memory.destroy
    authorize @memory.baby
    redirect_to baby_path(@memory.baby)
  end

  private

  def memory_params
    params.require(:memory).permit(:title, :description, :date, photos: [], videos: [])
  end

  def set_memory
    @memory = Memory.find(params[:id])
    authorize @memory
  end
end
