require 'rails_helper'

describe User do 
  describe "#create" do
    context "登録できること" do
      it "全てのカラムにデータがあると登録できる事" do
        user = build(:user)
        expect(create(:user)).to be_valid
      end

      it "nameが25文字以下だと登録できる事" do
        name = "#{"a" * 25}"
        user = build(:user, name: name)
        user.valid?
        expect(create(:user)).to be_valid
      end
  
      it "emailが100文字以下だと登録できる事" do
        email = "#{"a" * 100}"
        user = build(:user, email: email)
        expect(create(:user)).to be_valid
      end

      it "passwordが8文字以上だと登録できる事" do
        password = "#{"a" * 8}"
        user = build(:user, password: password, password_confirmation: password)
        expect(create(:user)).to be_valid
      end

      it "adminがnilでも登録できる事" do
        user = build(:user, admin: nil)
        expect(create(:user)).to be_valid
      end

      it "adminがtrueで登録できる事" do
        user = build(:user, admin: nil)
        expect(create(:user)).to be_valid
      end

      it "pictureがなくても登録できる事" do
        user = build(:user, picture: "")
        expect(create(:user)).to be_valid
      end

      it "profileがなくても登録できる事" do
        user = build(:user, profile: "")
        expect(create(:user)).to be_valid
      end
    end
    
    context "登録できない事" do
      it "nameがないと登録できない事" do
        user = build(:user, name: "")
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
      end

      it "nameが25文字以上だと登録できない事" do
        name = "#{"a" * 26}"
        user = build(:user, name: name)
        user.valid?
        expect(user.errors[:name]).to include("is too long (maximum is 25 characters)")
      end
      
      it "emailがないと登録できない事" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end
    
      it "email100文字以上だと登録できない事" do
        email = "#{"a" * 101}"
        user = build(:user, email: email)
        user.valid?
        expect(user.errors[:email]).to include("is too long (maximum is 100 characters)")
      end
  
      it "passwordとpassword_confirmationがないと登録できない事" do
        user = build(:user, password: "", password_confirmation: "")
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end
  
      it "password_confirmationが一致しないと登録できない事" do
        user = build(:user, password_confirmation: "bbbbbbbbb")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it "passwordが8文字以下だと登録できない事" do
        password = "#{"a" * 7}"
        user = build(:user, password: password, password_confirmation: password)
        user.valid?
        expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
      end
    end
  end
  describe "Method" do
    describe "def follow(other_user)" do
      it "userがother_userをフォローした場合followingsにother_userを追加する事" do
        user = create(:user)
        other_user = create(:user)
        user.follow(other_user)
        expect(user.followings.count).to eq(1)
      end

      it "userがother_userをフォローした場合followersにuserを追加する事" do
        user = create(:user)
        other_user = create(:user)
        user.follow(other_user)
        expect(other_user.followers.count).to eq(1)
      end
    end

    describe "def following?(other_user)" do
      it "userがother_userをフォローしていた場合following?(other_user)がtrueを返す事" do
        user = create(:user)
        other_user = create(:user)
        user.follow(other_user)
        expect(user.following?(other_user)).to be_truthy 
      end

      it "userがother_userをフォローしていない場合following?(other_user)がfalseを返す事" do
        user = create(:user)
        other_user = create(:user)
        expect(user.following?(other_user)).to be_falsey 
      end
    end

    describe "unfollow(other_user)" do
      it "unfollow(other_user)の結果、followingsが１人減る事" do
        user = create(:user)
        other_user = create(:user)
        user.follow(other_user)
        user.unfollow(other_user)
        expect(user.followings.count).to eq(0)
      end

      it "unfollow(other_user)の結果、followersが1人減る事" do
        user = create(:user)
        other_user = create(:user)
        user.follow(other_user)
        user.unfollow(other_user)
        expect(other_user.followers.count).to eq(0)
      end
    end

    describe "def feed" do
      it "feedの結果、followingsのpostを取得できる事" do
        user = create(:user)
        other_user = create(:user)
        other_user2 = create(:user)
        user.follow(other_user)
        user.follow(other_user2)
        create_list(:post, 5, user: other_user)
        create_list(:post, 5, user: other_user2)
        expect(user.feed.count).to eq(10)
      end
    end

    describe "already_liked?(post)" do
      it "postをいいねしていたらalready_liked?(post)がtrueを返すこと" do
        user = create(:user)
        post = create(:post)
        like = create(:like, user: user, post: post)
        expect(user.already_liked?(post)).to be_truthy
      end

      it "postをいいねしていなかったらalready_liked?(post)がfalseを返すこと" do
        user = create(:user)
        post = create(:post)
        expect(user.already_liked?(post)).to be_falsey
      end
    end
  end
end