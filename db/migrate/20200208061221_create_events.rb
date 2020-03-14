# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.references :genre, foreign_key: true
      t.string :events_name
      t.integer :entrance_fee
      t.integer :sportst, null: false, default: 0
      t.integer :persons
      t.string :event_image_id
      t.boolean :event_status, default: true, null: false

      t.timestamps
    end
  end
end
