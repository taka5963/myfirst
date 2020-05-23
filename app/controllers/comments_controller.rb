class CommentsController < ApplicationController
  # before_action :set_user

  def index
    # @comments = Comment.all
  end

  def new
    # @comment = Comment.new
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def create
    comment = Comment.create(comment_params)
    redirect_to "/posts/#{comment.post.id}"
    # @comment = @user.comments.new(comment_params)
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :image).merge(user_id: current_user.id,  post_id: params[:post_id])
  end

  # def set_user
  #   @user = User.find(params[:user_id])
  # end

end