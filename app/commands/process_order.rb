# frozen_string_literal: true

class ProcessOrder
  prepend SimpleCommand
  ActiveModel::Validations

  def initialize(params)
    @params = params
  end

  def call
    food_item = Food.find_by(id: @params[:id])
    @food_item_price = food_item.price
    @food_item_quantity = food_item.stock_quantity
    @ordered_quantity = @params[:ordered]
    @total_price = calculatePrice
    # puts ordered_quantity
    order = Order.new(
      food_id: food_item.id,
      quantity: @ordered_quantity,
      coupon_id: getCouponId,
      total_price: @total_price
    )
    if order.save
      "Order Created Successfully"
    else
      coupon.errors.add(:base, :failure)
    end
  end
end

private

def doesExceedQuantity?
  @food_item_quantity < @ordered_quantity
end

def isCouponActive?
  all_coupons = Coupon.all
  @coupon_exp ||= 0
  all_coupons.each do |coupon|
    if coupon.toekn == @params[:coupon_token]
      @coupon_exp = coupon.expires_at
    end
  end
  Time.now.utc < @coupon_exp
end

def calculatePrice
  price = @food_item_quantity * @food_item_price
  if isCouponActive? == true and doesExceedQuantity? == false
    discount_percentage = findDiscount
    price = price - (price * (discount_percentage / 100))
  end
  price
end

def findDiscount
  all_coupons = Coupon.all
  @coupon_discount = 0
  @coupon_exp ||= 0
  all_coupons.each do |coupon|
    if coupon.toekn == @params[:coupon_token]
      @coupon_discount = coupon.offer_amount
      @coupon_exp = coupon.expires_at
    end
  end
end

def getCouponId
  all_coupons = Coupon.all
  @coupon_id = 0
  all_coupons.each do |coupon|
    if coupon.toekn == @params[:coupon_token]
      @coupon_id = coupon.id
    end
  end
  @coupon_id
end


