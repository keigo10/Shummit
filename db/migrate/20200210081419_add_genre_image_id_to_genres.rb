class AddGenreImageIdToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :genre_image_id, :string
  end
end
