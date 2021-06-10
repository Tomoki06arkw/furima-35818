require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいきとき' do
      it "Nickname, Password, First_name, Last_name, First_name_kana, Last_name_kana, birthday" do
        expect(@user).to be_valid
      end      
      it "Nicknameが6文字以下で登録できる" do
        expect(@user).to be_valid
      end
      it "Passwordが6文字以上であれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録が上手くいかない時' do
      it 'Nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'Emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'Emailが一意性でないと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'Emailが@がないと登録できない' do
        @user.email = 'ttomoco'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'Passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'Passwordが5文字以下では登録できない' do
        @user.password = '000a'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"        
      end
      it 'Passwordが半角英数字混合でないと登録出来ない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include  "Password is invalid. Input half-width characters."
      end
      it 'PasswordとPassword_confirmationの値は一致でないと登録できない' do
        @user.password_confirmation = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'お名前(全角)は、名字と名前がどちらかが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'お名前(全角)は、名字と名前がどちらかが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力でないと登録できない' do
        @user.first_name = 'ghghgl'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid. Input full-width characters."
      end
      it 'お名前カナ(全角)は、名字と名前がどちらかが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'お名前カナ(全角)は、名字と名前がどちらかが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it '名前カナ(全角)は、全角（カタカナ）での入力でないと登録できない' do
        @user.last_name_kana = 'kakakaka'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid. Input full-width katakana characters."
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
