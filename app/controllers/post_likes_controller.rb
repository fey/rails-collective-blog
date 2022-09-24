class PostLikesController < ApplicationController
  def create
    authenticate_user!
    post = Post.find(like_params[:post_id])

    post.likes.find_or_create_by(user: current_user)

    redirect_to post
  end

  def destroy
    authenticate_user!

    like = PostLike.find(params[:id])
    post = like.post

    like&.delete
    redirect_to post
  end

  private

  def like_params
    params.require(:post_like).permit(:post_id)
  end
end
