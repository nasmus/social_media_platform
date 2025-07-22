class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:create, :index]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to posts_path, notice: "Comment created successfully."
    else
      redirect_to posts_path, alert: "Failed to create comment."
    end
  end

  private

    def set_post
      @post = Post.find(params[:post_id])
    end
    
    def comment_params
      params.require(:comment).permit(:content, :parent_id)
    end
end
