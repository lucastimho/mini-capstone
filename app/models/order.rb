class Order < ApplicationRecord
  has_many :user, through: :carted_products
  belongs_to :order
end
