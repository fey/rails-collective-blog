# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.order(id: :desc)
  end

  def show
    @post = Post.find params[:id]
    @comments = @post.comments.roots.latest
    @comment = current_user&.comments&.build
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @categories = Category.all
    @post = current_user.posts.build(post_params)
    # @post = Post.create post_params

    if @post.save!
      redirect_to @post
    else
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
