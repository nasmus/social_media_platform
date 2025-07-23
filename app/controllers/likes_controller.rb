class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:create, :destroy]
  
  def create
    if params[:comment_id]
      @comment = @post.comments.find(params[:comment_id])
      @like = @comment.likes.find_or_initialize_by(user: current_user)
    else
      @like = @post.likes.find_or_initialize_by(user: current_user)
    end

    if @like.new_record?
      @like.save
      flash[:notice] = "Liked successfully."
    else
      flash[:alert] = "Already liked."
    end
    redirect_back fallback_location: root_path
  end

  def destroy
    if params[:comment_id]
      @comment = @post.comments.find(params[:comment_id])
      @like = @comment.likes.find_by(user: current_user)
    else
      @like = @post.likes.find_by(user: current_user)
    end

    if @like
      @like.destroy
      flash[:notice] = "Unliked successfully."
    else
      flash[:alert] = "Like not found."
    end
    redirect_back fallback_location: root_path
  end


  private

  def set_post
    @post = Post.find(params[:post_id])
  end
  
end
