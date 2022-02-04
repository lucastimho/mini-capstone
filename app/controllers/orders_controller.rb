class OrdersController < ApplicationController
  # def create
  #   if current_user
  #     order = Order.new(
  #       user_id: current_user.id,
  #       product_id: params["product_id"],
  #       quantity: params["quantity"],
  #       subtotal: Product.find_by(id: params["product_id"]).price * params["quantity"],
  #       tax: Product.find_by(id: params["product_id"]).tax * params["quantity"],
  #       total: Product.find_by(id: params["product_id"]).total * params["quantity"]
  #     )
  #   else
  #     render json: {error: "Please log in!"}
  #   end
  #   if order.save
  #     render json: order
  #   else 
  #     render json: {error: order.errors.full_messages}, status: :unprocessable_entity
  #   end
  # end
  def show
    if current_user
      render json: current_user.orders.find_by(id: params[:id])
    else
      render json: {error: "Please log in!"}
    end
  end
  def index
    if current_user
      render json: current_user.orders
    else
      render json: {error: "Please log in!"}
    end
  end
  # def create
  #   carted_products = current_user.carted_products.where(status: "carted")
  #   calculated_subtotal = 0
  #   carted_products.each do |n|

  #   end
  # end
end
