require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test "visiting the index" do
    visit posts_url
    assert_selector "h1", text: "掲示板"
  end

  test "should create post" do
    visit posts_url
    click_on "新規投稿"

    fill_in "タイトル", with: "システムテストタイトル"
    fill_in "内容", with: "システムテスト内容"
    click_on "保存"

    assert_text "投稿が作成されました"
    click_on "戻る"
  end

  test "should update Post" do
    visit post_url(@post)
    click_on "編集", match: :first

    fill_in "タイトル", with: "更新されたタイトル"
    fill_in "内容", with: "更新された内容"
    click_on "保存"

    assert_text "投稿が更新されました"
    click_on "戻る"
  end

  test "should destroy Post" do
    visit posts_url
    page.accept_confirm do
      click_on "削除", match: :first
    end

    assert_text "投稿が削除されました"
  end
end
