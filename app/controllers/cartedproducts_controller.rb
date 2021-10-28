class CartedproductsController < ApplicationController
  def create
    cartedproduct = CartedProduct.new(
      user_id: params[:user_id],
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: params[:status],
      order_id: params[:order_id]
    )
    cartedproduct.save
    render json: cartedproduct
  end
end
