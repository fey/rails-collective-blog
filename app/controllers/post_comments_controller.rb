# frozen_string_literal: true

class PostCommentsController < ApplicationController
  def create
    authenticate_user!
    @post = Post.find(post_comment_params[:post_id])
    @comments = @post.comments.roots.latest
    @comment = current_user.comments.build(post_comment_params)

    if @comment.save
      flash[:success] = t('.success')
      redirect_to comment.post
    else
      flash.now[:error] = @comment.errors.first.full_message
      render 'posts/show'
    end
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:content, :parent_id, :post_id)
  end
end
