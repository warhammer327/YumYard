# frozen_string_literal: true

class CreateCoupon
  prepend SimpleCommand
  ActiveModel::Validations

  def initialize(params)
    @params = params
  end

  def call
    coupon = Coupon.new(
      id: @params[:id],
      food_id: @params[:food_id],
      status: set_status,
      toekn: generate_token,
      offer_amount: @params[:offer_amount],
      expires_at: set_expiration
    )
    if coupon.save
      "Coupon Created Successfully"
    else
      coupon.errors.add(:base, :failure)
    end
  end

  private

  def generate_token
    SecureRandom.hex(4)
  end

  def set_status
    if Time.now.utc > set_expiration
      "inactive"
    else
      "active"
    end
  end
  def set_expiration
    50.minutes.from_now
  end
end
