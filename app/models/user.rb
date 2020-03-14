# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :join_events, dependent: :destroy
  has_many :bulletin_boards, dependent: :destroy

  validates :family_name, presence: true, length: { minimum: 1, maximum: 10 }
  validates :first_name, presence: true, length: { minimum: 1, maximum: 10 }
  validates :family_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。' }, length: { minimum: 1, maximum: 10 }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。' }, length: { minimum: 1, maximum: 10 }
  validates :tel, presence: true, numericality: true, format: { with: /\A\d{10}$|^\d{11}\z/, message: 'はハイフンなし10桁or11桁で入力してください。' }

  acts_as_paranoid

  attachment :profile_image
end
