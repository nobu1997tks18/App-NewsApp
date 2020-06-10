require 'rails_helper'

describe Post do
  describe "#create" do
    context "投稿できる事" do
      it "全てのカラムにデータがあると投稿できる事" do
        post = build(:post)
        expect(create(:post)).to be_valid
      end

      it "contentが140文字以下なら投稿できる事" do
        content = "#{"a" * 140}"
        post = build(:post, content: content)
        expect(create(:post)).to be_valid
      end

      it "urlが200文字以下なら投稿できる事" do
        url = "#{"a" * 200}"
        post = build(:post, url: url)
        expect(create(:post)).to be_valid
      end
    end

    context "投稿できない事" do
      it "contentがないと投稿できない事" do
        post = build(:post, content: "")
        post.valid?
        expect(post.errors[:content]).to include("can't be blank")
      end

      it "contentが140文字以上だと投稿できない事" do
        content = "#{"a" * 141}"
        post = build(:post, content: content)
        post.valid?
        expect(post.errors[:content]).to include("is too long (maximum is 140 characters)")
      end

      it "urlがないと投稿できない事" do
        post = build(:post, url: "")
        post.valid?
        expect(post.errors[:url]).to include("can't be blank")
      end

      it "urlが200文字以上だと投稿できない事" do
        url = "#{"a" * 201}"
        post = build(:post, url: url)
        post.valid?
        expect(post.errors[:url]).to include("is too long (maximum is 200 characters)")
      end

      it "userがいないと投稿できない事" do
        post = build(:post, user: nil)
        post.valid?
        expect(post.errors[:user]).to include("must exist")
      end
    end
  end
end