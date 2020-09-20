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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: 'Post successfully updated.'
    else
      flash.now.alert = 'Unable to update post, please check the details and try again.'
      render :edit
    end
  end

  def show
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end