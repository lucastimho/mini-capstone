class SuppliersController < ApplicationController
  def index
    render json: Supplier.all
  end
  def show
    q = params["menu"].to_i
    render json: Supplier.find_by(id: q)
  end
  def destroy
    q = params["query"].to_i
    Supplier.destroy_by(id: q)
    render json: Supplier.all
  end
  def create
    supplier = Supplier.new(
    name: params["name"],
    email:  params["email"],
    phone_number: params["phone_number"]
    )
    if supplier.save
      render json: supplier
    else
      render json: {errors: supplier.errors.full_messages}, status: :unprocessable_entity
    end 
  end
  def update
    q = params["id"]
    supplier = Supplier.find_by(id: q)
    supplier.name = params["name"] || supplier.name
    supplier.email = params["email"] || supplier.email
    supplier.phone_number = params["phone_number"] || supplier.phone_number
    if supplier.save
      render json: supplier
    else
      render json: {errors: supplier.errors.full_messages}, status: 405
    end
  end
end
