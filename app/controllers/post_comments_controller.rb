# frozen_string_literal: true

class PostCommentsController < ApplicationController
  def create; end

  def post_comment_params
    params.require(:post_comment).permit(:content, :creator_id, :parent_id)
  end
end
