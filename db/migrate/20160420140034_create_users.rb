class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.text :email, null: false
      t.string :password_hash, null: false
      t.string :password_salt, null: false
      t.timestamps null: false
    end
  end
end
