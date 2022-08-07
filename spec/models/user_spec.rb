require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができるとき' do
    it 'すべての入力事項が存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'ニックネームが10文字以内であれば登録できる' do
      @user.nickname = 'テストマン01'
      expect(@user).to be_valid
    end
    it 'パスワードが6文字以上半角英数字であれば登録できる' do
      @user.password = '123abc'
      @user.password_confirmation = '123abc'
      expect(@user).to be_valid
    end 
  end

  context '新規登録ができないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('ニックネームを入力してください')
    end
    it 'nicknameが10文字以上だと登録できない' do
      @user.nickname = 'テストマンテストマンテストマン'
      @user.valid?
      expect(@user.errors.full_messages).to include('ニックネームは10文字以内で入力してください')
    end
    it 'emailが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールを入力してください')
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
    end
    it 'パスワードが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードを入力してください')
    end
    it 'パスワード(確認用)が空では登録できない' do
      @user.password = '123abc'
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end
    it 'パスワードが5文字以下だと登録できない' do
      @user.password = '12abc'
      @user.password_confirmation = '12abc'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end
    it 'パスワードが数字のみだと登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは半角英数字を含む必要があります')
    end
    it 'パスワードが英字のみだと登録できない' do
      @user.password = 'abcdefg'
      @user.password_confirmation = 'abcdefg'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは半角英数字を含む必要があります')
    end
    it 'パスワードが全角文字だと登録できない' do
      @user.password = 'あア。アあ漢'
      @user.password_confirmation = 'あア。アあ漢'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは半角英数字を含む必要があります')
    end
    it 'パスワードとパスワード(確認用)が不一致だと登録できない' do
      @user.password = '123abc'
      @user.password_confirmation = '123abcd'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end
  end
end
