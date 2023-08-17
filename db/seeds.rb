Food.create(
  name: "meatball",
  image_url: "public/images/meatball_main_course.jpg",
  stock_quantity: 10,
  price: 100,
  category: "main_course"
)
Food.create(
  name: "icecream",
  image_url: "public/images/icecream_dessert.jpg",
  stock_quantity: 100,
  price: 10,
  category: "dessert"
)
Coupon.create(
  food_id: 2,
  status: "active",
  toekn: "ABCD1234",
  offer_amount: 50,
  expires_at: "2023-08-17T19:06:01.391Z"
)

Order.create(
  food_id: 2,
  quantity: 2,
  coupon_id: 1,
  total_price: 10
)



