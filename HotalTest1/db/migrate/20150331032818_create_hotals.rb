class CreateHotals < ActiveRecord::Migration
  def change
    create_table :hotals do |t|
      t.string :name
      t.string :address
      t.integer :lat
      t.integer :lon
      t.string :tel
      t.string :username
      t.string :password
      t.integer :is_admin
      t.integer :status

      t.timestamps
    end
  end
end
