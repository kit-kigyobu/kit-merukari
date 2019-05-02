class ChangeCulmunPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :category, :category_id
  end
end
