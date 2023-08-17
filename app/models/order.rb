class Order < ApplicationRecord
  has_one :coupon
  has_one :food
end
