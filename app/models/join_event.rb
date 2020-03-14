# frozen_string_literal: true

class JoinEvent < ApplicationRecord
  belongs_to :event
  belongs_to :user
end
