require 'rails_helper'

RSpec.describe "Api::V1::Foods", type: :request do
  describe "GET /api/v1/foods" do
    it "get food works" do
      get "/api/v1/food"
      expect(response).to have_http_status(200)
    end
  end
  describe "POST /api/v1/foods" do
    it "creates a food and returns success" do
      food_params = {
        name: "Pizza",
        image_url: "pizza.jpg",
        stock_quantity: 10,
        price: 12.99,
        category: "Italian"
      }

      post "/api/v1/food", params: { food: food_params }

      expect(response).to have_http_status(200)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response["result"]).to eq("Food Created Successfully")
    end
  end
end
