# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.order(id: :desc)
  end

  def show
    @post = Post.find params[:id]
    @comments = @post.comments.roots.latest
    @comment = current_user&.comments&.build
    @user_like = @post.likes.find_by(user: current_user)
  end

  def new
    authenticate_user!
    @post = Post.new
    @categories = Category.all
  end

  def create
    authenticate_user!
    @categories = Category.all

    @post = Post.create(post_params.merge({ creator: current_user }))

    if @post.save
      flash[:success] = t('.success')
      redirect_to @post
    else
      flash.now[:error] = t('.unprocessable_entity')
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
