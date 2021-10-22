class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :url, :description, :inventory, :is_discounted?, :tax, :total, :supplier
end
