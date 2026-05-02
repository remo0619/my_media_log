require 'rails_helper'

RSpec.describe Content, type: :model do
  describe "バリデーション" do
    describe "title" do
      it "必須であること" do
        expect(build(:content, title: "")).not_to be_valid
      end

      it "255文字以内であること" do
        expect(build(:content, title: "a" * 256)).not_to be_valid
      end

      it "255文字なら有効であること" do
        expect(build(:content, title: "a" * 255)).to be_valid
      end
    end

    describe "url" do
      it "空なら有効であること" do
        expect(build(:content, url: "")).to be_valid
      end

      it "http/https 形式なら有効であること" do
        expect(build(:content, url: "https://example.com")).to be_valid
        expect(build(:content, url: "http://example.com/path?q=1")).to be_valid
      end

      it "URL形式でなければ無効であること" do
        expect(build(:content, url: "not-a-url")).not_to be_valid
        expect(build(:content, url: "ftp://example.com")).not_to be_valid
      end
    end

    describe "media_type" do
      it "必須であること" do
        expect(build(:content, media_type: "")).not_to be_valid
      end

      it "許可値（book/youtube/video/article/other）なら有効であること" do
        %w[book youtube video article other].each do |type|
          expect(build(:content, media_type: type)).to be_valid
        end
      end

      it "許可値以外は無効であること" do
        expect(build(:content, media_type: "manga")).not_to be_valid
      end
    end

    describe "status" do
      it "unread / done のみ有効であること" do
        expect(build(:content, status: :unread)).to be_valid
        expect(build(:content, status: :done)).to be_valid
      end
    end

    describe "rating" do
      it "nil なら有効であること" do
        expect(build(:content, status: :unread, rating: nil)).to be_valid
      end

      it "1〜5 の整数なら done 時に有効であること" do
        (1..5).each do |n|
          expect(build(:content, :done, rating: n)).to be_valid
        end
      end

      it "0 は無効であること" do
        expect(build(:content, :done, rating: 0)).not_to be_valid
      end

      it "6 は無効であること" do
        expect(build(:content, :done, rating: 6)).not_to be_valid
      end

      it "unread 時に rating があれば無効であること" do
        expect(build(:content, status: :unread, rating: 3)).not_to be_valid
      end
    end
  end

  describe "アソシエーション" do
    it "belongs_to :user" do
      content = create(:content)
      expect(content.user).to be_a(User)
    end
  end
end
