# frozen_string_literal: true

class PostCommentsController < ApplicationController
  def create
    comment = current_user.comments.build(post_comment_params)

    comment.save!

    redirect_to comment.post
  end

  def post_comment_params
    params.require(:post_comment).permit(:content, :parent_id, :post_id)
  end
end
