class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def purge_avatar
    @post = Post.find(params[:id])
    @post.avatar.purge
    redirect_back fallback_location: root_path, notice: "success"
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: "Post was successfully destroyed."
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :avatar, images: [])
    end
end
