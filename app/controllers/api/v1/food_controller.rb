class Api::V1::FoodController < ApplicationController
  def index
    command = GetFoodList.call
    if command.success?
      render json: command.result, status: 200
    else
      render json: "Error", status: 500
    end
  end

  def show

  end

  def create
    command = CreateFood.new(params[:food]).call
    if command
      render json: { result: command.result }, status: 200
    else
      render json: { errors: "Error" }, status: 422
    end
  end

end
