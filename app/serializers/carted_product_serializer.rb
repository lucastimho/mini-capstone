class CartedProductSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :status, :order_id
end
