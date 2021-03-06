class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:show, :index]
  def index
    if params[:category]
      category = Category.find_by(name: params[:category])
      product = category.products
      render json: product
    elsif params[:sort] == "price"
      if params[:sort_order] == "desc"
        # render json: Product.all.order(:price, :desc)
      else
        render json: Product.all.order(:price)
      end
    else
      render json: Product.all
    end
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
