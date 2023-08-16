class Food < ApplicationRecord
  has_one :coupon, class_name: Coupon, foreign_key: 'food_id'
  has_many :orders
end
