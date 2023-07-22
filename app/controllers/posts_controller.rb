class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:id])
    @user = User.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      flash[:success] = 'Post saved successfully'
      redirect_to users_path
    else
      flash.now[:error] = 'Error: Post could not be saved'
      render :new
    end
  end

  def likes
    @post = Post.find(params[:id])
    Like.create(author_id: current_user.id, post_id: @post.id)
    redirect_to post_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
