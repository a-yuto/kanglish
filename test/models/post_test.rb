require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "should not save post without title" do
    post = Post.new(content: "テスト内容")
    assert_not post.save, "タイトルなしで投稿を保存しました"
  end

  test "should not save post without content" do
    post = Post.new(title: "テストタイトル")
    assert_not post.save, "内容なしで投稿を保存しました"
  end

  test "should save valid post" do
    post = Post.new(title: "テストタイトル", content: "テスト内容")
    assert post.save, "有効な投稿を保存できませんでした"
  end
end
