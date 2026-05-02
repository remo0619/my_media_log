require 'rails_helper'

RSpec.describe "Contents", type: :request do
  let(:user)  { create(:user) }
  let(:other) { create(:user) }
  let!(:content) { create(:content, user: user) }

  describe "未ログイン時のリダイレクト" do
    it "GET /contents はログインページへリダイレクト" do
      get contents_path
      expect(response).to redirect_to(new_user_session_path)
    end

    it "GET /contents/:id はログインページへリダイレクト" do
      get content_path(content)
      expect(response).to redirect_to(new_user_session_path)
    end

    it "GET /contents/:id/edit はログインページへリダイレクト" do
      get edit_content_path(content)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "ログイン済み（本人）" do
    before { sign_in user }

    describe "GET /contents" do
      it "200 を返す" do
        get contents_path
        expect(response).to have_http_status(:ok)
      end
    end

    describe "GET /contents/:id" do
      it "200 を返す" do
        get content_path(content)
        expect(response).to have_http_status(:ok)
      end
    end

    describe "POST /contents（有効なパラメータ）" do
      let(:valid_params) { { content: { title: "新しい本", media_type: "book", status: "unread" } } }

      it "コンテンツが作成され詳細へリダイレクト" do
        expect {
          post contents_path, params: valid_params
        }.to change(Content, :count).by(1)
        expect(response).to redirect_to(content_path(Content.last))
      end
    end

    describe "POST /contents（無効なパラメータ）" do
      let(:invalid_params) { { content: { title: "", media_type: "book", status: "unread" } } }

      it "422 を返す" do
        post contents_path, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    describe "PATCH /contents/:id（本人が更新）" do
      it "更新され詳細へリダイレクト" do
        patch content_path(content), params: { content: { title: "更新済み" } }
        expect(response).to redirect_to(content_path(content))
        expect(content.reload.title).to eq "更新済み"
      end
    end

    describe "DELETE /contents/:id（本人が削除）" do
      it "削除され一覧へリダイレクト" do
        expect {
          delete content_path(content)
        }.to change(Content, :count).by(-1)
        expect(response).to redirect_to(contents_path)
      end
    end

    describe "PATCH /contents/:id/toggle_status" do
      it "unread → done に切り替わる" do
        expect(content.status).to eq "unread"
        patch toggle_status_content_path(content)
        expect(content.reload.status).to eq "done"
      end

      it "done → unread に切り替わり rating がリセットされる" do
        done_content = create(:content, :done, user: user)
        patch toggle_status_content_path(done_content)
        done_content.reload
        expect(done_content.status).to eq "unread"
        expect(done_content.rating).to be_nil
      end
    end
  end

  describe "ログイン済み（他ユーザー）" do
    before { sign_in other }

    it "GET /contents/:id は 404 を返す" do
      get content_path(content)
      expect(response).to have_http_status(:not_found)
    end

    it "PATCH /contents/:id は 404 を返す" do
      patch content_path(content), params: { content: { title: "改ざん" } }
      expect(response).to have_http_status(:not_found)
      expect(content.reload.title).not_to eq "改ざん"
    end
  end
end
