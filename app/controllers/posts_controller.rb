class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
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
      redirect_to user_posts_path
    else
      flash.now[:error] = 'Error: Post could not be saved'
      render :new
    end
  end

  def destroy
    authorize! :destroy, @post

    @post = Post.find(params[:id])

    @post.comments.destroy_all
    @post.likes.destroy_all
    @post.destroy

    redirect_to user_posts_path, notice: 'Post deleted successfully'
  end

  def like
    @post = Post.find(params[:id])
    Like.create(author_id: current_user.id, post_id: @post.id)
    redirect_back(fallback_location: root_path)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
