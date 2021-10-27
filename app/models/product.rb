class Product < ApplicationRecord
  belongs_to :supplier
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  validates :name, :price, presence: true
  validates :price, numericality: true
  validates :price, numericality: { greater_than: 0 }
  validates :name, uniqueness: true
  validates :name, :description, length: { minimum: 2 }
  def supplier
    Supplier.find_by(id: supplier_id)
  end
  def url
    Image.find_by(id: image_id)
  end
  def is_discounted?
    price <= 5 
  end
  def tax
    result = price * 0.09
  end
  def total
    total = price + tax
  end
end
