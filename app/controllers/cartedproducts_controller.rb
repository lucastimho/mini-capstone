class CartedproductsController < ApplicationController
  before_action :authenticate_user
  def create
    cartedproduct = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"
    )
    cartedproduct.save
    render json: cartedproduct
  end
  def index
    render json: CartedProduct.where(user_id: current_user.id, status: "carted")
  end
end
