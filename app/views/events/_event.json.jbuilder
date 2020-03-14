# frozen_string_literal: true

json.extract! event, :id, :user_id, :genre_id, :events_name, :entrance_fee, :sports, :persons, :event_image_id, :event_status, :created_at, :updated_at
json.url event_url(event, format: :json)
