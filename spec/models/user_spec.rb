require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての項目が正しく入力されていれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空だと登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空だと登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空だと登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが英数字混合でないと登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end

    it 'passwordが存在してもpassword_confimationが空だと登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが6文字以上であれば登録できる' do
      @user.password = "aaaa99"
      @user.password_confirmation = "aaaa99"
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下だと登録できない' do
      @user.password = "aaaa9"
      @user.password_confirmation = "aaaa9"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it '重複したemailが存在する場合登録できない' do
    end

    it 'last_nameが空だと登録できない' do 
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'last_nameが全角でないと登録できない' do
      @user.last_name = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Full-width characters")
    end

    it 'first_nameが空だと登録できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_nameが全角でないと登録できない' do
      @user.first_name = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name Full-width characters")
    end

    it 'last_name_kanaが空だと登録できない' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'last_name_kanaが全角でないと登録できない' do
      @user.last_name_kana = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
    end

    it 'first_name_kanaが空だと登録できない' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'first_name_kanaが全角でないと登録できない' do
      @user.first_name_kana = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
    end

    it 'birthdayが空だと登録できない' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
