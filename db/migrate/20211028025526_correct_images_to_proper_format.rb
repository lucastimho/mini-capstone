class CorrectImagesToProperFormat < ActiveRecord::Migration[6.1]
  def change
    remove_column :images, :image_1
    remove_column :images, :image_2
    remove_column :images, :image_3
    remove_column :images, :image_4
    add_column :images, :url, :string
    add_column :images, :product_id, :integer
    add_column :images, :alt_text, :string
  end
end
