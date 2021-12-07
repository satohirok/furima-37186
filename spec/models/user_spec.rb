require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nickname,email,password,password_confirmation,名前（全角）,フリガナ,生年月日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'nicknameが40文字以下で登録できる' do
        @user.nickname = 'abcdefghijabcdefghijabcdefghijabcdefghij'
        expect(@user).to be_valid
      end
      it 'passwordが半角英字半角数字両方を含めて6文字以上であれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '同じメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは@を含まないと登録できない' do
        @user.email = 'hogefugagmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが5文字以下だと登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは数字だけでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'パスワードは英字だけでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'パスワードは確認用のパスワードが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '苗字が空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角文字で設定してください')
      end
      it '名が空だと登録できない' do
        @user.fast_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Fast name は全角文字で設定してください')
      end
      it '苗字に半角英数字が存在すると登録できない' do
        @user.last_name = 'abc123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角文字で設定してください')
      end
      it '名に半角英数字が存在すると登録できない' do
        @user.fast_name = 'def456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Fast name は全角文字で設定してください')
      end
      it '苗字のフリガナが空だと登録できない' do
        @user.kana_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last は全角カタカナで設定してください')
      end
      it '名のフリガナが空だと登録できない' do
        @user.kana_fast = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana fast は全角カタカナで設定してください')
      end
      it '苗字のフリガナに半角英数字が存在すると登録できない' do
        @user.kana_last = 'abc123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last は全角カタカナで設定してください')
      end
      it '名のフリガナに半角英数字が存在すると登録できない' do
        @user.kana_fast = 'def456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana fast は全角カタカナで設定してください')
      end
      it '苗字のフリガナにひらがなが存在すると登録できない' do
        @user.kana_last = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last は全角カタカナで設定してください')
      end
      it '名のフリガナにひらがなが存在すると登録できない' do
        @user.kana_fast = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana fast は全角カタカナで設定してください')
      end
      it '苗字のフリガナに漢字が存在すると登録できない' do
        @user.kana_last = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last は全角カタカナで設定してください')
      end
      it '名のフリガナに漢字が存在すると登録できない' do
        @user.kana_fast = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana fast は全角カタカナで設定してください')
      end
      it '生年月日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end