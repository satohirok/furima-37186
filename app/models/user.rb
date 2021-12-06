class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
         validates :encrypted_password,:password,:password_confirmation,length:{minimum:7},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}
         validates :nickname, presence: true
         validates :last_name, presence: true
         validates :fast_name, presence: true
         validates :kana_last, presence: true
         validates :kana_fast, presence: true
         validates :birthday, presence: true

         has_many :items
         has_many :purchases





 end
