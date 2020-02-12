class Event < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :join_events, dependent: :destroy

  enum sportst: {スポーツではない: 0, やや体を動かす: 1,体を動かす: 2,激しく体を動かす: 3}
end
