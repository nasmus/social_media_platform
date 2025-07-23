class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:create, :destroy]

  def create
    @like = @post.likes.build(user: current_user)

    if @like.save
      redirect_to posts_path, notice: "Liked successfully."
    else
      redirect_to posts_path, alert: "Failed to like post."
    end
  end

  def destroy
    @like = @post.likes.find_by(user: current_user)
    
    if @like&.destroy
      redirect_to posts_path, notice: "Unliked successfully."
    else
      redirect_to posts_path, alert: "Failed to unlike post."
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
  
end
