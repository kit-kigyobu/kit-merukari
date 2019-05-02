class ChangeCulmunPosts2 < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :class_name, :string
  end
end
