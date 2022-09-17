class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.new
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
  end
end
