class Product < ApplicationRecord
  validates :name, :price, :image_url, presence: true
  validates :price, numericality: true
  validates :price, numericality: { greater_than: 0 }
  validates :name, :image_url, uniqueness: true
  validates :name, :description, length: { minimum: 2 }
  def f_created_at
    created_at.strftime("%A, %d %b %Y %l:%M %p")
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
