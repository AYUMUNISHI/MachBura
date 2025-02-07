require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
   context '新規登録できるとき' do
    it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaと first_name_kana、birthday が存在すれば登録できる' do
      expect(@user).to be_valid
    end
   end
   context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailは@がないと登録できない' do
      @user.email = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'Passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'Passwordが数字のみだと登録できない' do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'Passwordが英字のみだと登録できない' do
      @user.password = 'AAAAAA'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'Passwordにが5文字未満の場合登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'password_confirmationがpasswordと同じでなければ登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'Last nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'Last nameが全角でなければ登録できない' do
      @user.last_name = 'A!2'
      @user.valid?
      expect(@user.errors.full_messages).to include( "Last name に全角文字を使用してください")
    end
    it 'First nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'First nameが全角でなければ登録できない' do
      @user.first_name = 'A!2'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name に全角文字を使用してください")
    end
    it 'Last name kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'Last name kanaはカナ文字のみでないと登録できない' do
      @user.last_name_kana = 'aあ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana はカナ文字のみ使用できます")
    end
    it 'First name kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'First name kanaはカナ文字のみでないと登録できない' do
      @user.first_name_kana = 'aあ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana はカナ文字のみ使用できます")
    end
   end
  end
end
