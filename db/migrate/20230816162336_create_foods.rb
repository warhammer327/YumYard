class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :image_url
      t.integer :stock_quantity
      t.integer :price
      t.string :category

      t.timestamps
    end
  end
end
