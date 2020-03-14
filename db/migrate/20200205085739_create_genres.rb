# frozen_string_literal: true

class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :genre_name
      t.boolean :is_valid, default: true, null: false

      t.timestamps
    end
  end
end
