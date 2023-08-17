class Food < ApplicationRecord
  has_many :orders
  has_one :coupon
end
