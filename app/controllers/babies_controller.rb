class BabiesController < ApplicationController
  def index
  end

  def show
    @baby = Baby.find(params[:id])
    @memories = Memory.all
    authorize @baby
  end

  def new
    @baby = Baby.new
    authorize @baby
  end

  def create
    @baby = Baby.new(baby_params)
    @baby.user = current_user
    authorize @baby
    if @baby.save
      redirect_to baby_path(@baby)
    else
      render :new
    end
  end

  private

  def baby_params
    params.require(:baby).permit(:name)
  end
end
