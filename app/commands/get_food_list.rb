# frozen_string_literal: true

class GetFoodList
  prepend SimpleCommand
  include ActiveModel::Validations

  def call
    food_list = Food.all
    if Food.nil?
      errors.add(:base, :failure)
    else
      food_list
    end
  end
end
