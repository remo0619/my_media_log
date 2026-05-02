require 'rails_helper'

RSpec.describe "コンテンツ操作フロー", type: :system do
  let(:user) { create(:user) }

  before do
    login_as user, scope: :user
  end

  describe "コンテンツ登録と一覧確認" do
    it "コンテンツを登録して一覧に表示される" do
      visit new_content_path

      fill_in "タイトル", with: "テスト用の本"
      select "本", from: "種別"
      select "未消化", from: "ステータス"
      click_button "登録する"

      expect(page).to have_current_path(%r{/contents/\d+})
      expect(page).to have_text("テスト用の本")

      visit contents_path
      expect(page).to have_text("テスト用の本")
    end
  end

  describe "ステータス切り替え" do
    let!(:content) { create(:content, user: user, title: "切り替えテスト") }

    it "一覧から「消化済みにする」を押すとステータスが変わる" do
      visit contents_path
      expect(page).to have_text("未消化")

      click_button "消化済みにする"

      expect(page).to have_text("消化済み")
      expect(content.reload.status).to eq "done"
    end

    it "詳細から「未消化に戻す」を押すと rating がリセットされる" do
      done_content = create(:content, :done, user: user, title: "done コンテンツ")
      visit content_path(done_content)

      click_button "未消化に戻す"

      expect(page).to have_text("未消化")
      expect(done_content.reload.rating).to be_nil
    end
  end

  describe "フィルタ・検索" do
    before do
      create(:content, user: user, title: "Ruby入門", media_type: "book", status: :unread)
      create(:content, user: user, title: "Rails動画", media_type: "video", status: :done, rating: 5)
      create(:content, user: user, title: "Ruby記事", media_type: "article", status: :unread)
    end

    it "種別で絞り込める" do
      visit contents_path
      select "本", from: "種別"
      click_button "検索"

      expect(page).to have_text("Ruby入門")
      expect(page).not_to have_text("Rails動画")
      expect(page).not_to have_text("Ruby記事")
    end

    it "ステータスで絞り込める" do
      visit contents_path
      select "消化済み", from: "ステータス"
      click_button "検索"

      expect(page).to have_text("Rails動画")
      expect(page).not_to have_text("Ruby入門")
    end

    it "キーワードで検索できる" do
      visit contents_path
      fill_in "キーワード", with: "Ruby"
      click_button "検索"

      expect(page).to have_text("Ruby入門")
      expect(page).to have_text("Ruby記事")
      expect(page).not_to have_text("Rails動画")
    end

    it "リセットリンクで絞り込みが解除される" do
      visit contents_path(media_type: "book")
      click_link "リセット"

      expect(page).to have_text("Ruby入門")
      expect(page).to have_text("Rails動画")
      expect(page).to have_text("Ruby記事")
    end
  end
end
