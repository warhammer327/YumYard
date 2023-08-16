# frozen_string_literal: true

class CreateFood
  prepend SimpleCommand
  include ActiveModel::Validations
  attr_reader :req_body

  def initialize(req_body)
    @req_body = req_body
  end

  def call
    food = Food.new(
      name: req_body[:name],
      image_url: req_body[:image_url],
      stock_quantity: req_body[:stock_quantity],
      price: req_body[:price],
      category: req_body[:category]
    )

    if food.save
      "Food Created"
    else
      food.errors.add(:base, :failure)
      nil
    end
  end
end

