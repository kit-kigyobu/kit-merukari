class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name, null:false
      t.text :content
      t.belongs_to :user
      t.string :author
      t.string :image_name1
      t.string :image_name2
      t.string :image_name3
      t.belongs_to :category, default:0, null:false
      t.integer :price, null: false
      t.string :class_name
      t.timestamps
    end
  end
end
