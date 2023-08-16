class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.integer :food_id
      t.string :status
      t.string :toekn
      t.integer :offer_amount
      t.datetime :expires_at

      t.timestamps
    end
  end
end
