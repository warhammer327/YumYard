class Order < ApplicationRecord
  belongs_to :food
  belongs_to :coupon, optional: true
end
