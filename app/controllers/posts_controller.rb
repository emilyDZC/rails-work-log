class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Post successfully created.'
    else
      flash.now.alert = 'Unable to create post, please check the details and try again.'
      render :new
    end
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end