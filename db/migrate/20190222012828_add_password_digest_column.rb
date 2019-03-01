class AddPasswordDigestColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password_degist, :string
    remove_column :users, :password, :string
  end
end
