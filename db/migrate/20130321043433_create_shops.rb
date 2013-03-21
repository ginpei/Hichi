class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :screen_name, null: false
      t.string :name

      t.timestamps
    end

    add_index :shops, :screen_name, unitue: true
  end
end
