class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :introduction
      t.integer :item_price
      t.boolean :is_active
      t.integer :genre_id, foreign_key: true

      t.timestamps
    end
  end
end
