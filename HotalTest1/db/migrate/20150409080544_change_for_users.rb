class ChangeForUsers < ActiveRecord::Migration
  def up
    
     add_column :users,:status,:integer
     
  end

  def down
  end
end
