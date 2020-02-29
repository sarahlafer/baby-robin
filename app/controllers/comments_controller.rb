class CommentsController < ApplicationController
  before_action :set_comment, only: [ :edit, :update, :destroy ]

  def new
    @comment = Comment.new
    @memory = Memory.find(params[:memory_id])
    authorize @comment
  end

  def create
    @comment = Comment.new(comment_params)
    @memory = Memory.find(params[:memory_id])
    @comment.memory = @memory
    @comment.user = current_user
    authorize @comment
    if @comment.save
      respond_to do |format|
        format.html { redirect_to memory_path(@memory) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'memories/show' }
        format.js  # <-- idem
      end
    end
  end

  def edit
  end

  def update
    @comment.update(comment_params)
    if @comment.save
      redirect_to memory_path(@comment.memory)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def set_comment
    @comment = Comment.find(params[:id])
    authorize @comment
  end
end
