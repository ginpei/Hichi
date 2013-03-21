class ForceScreenNameUnique < ActiveRecord::Migration
  def up
    remove_index :shops, :screen_name
    add_index :shops, :screen_name, unique: true
  end

  def down
    remove_index :shops, :screen_name
    add_index :shops, :screen_name
  end
end
