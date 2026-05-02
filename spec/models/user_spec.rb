require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーション" do
    describe "username" do
      it "必須であること" do
        expect(build(:user, username: "")).not_to be_valid
      end

      it "2文字以上であること" do
        expect(build(:user, username: "a")).not_to be_valid
      end

      it "20文字以内であること" do
        expect(build(:user, username: "a" * 21)).not_to be_valid
      end

      it "2〜20文字なら有効であること" do
        expect(build(:user, username: "ab")).to be_valid
        expect(build(:user, username: "a" * 20)).to be_valid
      end

      it "一意であること" do
        create(:user, username: "taro")
        expect(build(:user, username: "taro")).not_to be_valid
      end
    end

    describe "email" do
      it "必須であること" do
        expect(build(:user, email: "")).not_to be_valid
      end

      it "メール形式でなければ無効であること" do
        expect(build(:user, email: "not-an-email")).not_to be_valid
      end

      it "一意であること" do
        create(:user, email: "dup@example.com")
        expect(build(:user, email: "dup@example.com")).not_to be_valid
      end
    end
  end

  describe "アソシエーション" do
    it "has_many :contents" do
      user = create(:user)
      create_list(:content, 2, user: user)
      expect(user.contents.count).to eq 2
    end

    it "ユーザー削除時にコンテンツも削除されること" do
      user = create(:user)
      create(:content, user: user)
      expect { user.destroy }.to change(Content, :count).by(-1)
    end
  end
end
