require 'rails_helper'

RSpec.describe "ユーザー登録フロー", type: :system do
  it "新規登録してコンテンツ一覧へ遷移する" do
    visit root_path
    click_link "無料で始める"

    fill_in "ユーザー名", with: "testuser"
    fill_in "メールアドレス", with: "test@example.com"
    fill_in "パスワード", with: "password"
    fill_in "パスワード（確認）", with: "password"
    click_button "登録する"

    expect(page).to have_current_path(contents_path)
    expect(page).to have_text("コンテンツ一覧")
  end
end
