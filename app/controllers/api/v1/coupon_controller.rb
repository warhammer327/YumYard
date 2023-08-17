class Api::V1::CouponController < ApplicationController
  def index
  end

  def show
  end

  def create
    command = CreateCoupon.call(params)
    if command.success?
      render json: {result: command.result}, status: 200
    else
      render json: {result: "Error"}, status: 500
    end
  end

  def update
  end

  def destroy
  end
end
