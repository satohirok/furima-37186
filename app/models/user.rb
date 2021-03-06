class User < ApplicationRecord
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable

validates :nickname, presence: true, length: { maximum: 40 }
validates :birthday, presence: true
PASSWORD_RULE = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
validates_format_of :password, with: PASSWORD_RULE, message: 'には英字と数字の両方を含めて設定してください'
NAME_RULE = /\A[ぁ-んァ-ヶー一-龠]+\z/.freeze
validates_format_of :last_name, with: NAME_RULE, message: 'は全角文字で設定してください'
validates_format_of :fast_name, with: NAME_RULE, message: 'は全角文字で設定してください'
FURIGANA_NAME_RULE = /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/.freeze
validates_format_of :kana_last, with: FURIGANA_NAME_RULE, message: 'は全角カタカナで設定してください'
validates_format_of :kana_fast, with: FURIGANA_NAME_RULE, message: 'は全角カタカナで設定してください'
end