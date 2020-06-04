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
end