class ChangePostsCollumn < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :author, :string
    remove_column :posts, :subject, :string
    rename_column :posts, :book_name, :name
  end
end
