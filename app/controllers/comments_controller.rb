class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]

    if @comment.save
      flash[:success] = 'Comment saved successfully'
      redirect_to users_path
    else
      flash.now[:error] = 'Error: Comment could not be saved'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
