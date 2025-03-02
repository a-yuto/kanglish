require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @comment = comments(:one)
  end

  test "should create comment" do
    assert_difference("Comment.count") do
      post post_comments_url(@post), params: { comment: { content: "新しいコメント" } }
    end

    assert_redirected_to post_url(@post)
  end

  test "should get edit" do
    get edit_post_comment_url(@post, @comment)
    assert_response :success
  end

  test "should update comment" do
    patch post_comment_url(@post, @comment), params: { comment: { content: "更新されたコメント" } }
    assert_redirected_to post_url(@post)
  end

  test "should destroy comment" do
    assert_difference("Comment.count", -1) do
      delete post_comment_url(@post, @comment)
    end

    assert_redirected_to post_url(@post)
  end
end
