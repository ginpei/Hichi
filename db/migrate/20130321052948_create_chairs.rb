class CreateChairs < ActiveRecord::Migration
  def change
    create_table :chairs do |t|
      t.references :shop, null: false
      t.integer :left
      t.integer :top
      t.integer :status

      t.timestamps
    end
    add_index :chairs, :shop_id
  end
end
