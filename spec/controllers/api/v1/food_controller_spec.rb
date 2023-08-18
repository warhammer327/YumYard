# spec/controllers/api/v1/food_controller_spec.rb

require 'rails_helper'

RSpec.describe Api::V1::FoodController, type: :controller do
  describe "GET #index" do
    it "returns a successful response with a list of foods" do
      allow(GetFoodList).to receive(:call).and_return(CommandResult.new(true, [food1, food2])) # Replace with actual food instances

      get :index
      expect(response).to have_http_status(200)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).to be_an(Array)
      expect(parsed_response.length).to eq(2) # Adjust based on the number of foods returned
    end

    it "returns an error response on failure" do
      allow(GetFoodList).to receive(:call).and_return(CommandResult.new(false))

      get :index
      expect(response).to have_http_status(500)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new food" do
        food_params = { name: "New Food", calories: 100 }
        allow(CreateFood).to receive_message_chain(:new, :call).and_return(CommandResult.new(true, { result: food_params })) # Replace with actual food instance

        post :create, params: { food: food_params }
        expect(response).to have_http_status(200)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response["result"]).to eq(food_params)
      end
    end

    context "with invalid params" do
      it "returns an error response" do
        allow(CreateFood).to receive_message_chain(:new, :call).and_return(nil)

        post :create, params: { food: { name: "" } }
        expect(response).to have_http_status(422)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response["errors"]).to eq("Error")
      end
    end
  end
end
