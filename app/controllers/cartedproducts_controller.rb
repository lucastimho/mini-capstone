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
  def destroy
    carted_products = current_user.carted_products.destroy_by(id: params[:id], status: "carted")
    carted_products.status = "removed"
    carted_products.save
    render json: {Message: "Product is removed"}
  end
end
