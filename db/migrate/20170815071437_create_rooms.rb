class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :rules
      t.integer :minimum_days
      t.text :address
      t.integer :latitude
      t.integer :longitude
      t.boolean :is_authorized ,default: false
      t.integer :user_id
      t.integer :city_id
      t.timestamps null: false
    end
  end
end
