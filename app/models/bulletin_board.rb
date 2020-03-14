# frozen_string_literal: true

class BulletinBoard < ApplicationRecord
  belongs_to :user
  belongs_to :event
end
