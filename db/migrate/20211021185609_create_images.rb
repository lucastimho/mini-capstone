class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :image_1
      t.string :image_2
      t.string :image_3
      t.string :image_4

      t.timestamps
    end
  end
end
