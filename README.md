# YumYard

Steps necessary to get the
application up and running.

* Ruby version: `3.0.0`
 
* Rails version: `7.0.5`

* Database: `postgres database`

* Database creation: `rails db:create && rails db:migrate`

* Gems: `bundle install`

* Run project: `rails s`

## Intro

After running the server you can hit APIs to create food, coupon and orders. Although, when creating order, `process_order.rb` will check if order is valid. If everything is valid then it will save the order otherwise throw error.

I have used rspec to test api response. Tests are built in ` spec/requests/api/v1/foods_spec.rb` file on food controller. Once test checks if the controller sets right response after creating food, another checks if controller sends right response when the api for food list is hit. 

I have used SimpleCommand gem to avoid making fat controllers and tried to abide by rules of clean code to the best of my ability.

## API
##### Create food - base_url/api/v1/food [POST}
* Paramters:
{
  "name": "icecream1",
  "image_url": "public/images/icecream_dessert.jpg",
  "stock_quantity": 100,
  "price": 5,
  "category": "appetizer"
}

##### Get food list - base_url/api/v1/food [GET]

##### Creates order - base_rul/api/v1/order/2/process_order
* Parameters:
{
  "ordered": 10,
  "coupon_token": "ABCDEFG8"
}

##### Creates Coupon - base_rul/api/v1/ 
* Parameters:
{
  "id":1,
  "food_id":1,
  "offer_amount":50
}
