class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
    	t.string :name
    	t.integer :std_class
    	t.references :school, foreign_key: true
      t.timestamps
    end
  end
end
