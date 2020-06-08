require 'rails_helper'

describe Relationship do
  describe "#create" do
    context "フォローできる事" do
      it "followingとfollowerがいればフォローできる事" do
        user = create(:user)
        other_user = create(:user)
        user.follow(other_user)
        expect(Relationship.all.count).to eq(1)
      end
    end
  end
end