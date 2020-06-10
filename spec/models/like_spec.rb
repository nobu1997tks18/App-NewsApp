require 'rails_helper' 

describe Like do
  describe "#create" do
    context "いいねできる事" do
      it "userとpostがあればいいねできる事" do
        user = create(:user)
        post = create(:post)
        expect(create(:like, user: user, post: post)).to be_valid
      end
    end
    context "いいねできない事" do
      it "userがいないといいね できない事" do
        post = create(:post)
        like = build(:like, post: post, user: nil)
        like.valid?
        expect(like.errors[:user]).to include("must exist")
      end

      it "postがないといいねできない事" do
        user = create(:user)
        like = build(:like, post: nil)
        like.valid?
        expect(like.errors[:post]).to include("must exist")
      end
    end
  end
end