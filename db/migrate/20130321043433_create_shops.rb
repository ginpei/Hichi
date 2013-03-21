class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :screen_name
      t.string :name

      t.timestamps
    end
  end
end
