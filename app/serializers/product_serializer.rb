class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :url, :description, :inventory, :is_discounted?, :tax, :total, :supplier

  belongs_to :category_products
  has_many :categories
end
