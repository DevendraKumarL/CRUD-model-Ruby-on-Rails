class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :tags, index: true
      t.string :product_name
      t.string :image
      t.text :info
      t.float :price
      t.integer :rating
      t.timestamps null: false
    end
  end
end
