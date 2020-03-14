# frozen_string_literal: true

class PostcodeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A[0-9]{3}-[0-9]{4}\z/
      record.errors.add(attribute, 'は、数字3桁＋ハイフン（-）＋数字4桁の形式で入力してください。')
    end
  end
end

class DateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    value = record.send("#{attribute}_before_type_cast")
    begin
      Date.parse value if value.present?
    rescue ArgumentError
      record.errors[attribute] << I18n.t('errors.messages.invalid')
    end
  end
end

class Event < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :join_events, dependent: :destroy
  has_many :bulletin_boards, dependent: :destroy

  enum sportst: { スポーツではない: 0, やや体を動かす: 1, 体を動かす: 2, 激しく体を動かす: 3 }

  validates :events_name, length: { in: 2..20 }, presence: true
  validates :entrance_fee, presence: true, format: { with: /\A[0-9０-９]+\z/, message: 'は全て数字で入力' }
  validates :persons, presence: true, format: { with: /\A[0-9０-９]+\z/, message: 'は全て数字で入力' }
  validates :event_status, presence: true
  validates :holding, presence: true, date: true
  validates :description, length: { in: 2..50 }, presence: true
  validates :prefecture_code, presence: true
  validates :address_city, presence: true
  validates :address_street, presence: true

  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
end
