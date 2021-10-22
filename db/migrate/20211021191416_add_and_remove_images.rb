class AddAndRemoveImages < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :image_url, :string
    add_column :products, :image_id, :string
  end
end
