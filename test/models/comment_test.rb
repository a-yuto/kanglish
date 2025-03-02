require "test_helper"

class CommentTest < ActiveSupport::TestCase
  setup do
    @post = posts(:one)
  end

  test "should not save comment without content" do
    comment = @post.comments.build
    assert_not comment.save, "内容なしでコメントを保存しました"
  end

  test "should not save comment without post" do
    comment = Comment.new(content: "テストコメント")
    assert_not comment.save, "投稿なしでコメントを保存しました"
  end

  test "should save valid comment" do
    comment = @post.comments.build(content: "テストコメント")
    assert comment.save, "有効なコメントを保存できませんでした"
  end
end
