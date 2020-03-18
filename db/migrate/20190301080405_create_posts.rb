class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :content
      t.belongs_to :user
      t.string :author
      t.string :image_name1
      t.string :image_name2
      t.string :image_name3
      t.integer :category_id
      t.integer :price
      t.string :class_name
      t.timestamps
    end
  end
end
