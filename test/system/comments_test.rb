require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
    @comment = comments(:one)
  end

  test "creating a Comment" do
    visit post_url(@post)
    
    fill_in "コメント", with: "システムテストコメント"
    click_on "投稿する"

    assert_text "コメントが投稿されました"
  end

  test "updating a Comment" do
    visit post_url(@post)
    click_on "編集", match: :first

    fill_in "コメント", with: "更新されたコメント"
    click_on "更新する"

    assert_text "コメントが更新されました"
  end

  test "destroying a Comment" do
    visit post_url(@post)
    
    page.accept_confirm do
      click_on "削除", match: :first
    end

    assert_text "コメントが削除されました"
  end
end
