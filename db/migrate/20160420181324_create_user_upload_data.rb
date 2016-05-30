class CreateUserUploadData < ActiveRecord::Migration
  def change
    create_table :user_upload_data do |t|
      t.references :users, index: true
      t.text :shopName, null: false
      t.text :offers, null: false
      t.float :startingPrice, null: false
      t.date :endDate, null: false
    end
  end
end
