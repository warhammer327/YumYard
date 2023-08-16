class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :food_id
      t.integer :quantity
      t.integer :coupon_id
      t.integer :total_price

      t.timestamps
    end
  end
end
