class Api::V1::FoodController < ApplicationController
  def index
    command = GetFoodList.call
    if command.success?
      render json: command, status: 200
    else
      render json: "Error", status: 200
    end
  end

  def show
  end

  def create
    food = Food.new(
      name: req_body[:name],
      image_url: req_body[:image_url],
      stock_quantity: req_body[:stock_quantity],
      price: req_body[:price],
      category: req_body[:category]
    )
    if food.save
      render json: food, status: 200
    else
      render json: {
        error: "Error..."
      }
    end
  end

  def update
  end

  def destroy
  end

  private
  def req_body
    params.require(:food).permit([
      :name,
      :image_url,
      :stock_quantity,
      :price,
      :category])
  end
end
