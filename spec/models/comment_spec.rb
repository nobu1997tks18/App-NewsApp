require 'rails_helper'

describe Comment do
  describe "#create" do
    context "投稿できる事" do
      it "全てのカラムにデータがあると保存できる事" do
        comment = build(:comment)
        expect(create(:comment)).to be_valid
      end
    end
    context "投稿できない事" do
      it "contentがないと登録できない事" do
        post = build(:comment, content: "")
        post.valid?
        expect(post.errors[:content]).to include("can't be blank")
      end

      it "user_idがないと登録できない事" do
        post = build(:comment, user: nil)
        post.valid?
        expect(post.errors[:user]).to include("must exist")
      end

      it "post_idがないと登録できない事" do
        post = build(:comment, post: nil)
        post.valid?
        expect(post.errors[:post]).to include("must exist")
      end
    end
  end
end