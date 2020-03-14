# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_218_070_912) do
  create_table 'admins', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_admins_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admins_on_reset_password_token', unique: true
  end

  create_table 'bulletin_boards', force: :cascade do |t|
    t.text 'comment'
    t.integer 'user_id'
    t.integer 'event_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['event_id'], name: 'index_bulletin_boards_on_event_id'
    t.index ['user_id'], name: 'index_bulletin_boards_on_user_id'
  end

  create_table 'events', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'genre_id'
    t.string 'events_name'
    t.integer 'entrance_fee'
    t.integer 'sportst', default: 0, null: false
    t.integer 'persons'
    t.string 'event_image_id'
    t.boolean 'event_status', default: true, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.date 'holding'
    t.text 'description'
    t.integer 'postcode'
    t.string 'prefecture_code'
    t.string 'address_city'
    t.string 'address_street'
    t.string 'address_building'
    t.index ['genre_id'], name: 'index_events_on_genre_id'
    t.index ['user_id'], name: 'index_events_on_user_id'
  end

  create_table 'genres', force: :cascade do |t|
    t.string 'genre_name'
    t.boolean 'is_valid', default: true, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'genre_image_id'
  end

  create_table 'join_events', force: :cascade do |t|
    t.integer 'event_id'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['event_id'], name: 'index_join_events_on_event_id'
    t.index ['user_id'], name: 'index_join_events_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'family_name', default: '', null: false
    t.string 'first_name', default: '', null: false
    t.string 'family_name_kana', default: '', null: false
    t.string 'first_name_kana', default: '', null: false
    t.datetime 'deleted_at'
    t.string 'profile_image_id'
    t.string 'tel', default: '', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end
end
