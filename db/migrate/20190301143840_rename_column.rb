class RenameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :password_degist, :password_digest
  end
end
