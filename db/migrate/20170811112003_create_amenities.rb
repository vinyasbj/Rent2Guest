class CreateAmenities < ActiveRecord::Migration[5.1]
  def change
    create_table :amenities do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
