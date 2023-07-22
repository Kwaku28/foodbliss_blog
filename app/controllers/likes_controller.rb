class LikesController < ApplicationController
  def create
    @like = Like.new
    @post = Post.find(params[:post_id])
    @like.post_id = @post.id
    @like.author_id = current_user.id

    if @like.save
      redirect_back(fallback_location: root_path, notice: 'Like was successfully created.')
    else
      render :new, alert: 'Like was not created.'
    end
  end
end
