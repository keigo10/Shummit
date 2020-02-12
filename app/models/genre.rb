class Genre < ApplicationRecord
	has_many :events, dependent: :destroy
	validates :genre_name, presence: true

	attachment :genre_image
end
