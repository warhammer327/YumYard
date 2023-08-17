class Api::V1::OrderController < ApplicationController
  def index
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  def process_order
    command = ProcessOrder.call(params)
    if command.success?
      render json: { result: command.result }, status: 200
    else
      render json: { result: "Error" }, status: 500
    end
  end
end
