# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @post = posts(:two)
    @like = post_likes(:one)
  end
  test '#create' do
    sign_in @user
    post post_likes_url(@post, post_like: { post_id: @post.id })

    assert_response :redirect
  end

  test '#destroy' do
    sign_in @user
    delete post_like_url(@post, @like)

    assert_response :redirect
  end

  test '#destroy by other user' do
    other_user = users(:two)
    sign_in other_user
    like = post_likes(:one)

    delete post_like_path(@post, like)
    assert_response :redirect

    assert { PostLike.exists?(like.id) }
  end
end
