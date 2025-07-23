class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.includes(:user, { comments: :user }, { likes: :user }).order(created_at: :desc)
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_param)
    if @post.save
      redirect_to posts_path
    else
      @posts = Post.includes(:user).order(created_at: :desc)
      redirect_to posts_path
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_param
    params.require(:post).permit(:content)
  end

  def authorize_user!
    redirect_to posts_path, notice:"not authorized" unless @post.user == current_user
  end

end
