require 'rails_helper'

describe Relationship do
  describe "#create" do
    context "フォローできる事" do
      it "followingとfollowerがいればフォローできる事" do
        user = create(:user)
        other_user = create(:user)
        user.follow(other_user)
        expect(create(:relationship,follower_id: other_user.id)).to be_valid
      end
    end
    context "フォローできない事" do
      
    end
  end
end