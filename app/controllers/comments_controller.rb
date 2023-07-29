class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]

    if @comment.save
      flash[:success] = 'Comment saved successfully'
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      flash.now[:error] = 'Error: Comment could not be saved'
      render :new
    end
  end

  def destroy
    authorize! :destroy, @comment

    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(params[:user_id], params[:post_id]), notice: 'Comment deleted successfully'
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
