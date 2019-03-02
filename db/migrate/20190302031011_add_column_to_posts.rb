class AddColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :image_name1, :string
    add_column :posts, :image_name2, :string
    add_column :posts, :image_name3, :string
    add_column :posts, :category, :int
    add_column :posts, :price, :int
  end
end
