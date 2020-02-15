class AddColumnsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :postcode, :integer
    add_column :events, :prefecture_code, :string
    add_column :events, :address_city, :string
    add_column :events, :address_street, :string
    add_column :events, :address_building, :string
  end
end
