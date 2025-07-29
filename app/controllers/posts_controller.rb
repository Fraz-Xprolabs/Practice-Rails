class PostsController < ApplicationController
  before_action :set_user, only: %i[ index new create ]

  def index; end

  def preview
    render :preview
  end

  def new
    @post = @posts.new
  end

  def create
    @post = @posts.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def recent
    @posts = Post.order(created_at: :desc).limit(5)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
