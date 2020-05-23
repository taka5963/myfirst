class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.all
    # @posts = Post.includes(:user).order("created_at DESC")
  end

  def new
    @post = Post.new
  end
  
  def create
    Post.create(post_params)
    # redirect_to root_path
  end

  def show
    @posts = Post.all
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end


  private
  def post_params
    params.require(:post).permit(:title, :image, :text).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id]) 
  end

end
