class Event < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :join_events, dependent: :destroy

  enum sportst: {スポーツではない: 0, やや体を動かす: 1,体を動かす: 2,激しく体を動かす: 3}

  validates :events_name, presence: true
  validates :entrance_fee, presence: true
  validates :persons, presence: true
  validates :event_status, presence: true
  validates :holding, presence: true
  validates :description, presence: true
  validates :postcode, presence: true
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
