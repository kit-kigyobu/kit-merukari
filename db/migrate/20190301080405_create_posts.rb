class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :book_name
      t.text :content
      t.integer :user_id
      t.string :subject

      t.timestamps
    end
  end
end
