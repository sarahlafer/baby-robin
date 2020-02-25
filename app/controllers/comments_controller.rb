class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @memory = Memory.find(params[:memory_id])
    authorize @memory
  end

  def create
    @comment = Comment.new(comment_params)
    @memory = Memory.find(params[:memory_id])
    @comment.memory = @memory
    @comment.user_id = current_user.id
    authorize @memory

    if @comment.save
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

  def comment_params
    params.require(:comment).permit(:text)
  end
end
