class ProductsController < ApplicationController
  def index
    render json: Product.all
  end
  def show
    q = params["menu"].to_i
    render json: Product.find_by(id: q)
  end
  def destroy
    q = params["query"].to_i
    Product.destroy_by(id: q)
    render json: Product.all
  end
  def create
    product = Product.new(
    name: params[:name],
    price:  params[:price],
    image_url: params[:image_url],
    description: params[:description]
    )
    if product.save
      render json: product
    else
      render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
    end 
  end
  def update
    q = params["id"]
    product = Product.find_by(id: q)
    product.name = params[:name] || product.name
    product.price = params[:price] || product.price
    product.image_url = params[:image_url] || product.image_url
    product.description = params[:desciption] || product.description
    if product.save
      render json: product
    else
      render json: {errors: product.errors.full_messages}, status: 405
    end
  end
end
