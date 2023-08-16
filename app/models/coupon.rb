class Coupon < ApplicationRecord
  belongs_to :food
  has_many :orders
end
